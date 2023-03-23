import { getCookie, setCookie } from "./cookieFunctions";

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

const apiUrl = "/api/";

function randomStr() {
  let string = "";
  for (let i = 0; i < 10; i++) {
    string += Math.floor((Math.random() * 100) / 2);
  }

  return string;
}

async function signUpUser() {
  let string = randomStr();

  let email = `${string}@gmail.com`;
  let password = "foobar";

  let params = `email=${email}&password=${password}`;

  let options = {
    method: "POST",
    credentials: "same-origin",
    headers: new Headers({
      "Content-Type": "application/x-www-form-urlencoded",
    }),
    body: params,
  };

  await fetch(apiUrl + "user", options)
    .then((response) => response.json())
    .then((response) => {
      let userInfo = response.user;

      if (userInfo) {
        console.log("I SIGNED UP A USER I THINK");
        console.log(userInfo);
        setCookie("remember_token", userInfo.remember_token, 20);
        console.log("cookies: " + document.cookie);
      }
    });
}

export function isSignedInAPI() {
  const myHeaders = new Headers();
  myHeaders.append("Set-Cookie", document.cookies);

  fetch(apiUrl + "is_signed_in", {
    method: "POST",
    credentials: "include",
    body: JSON.stringify({ cookie: document.cookie }),
    headers: {
      "Content-Type": "application/json",
      "Set-Cookie": document.cookie,
    },
  })
    .then((response) => response.json())
    .then((response) => {
      console.log("cookies: " + document.cookies);
      console.log(response);
      console.log(getCookie("remember_token"));
    });
}

export function ApiController(unityInstance) {
  unityInstance.SendMessage("LoginAPIController", "TintRed");
  // signUpUser();

  console.log("i ran");

  unityInstance.SendMessage(
    "LoginAPIController",
    "SetString",
    "then the string i wanna pass through"
  );

  unityInstance.SendMessage("LoginAPIController", "TestJson", jsonString);
}
