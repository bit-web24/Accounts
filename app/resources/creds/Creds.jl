module Creds

import SearchLight: AbstractModel, DbId
import Base: @kwdef

export Cred

@kwdef mutable struct Cred <: AbstractModel
  id::DbId = DbId()
  usr::Int = 0
  username::String = ""
  password::String = ""
  email::String = ""
  firstname::String = ""
  lastname::String = ""
  website::String = ""
  location::String = ""
  dob::String = ""
end

end
