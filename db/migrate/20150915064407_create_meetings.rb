class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.text :title
      t.text :description
      t.datetime :date
      t.string :location, limit: 30

      t.timestamps null: false
    end
  end
end
