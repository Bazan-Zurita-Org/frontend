class ChallengesEntity {
  final String? id;
  final String? name;
  final String? description;
  final int? points;
  final DateTime? startDate;
  final DateTime? endDate;
  final int? type;

  ChallengesEntity(
      {required this.id,
      required this.name,
      required this.description,
      required this.points,
      required this.startDate,
      required this.endDate,
      required this.type});
}
