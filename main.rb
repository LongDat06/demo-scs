require "./items.rb"
require "./Container.rb"

# packing_style, length, width, height, weight, cog_height_type, cog_height

container  = Container.new("FR40")
a = Item.new("CASE",300,300,100,1,"MANUAL",100)
b = Item.new("BARE",50,500,1000,5,"TBA",2)


container.additems(a)
container.additems(b)

Container.price_container(container)
Item.total_item
container.container_type_action

