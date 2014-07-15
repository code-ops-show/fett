class CreateResumes < ActiveRecord::Migration
  def change
    create_table :resumes do |t|
      t.text :personality_traits
      t.text :summary
      t.string :languages
      t.text :education_history
      t.text :work_history

      t.timestamps
    end
  end
end
