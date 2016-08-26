class Registration < ActiveRecord::Base
	has_many :participants

	accepts_nested_attributes_for :participants

	validates :street,:city, :state, :zip, :donation, presence: true

end
