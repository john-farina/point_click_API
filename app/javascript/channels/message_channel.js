const messageChannel = App.subscriptions.create("message", {
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

  messageChannel.send({ message: "hello wow" });
});

messageChannel.subscribe();
