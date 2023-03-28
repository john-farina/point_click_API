// import consumer from "channels/consumer";

// const usersChannel = consumer.subscriptions.create("UsersChannel", {
//   connected() {
//     // Called when the subscription is ready for use on the server
//   },

//   disconnected() {
//     // Called when the subscription has been terminated by the server
//   },

//   received(data) {
//     // Called when there's incoming data on the websocket for this channel
//   },
// });

// document.addEventListener("click", () => {
//   usersChannel.send({
//     username: "johnny",
//     online: true,
//     scene: "MainDistrict",
//     x: 0,
//     y: 0,
//   });
// });
