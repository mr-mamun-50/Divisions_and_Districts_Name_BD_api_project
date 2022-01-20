import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'modeldistric.dart';

class GetOnlineData extends StatefulWidget {
  const GetOnlineData({Key? key}) : super(key: key);

  @override
  _GetOnlineDataState createState() => _GetOnlineDataState();
}

class _GetOnlineDataState extends State<GetOnlineData> {
  var disList = List<Distric>.empty();
  bool isLoading = true;

  Future<List<Distric>> CallApi() async {
    String url =
        "https://raw.githubusercontent.com/nuhil/bangladesh-geocode/master/districts/districts.json";
    Uri uri = Uri.parse(url);

    var response = await http.get(uri);
    print(response.statusCode);
    print(response.body);
    var data = jsonDecode(response.body);

    var distric = jsonEncode(data[2]['data']);

    return districFromJson(distric);
  }

  fatchApi() async {
    disList = await CallApi();
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    // Todo: implement initState
    super.initState();
    fatchApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemBuilder: (context, int) {
                return Card(
                  child: ListTile(
                    title: Text(disList[int].name,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(disList[int].bnName),
                    trailing: Text(disList[int].url),
                    leading: const Icon(
                      Icons.place,
                      color: Colors.indigo,
                    ),
                  ),
                );
              },
              itemCount: disList.length,
            ),
    );
  }
}
