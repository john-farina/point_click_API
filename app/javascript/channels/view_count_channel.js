import consumer from "channels/consumer";
document.addEventListener("DOMContentLoaded", () => {
  consumer.subscriptions.create("ViewCountChannel", {
    connected() {
      // Called when the subscription is ready for use on the server
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
      const viewCount = document.querySelector("#view-count");
      if (data.count === null || data.count === 0) {
        viewCount.innerHTML = "0 Players";

        return;
      }
      if (data.count === 1) {
        viewCount.innerHTML = data.count + " Player";
      } else {
        viewCount.innerHTML = data.count + " Players";
      }
    },
  });
});
