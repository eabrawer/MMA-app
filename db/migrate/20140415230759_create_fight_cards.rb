class CreateFightCards < ActiveRecord::Migration
  def change
    create_table :fight_cards do |t|
      t.belongs_to :user
	  t.string :title
	  t.string :city
	  t.string :start_time
      t.timestamps
    end
  end
end
