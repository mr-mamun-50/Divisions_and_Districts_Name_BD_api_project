import 'dart:convert';

import 'package:http/http.dart' as http;

import 'division_model.dart';

class divList {
  static Future<List<DivisionModel>?> getDivision() async {
    print("Print from Repoisitory");
    String url =
        "https://raw.githubusercontent.com/nuhil/bangladesh-geocode/master/divisions/divisions.json";
    Uri uri = Uri.parse(url);

    var response = await http.get(uri);

    if (response.statusCode == 200) {
      var jsonString = jsonDecode(response.body);
      var data = jsonEncode(jsonString[2]['data']);
      print(data);

      return divisionModelFromJson(data);
    } else {
      return null;
    }
  }
}
