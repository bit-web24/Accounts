module UsersController

export UsersController

using Genie.Renderer.Html
using Accounts.Users, Accounts.Creds
using Genie.Router, Genie.Renderer
using SearchLight
using SearchLightSQLite
import SearchLight: DbId

include(joinpath(pwd(), "lib/EmailValidator.jl"))
include(joinpath(pwd(), "app/resources/users/UserDetails.jl"))

using .EmailValidator
using .UserDetails

__ID__::DbId = 0

function auth()
  html(:users, :auth)
end

function login()
  html(:users, :login)
end

function signup()
  html(:users, :signup)
end

function signup_auth()
  try
    find(User, email=params(:email))[end]
    @warn "User already exist!"
    redirect(:log_in)
  catch err
    if is_valid_email(params(:email)) && (params(:password) != "" || length(params(:password)) < 8)
      User(email=params(:email), password=params(:password)) |> save
      @info "Signup Successfully!"
      global __ID__ = find(User, email=params(:email))[end].id
      #store the session id to file
      sessionf = open(joinpath(pwd(), "SESSIONID.txt"), "w")
      write(sessionf, string(__ID__))
      close(sessionf)
      #redirect to dashboard page of the current user
      redirect(:dashboard)
    else
      @warn "Invalid Credentials"
      redirect(:sign_up)
    end
  end
end

function login_auth()
  try
    user = find(User, email=params(:email))[end]
    if user.password == params(:password)
      @info "Successfully Authenticated!"
      global __ID__ = user.id
      #store the session id to file
      sessionf = open(joinpath(pwd(), "SESSIONID.txt"), "w")
      write(sessionf, string(__ID__))
      close(sessionf)
      #redirect to dashboard page of the current user
      redirect(:dashboard)
    else
      @error "Incorrect Credentials"
      redirect(:log_in)
    end
  catch error
    if isa(error, BoundsError)
      @error "No user found with Email: $(params(:email))"
      redirect(:sign_up)
    end
  end
end

function dashboard()
  try
    user = find(User, id=__ID__)[end]
    creds = find(Cred, usr=__ID__)
    user = Details(string(extract_username(user.email)), user.email, creds)
    html(:users, :dashboard, user=user)
  catch err
    @warn "Not Loged in: __ID__=$__ID__"
    redirect(:auth)
  end
end

function logout()
  global __ID__ = 0
  #store the session id to file
  sessionf = open(joinpath(pwd(), "SESSIONID.txt"), "w")
  write(sessionf, string(__ID__))
  close(sessionf)
  redirect(:auth)
end

end
