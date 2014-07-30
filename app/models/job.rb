class Job < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	has_and_belongs_to_many :resumes
	#Validations
	validates :user_id, presence: true
	validates :title, length: { minimum: 10 }, presence: true
	# validates :url, format: {with: Regexp.new(URI::regexp(%w(http https)))}, presence: true
end


