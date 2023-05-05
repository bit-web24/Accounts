module UserDetails

export Details

using Accounts.Creds

struct Details
    username::String
    email::String
    credentials::Vector{Cred}
end

end