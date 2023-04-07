import consumer from "channels/consumer";
document.addEventListener("DOMContentLoaded", () => {
  consumer.subscriptions.create("ViewCountChannel", {
    connected() {
      // Called when the subscription is ready for use on the server
      console.log("View Count Websockets Subscribed");
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
      const viewCount = document.querySelector("#view-count");
      if (!viewCount) {
        console.log("#view-count element not found.");
        return;
      }
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
