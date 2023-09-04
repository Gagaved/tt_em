import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tt_em/domain/model/room.dart';

part 'rooms_model.g.dart';

@JsonSerializable()
class RoomsModel extends Equatable {
  @JsonKey(name: 'rooms')
  final List<Room> rooms;

  factory RoomsModel.fromJson(Map<String, dynamic> json) =>
      _$RoomsModelFromJson(json);

  Map<String, dynamic> toJson() => _$RoomsModelToJson(this);

  @override
  List<Object?> get props => [rooms];

//<editor-fold desc="Data Methods">
  const RoomsModel({
    required this.rooms,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RoomsModel &&
          runtimeType == other.runtimeType &&
          rooms == other.rooms);

  @override
  int get hashCode => rooms.hashCode;

  @override
  String toString() {
    return 'RoomsModel{' + ' rooms: $rooms,' + '}';
  }

  RoomsModel copyWith({
    List<Room>? rooms,
  }) {
    return RoomsModel(
      rooms: rooms ?? this.rooms,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'rooms': this.rooms,
    };
  }

  factory RoomsModel.fromMap(Map<String, dynamic> map) {
    return RoomsModel(
      rooms: map['rooms'] as List<Room>,
    );
  }

//</editor-fold>
}
