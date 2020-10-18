class CreateEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :linkedin
      t.string :position
      t.integer :emails_sent, default: 0
      t.belongs_to :job

      t.timestamps
    end
  end
end
