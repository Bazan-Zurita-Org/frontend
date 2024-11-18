import 'package:equatable/equatable.dart';

class DuelsEntity extends Equatable {
  final String? duelId;
  final String? challengerName;
  final String? challengeText;
  final DateTime? startDate;
  final DateTime? endDate;

  const DuelsEntity({
    required this.duelId,
    required this.challengerName,
    required this.challengeText,
    required this.startDate,
    required this.endDate,
  });

  @override
  List<Object?> get props => [
        duelId,
        challengerName,
        challengeText,
        startDate,
        endDate,
      ];
}
