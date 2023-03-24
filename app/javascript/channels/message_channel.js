import consumer from "channels/consumer";

const messageChannel = consumer.subscriptions.create("MessageChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    console.log(data);
  },
});

document.addEventListener("click", (e) => {
  const message = {
    body: "Hello Wow",
  };

  messageChannel.send({ messages: message });
});
