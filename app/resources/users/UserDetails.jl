module UserDetails

export Details

# include(joinpath(pwd(), "app/resources/creds/Creds.jl"))
# using .Creds
using Accounts.Creds

struct Details
    username::String
    email::String
    credentials::Vector{Cred}
end

end