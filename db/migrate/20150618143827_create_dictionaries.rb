class CreateDictionaries < ActiveRecord::Migration
  def change
    create_table :dictionaries do |t|
      t.string :first_name
      t.string :last_name
      t.string :age
      t.string :address
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :company
      t.string :email
      t.string :job_title
      t.string :phone

      t.timestamps null: false
    end
  end
end
