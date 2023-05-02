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
      ])
    ]
  end

  add_index(:creds, :usr)
  add_index(:creds, :username)
  add_index(:creds, :password)
  add_index(:creds, :email)

end

function down()
  drop_table(:creds)
end

end
