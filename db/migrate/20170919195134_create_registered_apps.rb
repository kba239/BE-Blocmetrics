class CreateRegisteredApps < ActiveRecord::Migration
  def change
    create_table :registered_apps do |t|

      t.timestamps null: false
    end
  end
end
