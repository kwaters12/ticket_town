class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :title
      t.text :body
      t.boolean :status, default: false

      t.timestamps
    end
  end
end
