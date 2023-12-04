import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:core';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Score App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4C8527)),
        scaffoldBackgroundColor: const Color(0xFFfcecc4),
        textTheme: const TextTheme(
            bodyLarge: TextStyle(color: Color(0xFFffffff)),
            bodyMedium: TextStyle(color: Color(0xFFffffff)),
            bodySmall: TextStyle(color: Color(0xFFffffff))),
        appBarTheme: const AppBarTheme(
          foregroundColor: Colors.white,
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future contentFuture;

  Future _fetchListContent() async {
    List content = json.decode((await DefaultAssetBundle.of(context)
        .loadString('assets/docs/teams.json')));
    return content;
  }

  @override
  void initState() {
    super.initState();
    contentFuture = _fetchListContent().then((value) {
      /* print(value[0]); */
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF4C8527),
        title: const Text('Score App'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Card(
                color: const Color(0xFF4C8527),
                child: SizedBox(
                  width: width * 0.85,
                  height: width * 0.3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.network(
                          'https://media-4.api-sports.io/football/teams/120.png',
                          width: 90,
                          height: 90),
                      const Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('3   X   4', style: TextStyle(fontSize: 40)),
                            Text('Estádio Nilton Santos'),
                            Text('01/11/23')
                          ],
                        ),
                      ),
                      Image.network(
                          'https://media-4.api-sports.io/football/teams/121.png',
                          width: 90,
                          height: 90),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Card(
                color: const Color(0xFF4C8527),
                child: SizedBox(
                  width: width * 0.65,
                  height: width * 0.15,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.network(
                          'https://media-4.api-sports.io/football/teams/120.png',
                          width: 60,
                          height: 60),
                      const Text('X'),
                      Image.network(
                          'https://media-4.api-sports.io/football/teams/121.png',
                          width: 60,
                          height: 60),
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text('03/12/23'), Text('Allianz Parque')],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Card(
                color: const Color(0xFF4C8527),
                child: SizedBox(
                  width: width * 0.65,
                  height: width * 0.15,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.network(
                          'https://media-4.api-sports.io/football/teams/120.png',
                          width: 60,
                          height: 60),
                      const Text('X'),
                      Image.network(
                          'https://media-4.api-sports.io/football/teams/121.png',
                          width: 60,
                          height: 60),
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text('03/12/23'), Text('Allianz Parque')],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Card(
                color: const Color(0xFF4C8527),
                child: SizedBox(
                  width: width * 0.65,
                  height: width * 0.15,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.network(
                          'https://media-4.api-sports.io/football/teams/120.png',
                          width: 60,
                          height: 60),
                      const Text('X'),
                      Image.network(
                          'https://media-4.api-sports.io/football/teams/121.png',
                          width: 60,
                          height: 60),
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text('03/12/23'), Text('Allianz Parque')],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Card(
                color: const Color(0xFF4C8527),
                child: SizedBox(
                  width: width * 0.65,
                  height: width * 0.15,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.network(
                          'https://media-4.api-sports.io/football/teams/120.png',
                          width: 60,
                          height: 60),
                      const Text('X'),
                      Image.network(
                          'https://media-4.api-sports.io/football/teams/121.png',
                          width: 60,
                          height: 60),
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text('03/12/23'), Text('Allianz Parque')],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
