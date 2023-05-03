module CreateTableUsers

import SearchLight.Migrations: create_table, column, columns, pk, add_index, drop_table, add_indices

function up()
  create_table(:users) do
    [
      pk()
      columns([
        :email => :string
        :password => :string
      ])
    ]
  end

  add_index(:users, :email)
  add_index(:users, :password)

end

function down()
  drop_table(:users)
end

end
