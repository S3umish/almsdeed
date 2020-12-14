class CreateMissions < ActiveRecord::Migration
  def change
    create_table :missions do |t|
      t.string :title
      t.datetime :startdate
      t.datetime :enddate
      t.integer :user_id
      t.text :description
    end
  end
end
