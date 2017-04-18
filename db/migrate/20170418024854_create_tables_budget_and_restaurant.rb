class CreateTablesBudgetAndRestaurant < ActiveRecord::Migration
  def change
    create_table(:budgets) do |t|
      t.column(:scale, :integer)
      t.timestamps()
    end
    create_table(:restaurants) do |t|
      t.column(:name, :string)
      t.column(:address, :string)
      t.column(:phone, :integer)
      t.column(:district_id, :integer)
      t.column(:cuisine_id, :integer)
      t.column(:budget_id, :integer)
      t.timestamps()
    end
  end
end
