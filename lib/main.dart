import 'package:flutter/material.dart';

import 'package:connectivity/connectivity.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'block.dart';
import 'blockSerialized.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List res = [];
  late bool loading = false;
  late bool connectionStatus = false;

  // Получение данных с сервера
  void getData() async {
    setState(() {
      loading = false;
    });

    var connectivityResult = await (Connectivity().checkConnectivity());
    late bool isConnect = false;

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) isConnect = true;

    if (isConnect) {
      final uri = Uri.parse('https://d-element.ru/test_api.php');
      final result = await http.get(uri);
      var items = jsonDecode(result.body);
      setState(() {
        res = items['items'].map((el) => BlockSerialized.fromJson(el)).toList();
        connectionStatus = true;
      });
    }

    setState(() {
      loading = true;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Список товаров',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: const Color(0xff25262B),
            fontSize: 17,
            fontWeight: FontWeight.w700,
            fontFamily: 'ProximaNova',
          ),
        ),
        backgroundColor: const Color(0xffF3F4F6),
      ),
      body: Container(
        child: loading
            ? connectionStatus
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 20),
                    child: GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: MediaQuery.of(context).size.width /
                            (MediaQuery.of(context).size.height / 1.2),
                        crossAxisSpacing: 15,
                      ),
                      children: [...res.map((el) => Block(item: el)).toList()],
                    ),
                  )
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Отсутствует подключение к интернету'),
                        SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                            onPressed: () => {getData()},
                            child: Text('Повторить попытку'))
                      ],
                    ),
                  )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
