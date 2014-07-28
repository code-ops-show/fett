class AddJobIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :job_id, :integer
  end
end
