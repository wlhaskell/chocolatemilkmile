class Participant < ActiveRecord::Base
	belongs_to :registration

	validates :name, :level, presence: true
end
