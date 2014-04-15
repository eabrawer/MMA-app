class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :username
    	t.string :password_digest
    	t.string :email
    	t.integer :wins
    	t.integer :losses
    	t.integer :silver, :default => 100
      t.timestamps
    end
  end
end
