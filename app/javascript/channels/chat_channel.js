import consumer from "channels/consumer";

const chatChannel = consumer.subscriptions.create("ChatChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
  },
});

// document.addEventListener("click", (e) => {
//   alert("wow");

//   const message = {
//     body: "Hello Wow",
//   };

//   chatChannel.send({ message: "hello wow" });
// });
