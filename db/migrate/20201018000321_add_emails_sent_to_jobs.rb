class AddEmailsSentToJobs < ActiveRecord::Migration[6.0]
  def change
    add_column :jobs, :emails_sent, :integer, default: 0
  end
end
