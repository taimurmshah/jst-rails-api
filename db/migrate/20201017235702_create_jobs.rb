class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.string :company
      t.string :website
      t.string :linkedin
      t.string :link
      t.belongs_to :user

      t.timestamps
    end
  end
end
