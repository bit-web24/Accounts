module UsersController

using Genie.Renderer.Html
using Accounts.Users
using Genie.Router, Genie.Renderer
using SearchLight
using SearchLightSQLite

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
    find(User, email=params(:email))[end]; @info "User already exist!"
    redirect(:log_in)
  catch err
    User(email=params(:email), password=params(:password)) |> save
    @info "Successfully Saved Credentials!"
    redirect(:dashboard)
  end
end

function login_auth()
  try
    user = find(User, email=params(:email))[end]
    if user.password == params(:password)
      @info "Successfully Authenticated!"
      redirect(:dashboard)
    else
      @error "Incorrect Credentials"
      redirect(:log_in)
    end
  catch error
    if isa(error, BoundsError)
      @info "No user found with Email: $(params(:email))"
      redirect(:sign_up)
    end
  end
end

function dashboard()
  # show users dashboard
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
