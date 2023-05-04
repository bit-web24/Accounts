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

    Cred(usr=SessionId, username=params(:username), email=params(:email), password=params(:password)) |> save && redirect(:dashboard)
  end

end
