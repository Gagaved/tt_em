// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tourist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tourist _$TouristFromJson(Map<String, dynamic> json) => Tourist(
      name: json['name'] as String,
      surname: json['surname'] as String,
      birthDay: json['birth_day'] as String,
      citizenship: json['citizenship'] as String,
      internationalPassportNumber:
          json['international_passport_number'] as String,
      passportValidityPeriod: json['passport_validity_period'] as String,
    );

Map<String, dynamic> _$TouristToJson(Tourist instance) => <String, dynamic>{
      'name': instance.name,
      'surname': instance.surname,
      'birth_day': instance.birthDay,
      'citizenship': instance.citizenship,
      'international_passport_number': instance.internationalPassportNumber,
      'passport_validity_period': instance.passportValidityPeriod,
    };
