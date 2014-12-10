class Task < ActiveRecord::Base

	validates :name, :due_date, presence: true
	validates :completed, inclusion: { in: %w(true false),
		message: "%{value} is not valid."}

	before_save :default_values
	def default_values()
		self.due_date ||= 'Time.now.date'
		self.completed ||= 'false'
	end

	def complete!()
    	self.completed = true
  	end

  	def reset!()
  		self.completed = false
  	end

  	def complete?()
  		if self.completed == true
  			return true
  		end
  	end

  	def incomplete?()
  		if self.completed == false
  			return true
  		end 
  	end

  	def notes_preview()
  		if self.notes == nil
  			return nil
  		else
  			return "first 40 characters of notes"
  		end
  	end

end