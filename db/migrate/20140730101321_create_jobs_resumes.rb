class CreateJobsResumes < ActiveRecord::Migration
  def change
    create_table :jobs_resumes do |t|
      t.integer :job_id
      t.integer :resume_id
    end
  end
end
