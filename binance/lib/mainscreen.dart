import 'package:binance/dataWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class mainScreen extends StatefulWidget {
  const mainScreen({Key? key}) : super(key: key);

  @override
  State<mainScreen> createState() => _mainScreenState();
}

//Revolut, ING, BCR Bank, Raiffeisenbank, Bank Transilvania, BRD Bank, CEC
//userDataAboutVisitedPlaces[0]["nickName"]
class _mainScreenState extends State<mainScreen> {
  var userDataAboutVisitedPlaces;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF1f2630),
        body: Row(
          children: [
            Expanded(
              flex: 5,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      color: Color(0xFFf6465d),
                      width: 230.0,
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: const Text(
                        "SELL",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xFFe4e8ed),
                            fontWeight: FontWeight.bold,
                            height: 2,
                            fontSize: 13),
                      ),
                    ),
                    DataWidget("Revolut", "SebiBinanceBUY", "Revolut"),
                    DataWidget("ING", "SebiBinanceBUY", "ING"),
                    DataWidget("SEK", "SebiBinanceBUY", "ZEN"),
                    DataWidget("GBP", "SebiBinanceBUY", "GBP"),
                    DataWidget("USD", "SebiBinanceBUY", "USD"),
                    DataWidget("EUR", "SebiBinanceBUY", "EUR"),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      color: Color(0xFF2ebd85),
                      width: 230.0,
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: const Text(
                        "BUY",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xFFe4e8ed),
                            fontWeight: FontWeight.bold,
                            height: 2,
                            fontSize: 13),
                      ),
                    ),
                    DataWidget("Revolut", "SebiBinanceSELL", "Revolut"),
                    DataWidget("ING", "SebiBinanceSELL", "ING"),
                    DataWidget("SEK", "SebiBinanceSELL", "ZEN"),
                    DataWidget("GBP", "SebiBinanceSELL", "GBP"),
                    DataWidget("USD", "SebiBinanceSELL", "USD"),
                    DataWidget("EUR", "SebiBinanceSELL", "EUR"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
