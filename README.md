Đề bài
Container:
  container_type: (FR20, FR40, OT20, OT40)
  items: array of Item

Item:
  packing_style: (CASE, CRATE, SKID, BARE)
  length: int
  width: int
  height: int
  weight: float
  cog_height_type: (manual, TBA, half_of_cargo_height_or_less)
  cog_height: float (required if cog_height_type is manual)

Input data:
{
  "container_type":"FR20",
  "items":[
    {
      "packing_style":"case",
      "length":"123",
      "width":"123",
      "height":"123",
      "weight":"123",
      "cog_height":"123",
      "cog_height_type":"manual"
    },
    {
      "packing_style":"crate",
      "length":"1234",
      "width":"23",
      "height":"213",
      "weight":"12",
      "cog_height_type":"tba"
    }
  ]
}

Output data:
{
  "container_type":"FR20",
  "items":[
    {
      "packing_style":"case",
      "length":"123",
      "width":"123",
      "height":"123",
      "weight":"123",
      "cog_height":"123",
      "cog_height_type":"manual",
      "result": "ng",
      "remark": "Weight Distribution exceeds criteria. Further evaluation by SCM is required.\nCOG Height exceeds criteria"
    },
    {
      "packing_style":"crate",
      "length":"1234",
      "width":"23",
      "height":"213",
      "weight":"12",
      "cog_height_type":"tba",
      "result": "ok"
    }
  ],
  total_length: 1234,
  total_weight: 123,
  total_result: "ng",
  total_remark: "Length may exceeds Container demension\nWeight may exceeds Max Payload",
  final_conclusion: "ng" # ng/tba/ok
}

Module ServiceContainer: chứa method xử lý của object Container
Module ServiceItem: chứa method xử lý của object Item
Container
Item

####

Hướng dẫn sử dụng:

Create object Container với loại container ("FR20", "FR40", "OT20", hoặc "OT40")
Create các object Item với thông số tương ứng: length, width, height, weight, cog_height_type, cog_height
Call method additems trên object Container để thêm các object Item vào
Call method detail_container của object Container mới khởi tạo để hiển thị thông tin về loại container và detail item của container đó.
Call method total_item trên lớp Item để hiển thị tổng số item của container.
Call method container_type_action trên object Container để kiểm tra sự phù hợp của container và các item trong đó.

########

Use Module (Sử dụng Module): Module được sử dụng để chứa các method và include vào các class để chia sẻ chung các method đó.
Vd: Module ServiceContainer và ServiceItem được include vào các class để sử dụng các method trong module.

Block: Các khối mã được sử dụng trong một số method và control structure như each, if, else, do...end, reduce do, each{| |}

String: "FR20", "FR40", "OT20", "OT40"...

Variable: như 
  + local variable: max_weight_concentration, max_lenght_concentration,...
  + instance variable: @height_max, @container_type,...
  + class variable: @@count, @@items

Array: Array dùng để lưu trữ danh sách các item trong container. Vd: @@items trong class Container.

Control Structure (condition): Condition như if, else, elsif, unless , case when, 

Hook initialize: Hook initialize được sử dụng trong class để thực hiện các thao tác khởi tạo khi một object được tạo ra.
Vd: initialize container_type, initialize (packing_style, length, width, height, weight, cog_height_type, cog_height)

Method (method): Các method được định nghĩa trong class và module để thực hiện các tác vụ cụ thể.

Singleton Method (method Singleton): Singleton methods là những method chỉ tồn tại và có thể gọi trên một đối tượng cụ thể, không được share chung bởi tất cả các object thuộc cùng class như Container.detail_container(container)

Method Accessor (Truy cập method): Các method truy cập (getter/setter) được sử dụng để truy cập và thiết lập giá trị của các thuộc tính của object.
Vd: attr_accessor trong class Item để truy cập và thiết lập giá trị của @packaging_type.
