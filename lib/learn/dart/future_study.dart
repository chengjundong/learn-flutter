import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_flutter_070400/learn/dart/data_model.dart';
import 'package:http/http.dart' as http;

class FutureStudy extends StatefulWidget {

  @override
  _FutureStudyState createState() => _FutureStudyState();
}

class _FutureStudyState extends State<FutureStudy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Future Study'),
      ),
      body: FutureBuilder<DataModel> (
        future: fetchGet(),
        builder: (BuildContext context, AsyncSnapshot<DataModel> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.active:
              return Text('Connection active.');
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return Text('Angel\'s Code: ${snapshot.data!.code}');
              }
            case ConnectionState.none:
            default:
              return Text('Not start yet.');
          }
        },
      ),
    );
  }

  /**
   * To fetch data from the server, return as a future
   */
  Future<DataModel> fetchGet() async {
    Uri uri = Uri.parse('https://api.devio.org/uapi/test/test?requestPrams=11');
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      return DataModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }
}
