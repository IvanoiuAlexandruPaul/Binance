import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DataWidget extends StatelessWidget {
  String nameOfThefield;
  String fieldToSearchBy;
  String nameOfTheBank;
  int counter = 0;
  StringBuffer banci = new StringBuffer();
  DataWidget(this.nameOfThefield, this.fieldToSearchBy, this.nameOfTheBank);

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
        .collection(fieldToSearchBy)
        .doc(nameOfTheBank)
        .collection("1")
        .snapshots();

    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(border: Border.all(color: Color(0xFF657189))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Color(0xFF1f2630),
            padding: const EdgeInsets.only(top: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(nameOfThefield,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xFFfbdb3b))),
              ],
            ),
          ),
          StreamBuilder<QuerySnapshot>(
            stream: _usersStream,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Text('Something went wrong');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Text("Loading");
              }
              counter = 0;

              return ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                  counter++;
                  banci = new StringBuffer();
                  var string = data['payTypes'];
                  String jsonTags = jsonEncode(string);
                  List<String> aa = jsonTags.split(', ');

                  for (int i = 0; i < aa.length; i++) {
                    String tempString = aa[i].replaceAll(RegExp('"'), '');
                    print(tempString);
                    switch (tempString) {
                      case "Revolut":
                        {
                          banci.write("REVO, ");
                        }
                        break;
                      case "ING":
                        {
                          banci.write("ING, ");
                        }
                        break;
                      case "CEC":
                        {
                          banci.write("CEC, ");
                        }
                        break;
                      case "RaiffeisenBankRussia":
                        {
                          banci.write("RZBR, ");
                        }
                        break;
                      case "BCRBank":
                        {
                          banci.write("BCR, ");
                        }
                        break;
                      case "BankTransilvania":
                        {
                          banci.write("BT, ");
                        }
                        break;
                      case "BRDBank":
                        {
                          banci.write("BRD, ");
                        }
                        break;
                      case "UniCreditRussia":
                        {
                          banci.write("UNIC, ");
                        }
                        break;
                      case "ZEN":
                        {
                          banci.write("ZEN, ");
                        }
                        break;
                    }
                  }
                  num n = num.parse(data['monthFinishRate'].toStringAsFixed(2));
                  n = n * 100;
                  return Container(
                    color: Color(0xFF1f2630),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                                "---------------------------------------------------------------------",
                                style: TextStyle(
                                    fontSize: 10, color: Color(0xFF657189))),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "  ${counter}",
                              style: TextStyle(
                                  fontSize: 10, color: Color(0xFFdbe2ea)),
                            ),
                            Text(
                              "${data['nickName']}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                  color: data['nickName'] == "Beacon"
                                      ? Color(0xFF2ebd85)
                                      : Color(0xFFdbe2ea)),
                            ),
                            Text(
                              "|",
                              style: TextStyle(
                                  fontSize: 10, color: Color(0xFF657189)),
                            ),
                            Text(
                              "${data['monthOrderCount']}" "@$n%   ",
                              style: const TextStyle(
                                  fontSize: 10, color: Color(0xFFdbe2ea)),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              " ${data['price']}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                  color: Color(0xFFb9a22a)),
                            ),
                            const Text(
                              "|",
                              style: TextStyle(
                                  fontSize: 10, color: Color(0xFF657189)),
                            ),
                            Text(
                              "${data['surplusAmount']}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                  color: Color(0xFFdbe2ea)),
                            ),
                            const Text(
                              "|",
                              style: TextStyle(
                                  fontSize: 10, color: Color(0xFF657189)),
                            ),
                            Text(
                              "${data['minSingleTransAmount']}"
                              "-${data['maxSingleTransAmount']}   ",
                              style: TextStyle(
                                  fontSize: 10, color: Color(0xFFdbe2ea)),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 200,
                              child: Text(
                                "  $banci   ",
                                style: TextStyle(color: Color(0xFFdbe2ea)),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 6,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }).toList(),
              );
            },
          )
        ],
      ),
    );
  }
}
