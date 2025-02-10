class Job < ApplicationRecord
  belongs_to :user # Mechanic responsible for the job
  belongs_to :car # The car being worked on

  validates :completed, inclusion: { in: [ true, false ] }
end
