module ServiceItem
  def flatrack(container_type)
    @container_type = container_type
    if packing_style == "BARE" || packing_style == "SKID"
      puts "Further evaluation is required. Reason : Packing style"
      zone_A
    else
      zone_A
    end
  end

  def zone_A
    case @container_type
    when "FR20"
			if width > 380 
				puts "Width exceeds criteria"
				zone_B
			else 
				zone_B
			end
    when "FR40"
			if width > 470
				puts "Width exceeds criteria"
				zone_B
			else
				zone_B
			end
    end
  end

  def zone_B
		case @container_type
		when "FR20"
			puts "Length exceeds criteria. Further evaluation by SCM is required." if length > 529
		when "FR40"
			puts "Length exceeds criteria. Further evaluation by SCM is required." if length > 1150
		end
		weight_distribution
  end

  def weight_distribution
		weight_max = 0
		case @container_type
		when "FR40"
			case length
			when 0
				weight_max = 19350
			when 100
				weight_max = 20191
			when 200
				weight_max = 21109
			when 300
				weight_max = 22114
			when 400
				weight_max = 23220
			when 500
				weight_max = 24442
			when 600
				weight_max = 25800
			when 700
				weight_max = 27318
			when 800
				weight_max = 29025
			when 900
				weight_max = 30960
			when 1000
				weight_max = 33171
			when 1100
				weight_max = 35723
			when 1200
				weight_max = 38700
			end
		when "FR20"
			case length
			when 0
				weight_max = 15350
			when 50
				weight_max = 16017
			when 100
				weight_max = 16745
			when 150
				weight_max = 17543
			when 200
				weight_max = 18420
			when 250
				weight_max = 19389				
			when 300
				weight_max = 20467
			when 350
				weight_max = 21671
			when 400
				weight_max = 23025
			when 450
				weight_max = 24560
			when 500
				weight_max = 26314
			when 550
				weight_max = 28338
			when 600
				weight_max = 30700
			end
		end
		puts "Weight Distribution exceeds criteria. Further evaluation by SCM is required." if weight > weight_max
		zone_C
  end

  def zone_C
		puts "Height exceeds criteria" if height > 518
    cog_calculation
  end

  def cog_calculation
		if cog_height_type == "HALF HEIGHT"
			zone_D_1
		elsif cog_height_type == "TBA"
			puts "This acceptance check has to be done again after COG height is determined. This result assuming that the COG is half height of the cargo as you inputted TBA for COG."
			zone_D_1
		elsif cog_height_type == "MANUAL"
			zone_D_2
		end
  end

  def zone_D_1
		zone_E if width <= 243
		case @container_type
		when "FR20"
			zone_F if width > 243 || width < 380
		when "FR40"
			zone_F if width > 243 || width < 470
		end
  end

  def zone_D_2
		zone_H if width <= 243
		case @container_type
		when "FR20"
			zone_G if width > 243 || width < 380
		when "FR40"
			zone_G if width > 243 || width < 470
		end
  end

  def zone_E
		cog_value = @height_max/2
		max_cog_height = width * 0.865
		if cog_value > max_cog_height 
			puts "COG Height exceeds criteria "
		else  # <=
			puts "ok"
		end
  end
  
  def zone_F
		cog_value = @height_max/2
		if cog_value > 190 #max_cog_height
			puts "COG Height exceeds criteria "
		else # <=
			puts "ok"
		end 
  end
  
  def zone_G
		if cog_height > 190 #max_cog_height
				puts "COG Height exceeds criteria "
		else # <=
			puts "ok"
		end 
  end

  def zone_H
		max_cog_height = width * 0.865
		if cog_height > max_cog_height 
			puts "COG Height exceeds criteria "
		else # <=
			puts "ok"
		end 
  end

  def open_top(container_type)
		@container_type = container_type
		if packing_style == "BARE" 
			puts "Further evaluation is required. Reason : Packing style"
		elsif packing_style == "CASE"
			cog_height_calculation
		end
  end

  def cog_height_calculation
		if cog_height_type == "TBA"
			puts "This acceptance check has to be done again after COG height is determined. This result assuming that the COG is half height of the cargo as you inputted TBA for COG. "
		end
		zone_I
  end

  def zone_I
		if cog_height_type == "MANUAL"
			puts "COG Height exceeds criteria" if cog_height > 211 #max_cog_height
		elsif cog_height_type == "HALF HEIGHT" || cog_height_type == "TBA"
			var = cog_height/2
			puts "COG Height exceeds criteria" if var > 211 #max_cog_height
		end
		zone_J
  end

  def zone_J
		weight_concentration = weight/length
		case @container_type
		when "OT20"
			max_weight_concentration = 3
		when "OT40"
			max_weight_concentration = 4.5
		end
		if weight_concentration > max_weight_concentration
			puts "Weight concentration exceeds criteria"
		else
			puts "ok"
		end
  end
end