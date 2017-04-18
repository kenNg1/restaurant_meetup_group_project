class CreateJoinTableMatches < ActiveRecord::Migration
  def change
    create_table(:matches) do |t|
      t.column(:user1_id, :integer)
      t.column(:user2_id, :integer)
      t.column(:user1_like, :boolean)
      t.column(:user2_like, :boolean)
      t.column(:restaurant_id, :integer)
      t.timestamps()
    end
  end
end
