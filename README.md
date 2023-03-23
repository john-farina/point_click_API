## Player/User
- email
- password

- username:string
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
