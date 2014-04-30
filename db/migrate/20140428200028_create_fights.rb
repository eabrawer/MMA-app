class CreateFights < ActiveRecord::Migration
  def change
    create_table :fights do |t|
      t.belongs_to :fight_card
      t.string :division
      t.timestamps
    end
  end
end
