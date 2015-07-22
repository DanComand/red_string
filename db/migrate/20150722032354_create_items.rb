class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :lent_to
      t.datetime :date_lent
      t.datetime :date_due
      t.string :phone
      t.string :email

      t.timestamps null: false
    end
  end
end
