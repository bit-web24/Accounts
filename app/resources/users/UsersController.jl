module UsersController

using Genie.Renderer.Html
  
function auth()
  html(:users, :auth)
end

function login()
  html(:users, :signup)
end

function signup()
  html(:users, :login)
end

end
