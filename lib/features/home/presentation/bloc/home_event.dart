part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  factory HomeEvent.onchangedIndexPage({required int indexpage}) =>
      _OnChangedIndexPage(indexPage: indexpage);
  factory HomeEvent.onGetListRutine() => _OnGetListRutine();
  factory HomeEvent.onGetListRanking() => _OnGetListRanking();
  factory HomeEvent.onGetListChallenges() => _OnGetListChallenges();
  factory HomeEvent.onAssignChallengesByType({
    required String type,
    required (String, String)? body,
    required Map<String, dynamic>? group,
  }) =>
      _OnAssignChallengesByType(type: type, body: body, group: group);

  @override
  List<Object?> get props => [];
}

class _OnAssignChallengesByType implements HomeEvent {
  final String? type;
  final (String, String)? body;
  final Map<String, dynamic>? group;

  _OnAssignChallengesByType(
      {required this.type, required this.body, required this.group});
  @override
  // TODO: implement props
  List<Object?> get props => [type, body, group];

  @override
  // TODO: implement stringify
  bool? get stringify => throw UnimplementedError();
}

class _OnGetListChallenges implements HomeEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

  @override
  // TODO: implement stringify
  bool? get stringify => throw UnimplementedError();
}

class _OnGetListRanking implements HomeEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

  @override
  // TODO: implement stringify
  bool? get stringify => throw UnimplementedError();
}

class _OnGetListRutine implements HomeEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

  @override
  // TODO: implement stringify
  bool? get stringify => throw UnimplementedError();
}

class _OnChangedIndexPage implements HomeEvent {
  final int indexPage;

  _OnChangedIndexPage({required this.indexPage});
  @override
  List<Object?> get props => [indexPage];

  @override
  // TODO: implement stringify
  bool? get stringify => throw UnimplementedError();
}
