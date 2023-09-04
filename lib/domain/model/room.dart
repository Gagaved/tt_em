import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'room.g.dart';

@JsonSerializable()
class Room extends Equatable {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'price')
  final int price;
  @JsonKey(name: 'price_per')
  final String pricePer;
  @JsonKey(name: 'peculiarities')
  final List<String> peculiarities;
  @JsonKey(name: 'image_urls')
  final List<String> imageUrls;

  factory Room.fromJson(Map<String,dynamic> json)=>_$RoomFromJson(json);
  Map<String,dynamic> toJson() => _$RoomToJson(this);

  @override
  List<Object> get props =>
      [id, name, price, pricePer, peculiarities, imageUrls,];

//<editor-fold desc="Data Methods">
  const Room({
    required this.id,
    required this.name,
    required this.price,
    required this.pricePer,
    required this.peculiarities,
    required this.imageUrls,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is Room &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              name == other.name &&
              price == other.price &&
              pricePer == other.pricePer &&
              peculiarities == other.peculiarities &&
              imageUrls == other.imageUrls);

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      price.hashCode ^
      pricePer.hashCode ^
      peculiarities.hashCode ^
      imageUrls.hashCode;

  @override
  String toString() {
    return 'Room{' +
        ' id: $id,' +
        ' name: $name,' +
        ' price: $price,' +
        ' pricePer: $pricePer,' +
        ' peculiarities: $peculiarities,' +
        ' imageUrls: $imageUrls,' +
        '}';
  }

  Room copyWith({
    int? id,
    String? name,
    int? price,
    String? pricePer,
    List<String>? peculiarities,
    List<String>? imageUrls,
  }) {
    return Room(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      pricePer: pricePer ?? this.pricePer,
      peculiarities: peculiarities ?? this.peculiarities,
      imageUrls: imageUrls ?? this.imageUrls,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'price': this.price,
      'price_per': this.pricePer,
      'peculiarities': this.peculiarities,
      'image_urls': this.imageUrls,
    };
  }

  factory Room.fromMap(Map<String, dynamic> map) {
    return Room(
      id: map['id'] as int,
      name: map['name'] as String,
      price: map['price'] as int,
      pricePer: map['price_per'] as String,
      peculiarities: map['peculiarities'] as List<String>,
      imageUrls: map['image_urls'] as List<String>,
    );
  }

//</editor-fold>
}
