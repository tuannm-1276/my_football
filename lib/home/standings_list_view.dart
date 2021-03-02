import 'package:flutter/material.dart';
import 'package:my_football/model/football_club.dart';

class StandingsListView extends StatelessWidget {
  final List<FootballClub> footballClubs;

  StandingsListView({Key key, @required this.footballClubs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: footballClubs.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Text(footballClubs[index].teamName),
                Text(footballClubs[index].position),
              ],
            );
          }),
    );
  }
}
