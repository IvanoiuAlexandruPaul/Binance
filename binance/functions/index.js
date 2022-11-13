const functions = require("firebase-functions");
const axios = require("axios");
const admin = require("firebase-admin");
admin.initializeApp();
const database = admin.firestore();
const page = 1;
const fiat = "EUR";
const tradeType = "BUY";
const asset = "USDT";
const payTypes = ["ZEN"];
let finalData = [];
let tempDataBeforeProccessing = [];

const baseObj = {
  page,
  rows: 20,
  publisherType: null,
  asset,
  tradeType,
  fiat,
  payTypes,
};

const stringData = JSON.stringify(baseObj);

const getTheData = async function() {
  tempDataBeforeProccessing=[];
  await axios.post("https://p2p.binance.com/bapi/c2c/v2/friendly/c2c/adv/search", baseObj, {
    hostname: "p2p.binance.com",
    port: 443,
    path: "/bapi/c2c/v2/friendly/c2c/adv/search",
    method: "POST",
    headers: {
      "Content-Type": "application/json",
      "Content-Length": stringData.length,
    },
  }).then((res)=>{
    tempDataBeforeProccessing=res.data.data;
  });
};


const processData = function() {
  finalData=[];
  let obj = [];
  for (let i = 0; i < tempDataBeforeProccessing.length; i++) {
    let payTypesz = "";
    for (let y = 0; y <
    tempDataBeforeProccessing[i]["adv"]["tradeMethods"].length; y++) {
      payTypesz +=
      tempDataBeforeProccessing[i]["adv"]["tradeMethods"][y]["identifier"];
      if (y <
      tempDataBeforeProccessing[i]["adv"]["tradeMethods"].length - 1) {
        payTypesz += ", ";
      }
    }
    obj = {
      tradeType: tempDataBeforeProccessing[i]["adv"]["tradeType"],
      asset: tempDataBeforeProccessing[i]["adv"]["asset"],
      fiatUnit: tempDataBeforeProccessing[i]["adv"]["fiatUnit"],
      price: tempDataBeforeProccessing[i]["adv"]["price"],
      surplusAmount:
      tempDataBeforeProccessing[i]["adv"]["surplusAmount"],
      maxSingleTransAmount:
      tempDataBeforeProccessing[i]["adv"]["maxSingleTransAmount"],
      minSingleTransAmount:
      tempDataBeforeProccessing[i]["adv"]["minSingleTransAmount"],
      nickName:
      tempDataBeforeProccessing[i]["advertiser"]["nickName"],
      monthOrderCount:
      tempDataBeforeProccessing[i]["advertiser"]["monthOrderCount"],
      monthFinishRate:
      tempDataBeforeProccessing[i]["advertiser"]["monthFinishRate"],
      payTypes: payTypesz,
    };
    finalData.push(obj);
  }

  console.log(finalData);
};

const entireCall = async function() {
  await getTheData();
  processData();
};

entireCall();