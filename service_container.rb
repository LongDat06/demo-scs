module ServiceContainer
	def zone_K
		max_lenght_concentration = 0
		case container_type
		when "FR20"
			max_lenght_concentration = 597
		when "FR40"
			max_lenght_concentration = 1217.8
		when "OT20"
			max_lenght_concentration = 589
		when "OT40"
			max_lenght_concentration = 1200
		end
		puts "Length may exceeds container dimension" if total_lenght > max_lenght_concentration
		zone_L
	end

	def zone_L
		max_weight_concentration = 0
		case container_type
		when "FR20"
			max_weight_concentration = 20
		when "FR40"
			max_weight_concentration = 38.8
		when "OT20"
			max_weight_concentration = 26.7
		when "OT40"
			max_weight_concentration =28.1
		end
		puts "Weight may exceeds max payload" if total_weight > max_weight_concentration
		final
	end
end