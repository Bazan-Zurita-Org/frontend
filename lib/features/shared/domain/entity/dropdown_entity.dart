import 'package:equatable/equatable.dart';

class DropdownEntity extends Equatable {
  final String id;
  final String description;

  const DropdownEntity(this.id, this.description);

  static get unavailable =>
      const DropdownEntity(nullDropdownValue, dropdownUnavailableDescription);

  static get none =>
      const DropdownEntity(nullDropdownValue, dropdownNoneDescription);

  @override
  List<Object?> get props => [id, description];
}

const String nullDropdownValue = '-infinity';
const String dropdownUnavailableDescription = 'No disponible';
const String dropdownNoneDescription = 'Ninguno';
