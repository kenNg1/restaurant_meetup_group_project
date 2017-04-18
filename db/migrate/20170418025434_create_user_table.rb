class CreateUserTable < ActiveRecord::Migration[5.0]
  def change

    create_table(:users) do |t|
      t.column(:name, :string)
      t.column(:username, :string)
      t.column(:password, :string)
      t.column(:cuisine_id, :integer)
      t.column(:district_id, :integer)
      t.column(:budget_id, :integer)

      t.timestamps()
    end
  end
end
