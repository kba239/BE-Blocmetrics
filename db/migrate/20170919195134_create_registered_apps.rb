class CreateRegisteredApps < ActiveRecord::Migration
  def change
    create_table :registered_apps do |t|
      t.string :name
      t.string :url
      t.integer :user_id
      t.integer :count
      t.timestamps null: false
    end
  end
end
