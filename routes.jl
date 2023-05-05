using Genie.Router, Genie.Renderer
using Accounts.UsersController
using Accounts.CredsController

route("/") do
  serve_static_file("welcome.html")
end

route("/auth", UsersController.auth, named=:auth)

route("/auth/signup", UsersController.signup, named= :sign_up)
route("/auth/login", UsersController.login, named= :log_in)

route("/login_auth", UsersController.login_auth, method=POST ,named= :login_auth)
route("/signup_auth", UsersController.signup_auth, method=POST ,named= :signup_auth)
route("/dashboard", UsersController.dashboard, named= :dashboard)
route("/add_account", CredsController.add_account, named=:add_account, method=POST)
route("/logout", UsersController.logout, named= :logout)