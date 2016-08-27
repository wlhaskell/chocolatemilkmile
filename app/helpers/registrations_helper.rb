module RegistrationsHelper

	def registration_levels
		{
      "Timmy's Trailblazers" => 3,
      "Timmy's Triers" => 2,
      "Timmy's Toddlers" => 1,
      "Timmy's Tribe" => 0
     }
	end

	def shirt_sizes
		{
      'X-Small' => 0,
      'Small' => 1,
      'Medium' => 2,
      'Large' => 3,
      'X-Large' => 4
    }
	end

	def link_to_add_participant(f, association, index)
		participant = Participant.new
		id = index + 1
		fields = render('participant', {f:f, id: id}) 
	end

	def calculate_total(registration)
		total = 0
		registration.participants.each do |participant|
			if participant.level != 0
				total += 15
			end
		end
		total += registration.donation
	end
end
