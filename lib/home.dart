// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // late String data;
  late Map data1;
  // late Map Subdata1;
  late List listdata;
  Future getdata() async {
    final response = await http.get(Uri.parse('https://reqres.in/api/unknown'));

    if (response.statusCode == 200) {
      setState(() {
        // data = ;
        data1 = jsonDecode(response.body);
        // data1 = jsonDecode(data);
        listdata = data1['data'];
      });
    }
  }

  @override
  void initState() {
    getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api Call 6"),
      ),
      body: ListView.builder(
        itemCount: listdata.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  margin: EdgeInsets.all(15),
                  color: Colors.grey,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          listdata[index]['id'].toString(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          listdata[index]['name'].toString(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          listdata[index]['year'].toString(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          listdata[index]['color'].toString(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          listdata[index]['pantone_value'].toString(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

// Center(
//         child: Container(
//           height: 200,
//           width: 200,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             color: Colors.black12,
//           ),
//           child: Subdata1 == null
//               ? Container()
//               : Center(child: Text(Subdata1['text'].toString())),
//         ),
//       ),