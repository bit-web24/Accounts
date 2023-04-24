(pwd() != @__DIR__) && cd(@__DIR__) # allow starting app from bin/ dir

using Accounts
const UserApp = Accounts
Accounts.main()
