# Websocket plans

User
+ location:string *"Main District", "FirstShop"*

has_many Messages
Model Message text:string user:belongs_to

has_one Position
Model Position x:integer y:integer user:belongs_to

Channel Message
Channel Position

setUp apis which i have no clue how lol

## Player/User
- email
- password

- username:string
- color:string *{ "blue", "red", "green", etc. }*
- wearing { glasses_3D:bool, etc. }
- inventory { glasses_3D:bool, etc. }
- money { quarters:num, tickets:num }


Using login through clearance and API, if the user is signed in send that data into


User has one
- Inventory
- Wearing
- Money

Inventory has
- name_of_object:boolean (each object will be preset like glasses_3D:bool)

Wearing has
- name_of_clothing:boolean (each object will be preset like and only wearables glasses_3D:bool)

Money has
- quarters:int
- tickets:int
