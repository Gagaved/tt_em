class Tourist {
  final String name;
  final String surname;
  final String birthDay;
  final String citizenship;
  final String internationalPassportNumber;
  final String passportValidityPeriod;

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
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Tourist &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          surname == other.surname &&
          birthDay == other.birthDay &&
          citizenship == other.citizenship &&
          internationalPassportNumber == other.internationalPassportNumber &&
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