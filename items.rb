require "./service_item.rb"

class Item
	include ServiceItem
	attr_accessor :packing_style, :length, :width, :height, :weight, :cog_height_type, :cog_height
	def initialize (packing_style, length, width, height, weight, cog_height_type, cog_height)
		@packing_style = packing_style
		@length = length
		@width = width
		@height = height
		@weight = weight
		@cog_height_type = cog_height_type
		@cog_height = cog_height
		@@count = 0
	end

	def set_height_max(height_max)
		@height_max = height_max
	end
	
	def self.price_item(item)
		@@count  += 1
		puts "#{item.packing_style} #{item.length} ..."
	end

	def self.total_item
		puts "Số Item: #{@@count}"
	end
end