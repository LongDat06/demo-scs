require "./items.rb"
require "./service_container.rb"

class Container
	include ServiceContainer
	attr_accessor :container_type
	
	def initialize container_type
		@container_type = container_type
		@@items = []
	end

	def self.price_container(container)
		puts "Container type: #{container.container_type}"
		@@items.each {|record| Item.price_item(record)}
	end

	def additems (item)
		@@items << item
	end

	def height_max
		max_height = @@items.reduce(0) do |max, record|
			record.height > max ? record.height : max
		end
		max_height
	end

	def total_lenght
		total_lenght = @@items.reduce(0) do |total, record|
			total + record.height 
		end
		total_lenght
	end

	def total_weight
		total_weight = @@items.reduce(0) do |total, record|
			total + record.weight 
		end
		total_weight
	end

	def container_type_action
		@@items.each do |record|
			if container_type == "FR20" || container_type == "FR40"
				record.set_height_max(height_max)
				record.flatrack(container_type)
			elsif container_type == "OT20" || container_type == "OT40"
				record.open_top(container_type)
			end
		end

		zone_K
	end

	def final
		puts "*********Final********** "
		@@items.each do |item|
			if item.cog_height_type == "TBA"
				 return puts "This acceptance check has to be done again after COG height is determined. This result assuming that the COG is half height of the cargo as you inputted TBA for COG. "
			end
		end

		puts "Sản phẩm có thể vận chuyển"
	end
end



