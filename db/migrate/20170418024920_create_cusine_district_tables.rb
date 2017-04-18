class CreateCusineDistrictTables < ActiveRecord::Migration[5.0]
  def change

    create_table(:cuisines) do |t|
      t.column(:name, :string)

      t.timestamps()
    end

    create_table(:districts) do |t|
      t.column(:name, :string)

      t.timestamps()
    end
  end
end
