import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_football/home/standings_list_view.dart';
import 'package:my_football/model/football_club.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

List<FootballClub> parseFootballClubs(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed
      .map<FootballClub>((json) => FootballClub.fromJson(json))
      .toList();
}

Future<List<FootballClub>> fetchFootBallClubs(http.Client client) async {
  final response = await client.get(
      'https://apiv2.apifootball.com/?action=get_standings&league_id=148&APIkey=ccbeec50af0af47af3b6e5895982792214cb062f4e1766027368ed345d1cc608');
  return compute(parseFootballClubs, response.body);
}

class TabBarHome extends StatelessWidget {
  var footballClubs = List<FootballClub>();


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("HomePage"),
        ),
        body: FutureBuilder<List<FootballClub>>(
          future: fetchFootBallClubs(http.Client()),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? StandingsListView(footballClubs: snapshot.data)
                : Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
      ),
    );
  }
}
