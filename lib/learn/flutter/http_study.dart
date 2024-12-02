import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

void main() {
  runApp(const MaterialApp(
    home: HttpStudy(),
  ));
}

class HttpStudy extends StatefulWidget {
  const HttpStudy({super.key});

  @override
  State<HttpStudy> createState() => _HttpStudyState();
}

class _HttpStudyState extends State<HttpStudy> {
  String resultShow = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HTTP network operation')),
      body:
          Column(children: [_doPostBtn(), Text("Request result: $resultShow")]),
    );
  }

  _doGetBtn() {
    return ElevatedButton(
        onPressed: _doGet, child: const Text('send GET request'));
  }

  _doPostBtn() {
    return ElevatedButton(
        onPressed: _doPost, child: const Text('send POST request'));
  }

  void _doGet() async {
    var url = Uri.parse('https://api.devio.org/uapi/test/test?requestPrams=11');
    var response = await http.get(url);
    if (200 == response.statusCode) {
      setState(() {
        resultShow = response.body;
      });
    } else {
      setState(() {
        resultShow =
            "Request failed: ${response.statusCode}, body is ${response.body}";
      });
    }
  }

  void _doPost() async {
    Uri url = Uri.parse('https://api.devio.org/uapi/test/testJson');
    Response response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode({'name1': 'zhangsan1', 'age': 20}));
    if (200 == response.statusCode) {
      setState(() {
        Map<String, dynamic> entity = jsonDecode(response.body);
        DataModel dataModel = DataModel.fromJson(entity);
        resultShow = 'code: ${dataModel.code}; requestPrams:${dataModel.data?['jsonParams']}';
      });
    } else {
      setState(() {
        resultShow =
            "Request failed: ${response.statusCode}, body is ${response.body}";
      });
    }
  }
}

class DataModel {
  int? code;
  Map<String, dynamic>? data;
  String? msg;

  DataModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = json['data'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};
    result['code'] = code;
    result['data'] = jsonEncode(data);
    result['msg'] = msg;
    return result;
  }
}
