/*import 'package:gsheets/gsheets.dart';

class SheetFlutter {
  static String _sheetID = "1Q6zosO9CL-yLAwK7sL8ed5AGhRpU9du-W6Dq0FZfCDM";
  static const _scheetCredentials = r'''{
  {
  "type": "service_account",
  "project_id": "beacon-333811",
  "private_key_id": "f71b1626f208983013b6f4eca1073e3e7e86708e",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQC9HHg0RsS0ThyT\nC2ozn7JKvKzx+UfvdAnrqprOxPEfENjFlv2ulcnNW91gq7dbFrAUCnDMAIr6u+iY\nZ7Y1EtgEHy3PhDO4ge7HPZFNc8W1mov+f8bH0oYLvw+22jB8bDmHthYG/IukfUUd\nG1QAr52TrnRceXQkx/UqgNaJ6+83VWltJgL2pTq4p9CH9Tg5XNRMzRwcgjJtaKyO\ngc3LUmbvHT6dbnbSShXJvAbn5O5F2NX3Tl18NLXVgzvhZc1VfYdvOagSHNVg3gMn\nfe/BqKLg8A/Y1CuINnfFR901vFxsZuowNkBM2CHHqMNwxHQvDacn6r8u1Y9dNwAi\n3wA4EPitAgMBAAECggEAAIslIaoPf2af5Dfwi0tCNb72iQQ8OLHJDMlxeHarWr8j\n1Lkw66YVeU9ySIh7ohDYFRPBJoN/tDdUl3LR8/l2QR47pDOX+zCBgV4vkdFrXd9Y\n7u6wih4gDq/btp0CqB62DodA53/facjj18gegg2iEqzFsB5as3eikdkRUGzlLJLO\n0gABo4fnPAby77AhHXr5N5cnehjcG8pwbrehoa4HlIkyNaeKsKDhrLlLokEMOPeJ\nGms0l7DRbSjsG0wF6Mqps2oguDnY9+UfKFpF/h3g+4gn02vtx6QjZUKab0Q/XM9R\nHOMf1238Ynju4jPuC74DVX3gelZTCV8m/WlKIT524QKBgQDw8ldfePWfWPCdShjb\nzR1gdSKTrk1GjEPjn5OXLRmWXesBh7fhglrUpdzcJ7RG+KZN/5gTTgoSn+GcioPp\nRY7LgiVjFTD0J2h5hdkXOIjbx5+tbh9IHM10ru9I7Zpy7wddyb16buvCdEALZU2u\nvj/drSI5p4KuzdW6FINRSPw9ZwKBgQDI7RTQGrmvuyRYrVbSU+lA6fD9VwP2XLFU\ntIbxn6u8Rv+OtW7y+wTVsSHksO6F7CrGjAyjJ80yUBd/6ADegc+rwlDf74xbZZGD\nLgf1qG8WO1morMUMCO1JV1YHXLQVhRk6lBxanKzfMnuh/cGNi+fAw0TbOt3cB/UL\nd70r/Bx4ywKBgQDHYGE4WUk2YExKe0Pyrdn/NS41cefz1qFeu29Pizw/Ftwd2gYo\njstGZzFI43njuGE07akTYGIpYy83b88TukEc2UbCpIhroChtVnp7IobtBlR1GEi+\nTUcdpJvQhvxk2rIHw6YMp7hioftU8rDDRh5m+pr1hk03BJA0eEDphDFlRQKBgDm5\nQt12kBoYXZzMT8ElMkHf88gUk6LXhmqbYplQEfqJOyo4naNY0k7CEMauvhfjfXaF\nDaxh5uWpdNbeREGocY0ayjlLjLtFNsTFGKxOs3tjmaKH4CRQ/DqxyJlc3K/CCTl3\nC55MnK2Sx0oGqPCNXQtYDhQdmVd5QcEFqWdViqh5AoGAGA1mQcUz590ZqT4UDRc+\nCkiO5VX/tkLaDJbg0ni/DnVdwzgmfdtJ15agtST2M9B2ByKxGPhmFQZBP9Ip7FXe\nOzyIKDDzC04ERR+01D9q8sdF2YkYtbVPBvfBsWMnJaaP1GtdwhBo9WJSSM/fNgLU\nnXpoF7ABw5ROs9xZju89cK0=\n-----END PRIVATE KEY-----\n",
  "client_email": "fluttergooglesheet@beacon-333811.iam.gserviceaccount.com",
  "client_id": "101088465527490652349",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/fluttergooglesheet%40beacon-333811.iam.gserviceaccount.com"
}
}''';

  static Worksheet? _userSheet;
  static final _gsheets = GSheets(_scheetCredentials);

  static Future init() async {
    final spreadsheet = await _gsheets.spreadsheet(_sheetID);
  }

  static Future<Worksheet> _getWorkSheet(
    Spreadsheet spreadsheet, {
    required String title,
  }) async {
    try {
      return await Spreadsheet.addWorksheet(title);
    } catch (e) {
      return Spreadsheet.worksheetByTitle(title)!;
    }
  }
}
*/
