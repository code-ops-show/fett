class Employee < User
	has_one :resume, foreign_key: 'user_id'
end