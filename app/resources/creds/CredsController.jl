module CredsController
export CredsController

using Genie.Renderer.Html
using Accounts.Creds
using Genie.Router, Genie.Renderer
using SearchLight, SearchLightSQLite

function add_account()
  sessionf = open(joinpath(pwd(), "SESSIONID.txt"))
  SessionId = parse(Int, read(sessionf, String))
  close(sessionf)

  Cred(usr=SessionId,
    website=params(:website),
    firstname=params(:firstname),
    lastname=params(:lastname),
    username=params(:username),
    email=params(:email),
    password=params(:password),
    dob=params(:dob),
    location=params(:location)) |> save && redirect(:dashboard)
end

end
