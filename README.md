# new websocket plans

User
has_one :user_data

### UserData
``` rb
# UserData Model
{
username: "johnny",
online: true,
scene: "MainDistrict",
x: integer,
y: integer,
wearing: { # not sure how im gonna implement this either
    # whatever is true
    glasses_3D: true,
    etc: true,
}
}

# rails g migration CreateUserData user:belongs_to username:string online:boolean scene:string x:integer y:integer
```
## In UsersChannel
``` rb
def subscribe
    stream_from "UsersChannel"

    # sending all UserData when subscribed
    send_users(UserData.all)
end

def unsubscribed
    userdata = UserData.find_by(user_id: current_user.id);

    userdata.online = false;
    userdata.destroy

    current_user.save
end

def received(data)
    userdata = UserData.find_or_create_by(user_id: current_user.id)

    userdata.update(
        username: data['username'],
        online: data['online'],
        scene: data['scene'],
        x: data['x'],
        y: data['y']
    )

    ActionCable.server.broadcast("UsersChannel", {
        user_id: current_user.id,
        data: userdata
    })
end

private
    # get All Users
    def send_users(users)
        # loop through
        users.each do |user|
            newUserData = {
                username: user.username,
                online: user.online,
                scene: user.scene,
                x: user.x,
                y: user.y
            }

            ActionCable.server.broadcast(
                'UsersChannel', newUserData
            )
        end
    end

```

## Unity Side:
``` c#
using State = PlayerStateController;

// in a update somewhere
void Start()
{
    websocket.Subscribe("UsersChannel", RecievedMessage);
}

private void RecievedMessage(string websocketMsg)
{
    // do something with the message
}

void Update()
{
    if (State.isMoving)
    {
        JSONObject userData = new JSONObject();

        userData["username"] = State.playerName;
        userData["online"] = true;
        userData["scene"] = State.Position.scene;
        userData["x"] = State.Position.x;
        userData["y"] = State.Position.y;

        websocket.SendMessage("UsersChannel", userData.ToString());
    }
}
```

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
