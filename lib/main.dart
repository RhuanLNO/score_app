import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:core';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';
import 'package:score_app/entities/fixture_reponse.dart';

void main() {
  runApp(const MyApp());
}

class TeamInfo {
  final int id;
  final String name;
  final String code;
  final String country;
  final int founded;
  final bool national;
  final String logo;

  TeamInfo(this.id, this.name, this.code, this.country, this.founded,
      this.national, this.logo);
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

class TeamDropdown extends StatefulWidget {
  const TeamDropdown({super.key});

  @override
  State<TeamDropdown> createState() {
    return TeamDropdownState();
  }
}

class TeamDropdownState extends State<TeamDropdown> {
  late Future contentFuture;

  Future _fetchListContent() async {
    List content = json.decode((await DefaultAssetBundle.of(context)
        .loadString('assets/docs/teams.json')));
    return content;
  }

  @override
  void initState() {
    super.initState();
    contentFuture = _fetchListContent();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future futureData;

  Map<String, String> requestHeaders = {
    'x-rapidapi-host': 'https://v3.football.api-sports.io/',
    'x-rapidapi-key': 'cee9c9e1d9ed354716925e8c3f081c2f',
  };

  Future<FixtureResponse> fetchData() async {
    var url = 'https://v3.football.api-sports.io/fixtures/';
    var query = '&season=2023&from=2023-11-10&to=2023-12-07';
    final response = await http.get(Uri.parse("$url?team=134$query"),
        headers: requestHeaders);
    if (response.statusCode == 200) {
      /* print(FixtureResponse.fromJson(jsonDecode(response.body))); */
      /* return jsonDecode(response.body); */
/*       print(response.body); */
      /* print(FixtureResponse.fromJson(jsonDecode(response.body))); */
/*       var jsonResponse = jsonDecode(response.body);
      List<dynamic> fixtureListJson = jsonResponse['response'];

      List<FixtureResponse> fixtureList = fixtureListJson
          .map((fixtureJson) => FixtureResponse.fromJson(fixtureJson))
          .toList();
      print(fixtureList); */
      return FixtureResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    super.initState();
    futureData = fetchData().then((value) {
      /* print(value); */
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
      body: FutureBuilder(
          future: futureData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text(
                'Error: ${snapshot.error}',
                style: const TextStyle(color: Colors.black),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data?.response?.length,
                itemBuilder: (context, index) {
                  return Padding(
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
                                snapshot
                                    .data?.response[index]?.teams?.home?.logo,
                                width: 90,
                                height: 90),
                            Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                      '${snapshot.data.response[index].goals.home ?? 0}   X   ${snapshot.data.response[index].goals.away ?? 0}',
                                      style: const TextStyle(fontSize: 40)),
                                  Text(snapshot.data?.response[index]?.fixture
                                      ?.venue?.name),
                                  const Text('01/11/23')
                                ],
                              ),
                            ),
                            Image.network(
                                snapshot
                                    .data?.response[index]?.teams?.away?.logo,
                                width: 90,
                                height: 90),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          }),
      /* Padding(
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
            ), */
    );
  }
}
