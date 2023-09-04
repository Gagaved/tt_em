import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'tourist.g.dart';

@JsonSerializable()
class Tourist extends Equatable {
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'surname')
  final String surname;
  @JsonKey(name: 'birth_day')
  final String birthDay;
  @JsonKey(name: 'citizenship')
  final String citizenship;
  @JsonKey(name: 'international_passport_number')
  final String internationalPassportNumber;
  @JsonKey(name: 'passport_validity_period')
  final String passportValidityPeriod;

  factory Tourist.fromJson(Map<String,dynamic> json)=>_$TouristFromJson(json);
  Map<String,dynamic> toJson() => _$TouristToJson(this);

//<editor-fold desc="Data Methods">
  const Tourist({
    required this.name,
    required this.surname,
    required this.birthDay,
    required this.citizenship,
    required this.internationalPassportNumber,
    required this.passportValidityPeriod,
  });

  @override
  List<Object> get props =>
      [
        name,
        surname,
        birthDay,
        citizenship,
        internationalPassportNumber,
        passportValidityPeriod,
      ];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is Tourist &&
              runtimeType == other.runtimeType &&
              name == other.name &&
              surname == other.surname &&
              birthDay == other.birthDay &&
              citizenship == other.citizenship &&
              internationalPassportNumber ==
                  other.internationalPassportNumber &&
              passportValidityPeriod == other.passportValidityPeriod);

  @override
  int get hashCode =>
      name.hashCode ^
      surname.hashCode ^
      birthDay.hashCode ^
      citizenship.hashCode ^
      internationalPassportNumber.hashCode ^
      passportValidityPeriod.hashCode;

  @override
  String toString() {
    return 'Tourist{' +
        ' name: $name,' +
        ' surname: $surname,' +
        ' birthDay: $birthDay,' +
        ' citizenship: $citizenship,' +
        ' internationalPassportNumber: $internationalPassportNumber,' +
        ' passportValidityPeriod: $passportValidityPeriod,' +
        '}';
  }

  Tourist copyWith({
    String? name,
    String? surname,
    String? birthDay,
    String? citizenship,
    String? internationalPassportNumber,
    String? passportValidityPeriod,
  }) {
    return Tourist(
      name: name ?? this.name,
      surname: surname ?? this.surname,
      birthDay: birthDay ?? this.birthDay,
      citizenship: citizenship ?? this.citizenship,
      internationalPassportNumber:
      internationalPassportNumber ?? this.internationalPassportNumber,
      passportValidityPeriod:
      passportValidityPeriod ?? this.passportValidityPeriod,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'surname': this.surname,
      'birth_day': this.birthDay,
      'citizenship': this.citizenship,
      'international_passport_number': this.internationalPassportNumber,
      'passport_validity_period': this.passportValidityPeriod,
    };
  }

  factory Tourist.fromMap(Map<String, dynamic> map) {
    return Tourist(
      name: map['name'] as String,
      surname: map['surname'] as String,
      birthDay: map['birth_day'] as String,
      citizenship: map['citizenship'] as String,
      internationalPassportNumber: map['international_passport_number'] as String,
      passportValidityPeriod: map['passport_validity_period'] as String,
    );
  }

//</editor-fold>
}