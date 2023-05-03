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
end

end
