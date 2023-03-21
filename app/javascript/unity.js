var container = document.querySelector("#unity-container");
var canvas = document.querySelector("#unity-canvas");
var loadingBar = document.querySelector("#unity-loading-bar");
var progressBarFull = document.querySelector("#unity-progress-bar-full");
var fullscreenButton = document.querySelector("#unity-fullscreen-button");
var warningBanner = document.querySelector("#unity-warning");
const redBtn = document.querySelector("#redBtn");
let savedFunction;
let clicked = false;

// Shows a temporary message banner/ribbon for a few seconds, or
// a permanent error message on top of the canvas if type=='error'.
// If type=='warning', a yellow highlight color is used.
// Modify or remove this function to customize the visually presented
// way that non-critical warnings and error messages are presented to the
// user.
if (container) {
  function unityShowBanner(msg, type) {
    function updateBannerVisibility() {
      warningBanner.style.display = warningBanner.children.length
        ? "block"
        : "none";
    }
    var div = document.createElement("div");
    div.innerHTML = msg;
    warningBanner.appendChild(div);
    if (type == "error") div.style = "background: red; padding: 10px;";
    else {
      if (type == "warning") div.style = "background: yellow; padding: 10px;";
      setTimeout(function () {
        warningBanner.removeChild(div);
        updateBannerVisibility();
      }, 5000);
    }
    updateBannerVisibility();
  }

  var buildUrl = "assets/javascript/Build";
  var loaderUrl = "/PointClickSocialNew.loader.js";
  var config = {
    dataUrl: "/PointClickSocialNew.data",
    frameworkUrl: "/PointClickSocialNew.framework.js",
    codeUrl: "/PointClickSocialNew.wasm",
    streamingAssetsUrl: "StreamingAssets",
    companyName: "DefaultCompany",
    productName: "PointClickSocialGame",
    productVersion: "1.0",
    showBanner: unityShowBanner,
  };

  // By default Unity keeps WebGL canvas render target size matched with
  // the DOM size of the canvas element (scaled by window.devicePixelRatio)
  // Set this to false if you want to decouple this synchronization from
  // happening inside the engine, and you would instead like to size up
  // the canvas DOM size and WebGL render target sizes yourself.
  // config.matchWebGLToCanvasSize = false;

  if (/iPhone|iPad|iPod|Android/i.test(navigator.userAgent)) {
    // Mobile device style: fill the whole browser client area with the game canvas:

    var meta = document.createElement("meta");
    meta.name = "viewport";
    meta.content =
      "width=device-width, height=device-height, initial-scale=1.0, user-scalable=no, shrink-to-fit=yes";
    document.getElementsByTagName("head")[0].appendChild(meta);
    container.className = "unity-mobile";
    canvas.className = "unity-mobile";

    // To lower canvas resolution on mobile devices to gain some
    // performance, uncomment the following line:
    // config.devicePixelRatio = 1;

    unityShowBanner("WebGL builds are not supported on mobile devices.");
  } else {
    // Desktop style: Render the game canvas in a window that can be maximized to fullscreen:

    canvas.style.width = "960px";
    canvas.style.height = "600px";
  }

  loadingBar.style.display = "block";

  let testPlayerData = {
    username: "johnny",
    inventory: {
      glasses_3D: true,
      chain_gold: false,
      striped_sweater: false,
    },
    wearing: {
      glasses_3D: true,
      chaing_gold: false,
      striped_sweater: false,
    },
    money: {
      quarters: 10,
      tickets: 0,
    },
  };
  const jsonString = JSON.stringify(testPlayerData.inventory);

  ////// MY FUNCTION //////

  // function getCookie(name) {
  //   var nameEQ = name + "=";
  //   var ca = document.cookie.split(";");
  //   for (var i = 0; i < ca.length; i++) {
  //     var c = ca[i];
  //     while (c.charAt(0) == " ") c = c.substring(1, c.length);
  //     if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length, c.length);
  //   }
  //   return null;
  // }

  // function setCookie(name, value, days) {
  //   var expires = "";
  //   if (days) {
  //     var date = new Date();
  //     date.setTime(date.getTime() + days * 24 * 60 * 60 * 1000);
  //     expires = "; expires=" + date.toUTCString();
  //   }
  //   document.cookie = name + "=" + (value || "") + expires + "; path=/";
  // }

  // const apiUrl = "http://127.0.0.1:3000/api/";

  // function isSignedInAPI() {
  //   const myHeaders = new Headers();
  //   myHeaders.append("Set-Cookie", document.cookies);

  //   fetch(apiUrl + "is_signed_in", {
  //     method: "POST",
  //     credentials: "include",
  //     body: JSON.stringify({ cookie: document.cookie }),
  //     headers: {
  //       "Content-Type": "application/json",
  //       "Set-Cookie": document.cookie,
  //     },
  //   })
  //     .then((response) => response.json())
  //     .then((response) => {
  //       console.log("cookies: " + document.cookies);
  //       console.log(response);
  //       console.log(getCookie("remember_token"));
  //     });
  // }

  // function randomNumString() {
  //   let string = "";
  //   for (let i = 0; i < 10; i++) {
  //     string += Math.floor((Math.random() * 100) / 2);
  //   }
  //   return string;
  // }

  // async function postUser() {
  //   let string = randomNumString();
  //   let email = `${string}@gmail.com`;
  //   let password = "foobar";
  //   let params = `email=${email}&password=${password}`;
  //   let options = {
  //     method: "POST",
  //     credentials: "same-origin",
  //     headers: new Headers({
  //       "Content-Type": "application/x-www-form-urlencoded",
  //     }),
  //     body: params,
  //   };

  //   await fetch(apiUrl + "user", options)
  //     .then((response) => response.json())
  //     .then((response) => {
  //       let userInfo = response.user;

  //       if (userInfo) {
  //         console.log("I SIGNED UP A USER I THINK");
  //         console.log(userInfo);
  //         setCookie("remember_token", userInfo.remember_token, 20);
  //         console.log("cookies: " + document.cookie);
  //       }
  //     });

  //   // isSignedInAPI();
  // }

  // function ApiLogin(unityInstance) {
  //   unityInstance.SendMessage("LoginAPIController", "TintRed");

  //   clicked = true;
  //   postUser();
  //   // isSignedInAPI();
  //   console.log("i ran");

  //   unityInstance.SendMessage(
  //     "LoginAPIController",
  //     "SetString",
  //     "then the string i wanna pass through"
  //   );

  //   unityInstance.SendMessage("LoginAPIController", "TestJson", jsonString);
  // }

  ////// END //////

  var script = document.createElement("script");
  script.src = loaderUrl;

  script.onload = () => {
    createUnityInstance(canvas, config, (progress) => {
      progressBarFull.style.width = 100 * progress + "%";
    })
      .then((unityInstance) => {
        loadingBar.style.display = "none";
        fullscreenButton.onclick = () => {
          unityInstance.SetFullscreen(1);
        };

        console.log("cookies: " + document.cookies);

        // calling my function
        // ApiLogin(unityInstance);

        savedFunction = (color) =>
          unityInstance.SendMessage("LoginAPIController", "Tint" + color);
      })
      .catch((message) => {
        alert(message);
      });

    console.log("cookies: " + document.cookies);
  };
  document.body.appendChild(script);

  redBtn.addEventListener("click", () => {
    if (clicked) {
      savedFunction("Red");
      clicked = !clicked;
      isSignedInAPI();
      return;
    }

    savedFunction("Blue");
    clicked = !clicked;
    isSignedInAPI();
    return;
  });
}
