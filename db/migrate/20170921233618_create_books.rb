class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :publisher
      t.string :isbn
      t.date :publishing_date

      t.timestamps
    end
  end
end
