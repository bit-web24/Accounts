module UserDetails

export Details

include("../app/resources/creds/Creds.jl")
using .Creds

struct Details
    username::AbstractString
    email::AbstractString
    credentials::Array{Cred}
end

end