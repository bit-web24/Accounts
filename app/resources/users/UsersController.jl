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
  html(:users, :signup)
end

function signup()
  html(:users, :login)
end

function authenticator()
  User(email=params(:email), password=params(:password)) |> save && redirect(:dashboard)
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
