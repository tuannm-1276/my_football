
class FootballClub {
  final String teamName;
  final String position;

  FootballClub({this.teamName, this.position});
  factory FootballClub.fromJson(Map<String, dynamic> json){
    return FootballClub(
      teamName: json['team_name'] as String,
      position: json['overall_league_position'] as String,
    );
  }
}
