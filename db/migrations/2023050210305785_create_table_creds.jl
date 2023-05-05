module CreateTableCreds

import SearchLight.Migrations: create_table, column, columns, pk, add_index, drop_table, add_indices

function up()
  create_table(:creds) do
    [
      pk()
      columns([
        :usr      => :int
        :username => :string
        :password => :string
        :email    => :string
        :firstname=> :string
        :lastname => :string
        :website  => :string
        :location => :string
        :dob      => :string
      ])
    ]
  end

  add_index(:creds, :usr)
  add_index(:creds, :username)
  add_index(:creds, :password)
  add_index(:creds, :email)
  add_index(:creds, :firstname)
  add_index(:creds, :lastname)
  add_index(:creds, :website)
  add_index(:creds, :location)
  add_index(:creds, :dob)

end

function down()
  drop_table(:creds)
end

end
