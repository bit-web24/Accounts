module EmailValidator

export is_valid_email, extract_username

function is_valid_email(email::AbstractString)::Bool
    # regular expression pattern for email validation
    pattern = r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"
    return occursin(pattern, email)
end

function extract_username(email::AbstractString)::AbstractString
    parts = split(email, "@")
    if length(parts) == 2
        return parts[1]
    else
        throw(ArgumentError("Invalid email address: $email"))
    end
end

end