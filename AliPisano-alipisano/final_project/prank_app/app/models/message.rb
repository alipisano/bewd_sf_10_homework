class Message < ActiveRecord::Base
  validates :recipient, presence: true,
                    length: { minimum: 5 }
end

#ensures recipient line is at least 5 characters long