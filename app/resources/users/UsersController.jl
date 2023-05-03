module UsersController

export UsersController

using Genie.Renderer.Html
using Accounts.Users, Accounts.Creds
using Genie.Router, Genie.Renderer
using SearchLight
using SearchLightSQLite
import SearchLight: DbId

include("../../../lib/EmailValidator.jl")
include("../../../lib/UserDetails.jl")

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
    if is_valid_email(params(:email))
      User(email=params(:email), password=params(:password)) |> save
      @info "Signup Successfully!"
      global __ID__ = find(User, email=params(:email))[end].id
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
  user = find(User, id=__ID__)[end] #need some attention
  creds = find(Cred, usr=__ID__)
  user = Details(extract_username(user.email), user.email, creds)
  html(:users, :dashboard, user=user)
end

module API
using ..UsersController
using Genie.Renderer.Json
using SearchLight
using Accounts.Users

function users()
  json(:users, :users_data, users=all(User))
end

end

end
