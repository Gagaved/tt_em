import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'hotel.g.dart';

@JsonSerializable()
class Hotel extends Equatable {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'adress')// Составитель эндпоинта задания либо опечатался либо не знает как пишется aDDress
  final String address;
  @JsonKey(name: 'minimal_price')
  final int minimalPrice;
  @JsonKey(name: 'price_for_it')
  final String priceForIt;
  @JsonKey(name: 'rating') //БОЖЕ XD horating)))
  final int rating;
  @JsonKey(name: 'rating_name')
  final String ratingName;
  @JsonKey(name: 'image_urls')
  final List<String> imageUrls;
  @JsonKey(name: 'about_the_hotel')
  final HotelDescription aboutTheHotel;


  factory Hotel.fromJson(Map<String,dynamic> json)=>_$HotelFromJson(json);
  Map<String,dynamic> toJson() => _$HotelToJson(this);

//<editor-fold desc="Data Methods">
  const Hotel({
    required this.id,
    required this.name,
    required this.address,
    required this.minimalPrice,
    required this.priceForIt,
    required this.rating,
    required this.ratingName,
    required this.imageUrls,
    required this.aboutTheHotel,
  });


  @override
  List<Object> get props =>
      [
        id,
        name,
        address,
        minimalPrice,
        priceForIt,
        rating,
        ratingName,
        imageUrls,
        aboutTheHotel,
      ];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is Hotel &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              name == other.name &&
              address == other.address &&
              minimalPrice == other.minimalPrice &&
              priceForIt == other.priceForIt &&
              rating == other.rating &&
              ratingName == other.ratingName &&
              imageUrls == other.imageUrls &&
              aboutTheHotel == other.aboutTheHotel);

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      address.hashCode ^
      minimalPrice.hashCode ^
      priceForIt.hashCode ^
      rating.hashCode ^
      ratingName.hashCode ^
      imageUrls.hashCode ^
      aboutTheHotel.hashCode;

  @override
  String toString() {
    return 'Hotel{' +
        ' id: $id,' +
        ' name: $name,' +
        ' address: $address,' +
        ' minimalPrice: $minimalPrice,' +
        ' priceForIt: $priceForIt,' +
        ' rating: $rating,' +
        ' ratingName: $ratingName,' +
        ' imageUrls: $imageUrls,' +
        ' aboutTheHotel: $aboutTheHotel,' +
        '}';
  }

  Hotel copyWith({
    int? id,
    String? name,
    String? address,
    int? minimalPrice,
    String? priceForIt,
    int? rating,
    String? ratingName,
    List<String>? imageUrls,
    HotelDescription? aboutTheHotel,
  }) {
    return Hotel(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      minimalPrice: minimalPrice ?? this.minimalPrice,
      priceForIt: priceForIt ?? this.priceForIt,
      rating: rating ?? this.rating,
      ratingName: ratingName ?? this.ratingName,
      imageUrls: imageUrls ?? this.imageUrls,
      aboutTheHotel: aboutTheHotel ?? this.aboutTheHotel,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'address': this.address,
      'minimal_orice': this.minimalPrice,
      'price_for_it': this.priceForIt,
      'rating': this.rating,
      'rating_name': this.ratingName,
      'image_urls': this.imageUrls,
      'about_the_hotel': this.aboutTheHotel,
    };
  }

  factory Hotel.fromMap(Map<String, dynamic> map) {
    return Hotel(
      id: map['id'] as int,
      name: map['name'] as String,
      address: map['address'] as String,
      minimalPrice: map['minimal_price'] as int,
      priceForIt: map['price_for_it'] as String,
      rating: map['rating'] as int,
      ratingName: map['rating_name'] as String,
      imageUrls: map['image_urls'] as List<String>,
      aboutTheHotel: HotelDescription.fromMap(map['about_the_hotel']),
    );
  }

//</editor-fold>
}

@JsonSerializable()
class HotelDescription extends Equatable {
  @JsonKey(name: 'description')
  final String description;
  @JsonKey(name: 'peculiarities')
  final List<String> peculiarities;


  factory HotelDescription.fromJson(Map<String,dynamic> json)=>_$HotelDescriptionFromJson(json);
  Map<String,dynamic> toJson() => _$HotelDescriptionToJson(this);


//<editor-fold desc="Data Methods">
  const HotelDescription({
    required this.description,
    required this.peculiarities,
  });

  @override
  List<Object> get props => [description, peculiarities];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is HotelDescription &&
              runtimeType == other.runtimeType &&
              description == other.description &&
              peculiarities == other.peculiarities);

  @override
  int get hashCode => description.hashCode ^ peculiarities.hashCode;

  @override
  String toString() {
    return 'HotelDescription{' +
        ' description: $description,' +
        ' peculiarities: $peculiarities,' +
        '}';
  }

  HotelDescription copyWith({
    String? description,
    List<String>? peculiarities,
  }) {
    return HotelDescription(
      description: description ?? this.description,
      peculiarities: peculiarities ?? this.peculiarities,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'description': this.description,
      'peculiarities': this.peculiarities,
    };
  }

  factory HotelDescription.fromMap(Map<String, dynamic> map) {
    return HotelDescription(
      description: map['description'] as String,
      peculiarities: map['peculiarities'] as List<String>,
    );
  }

//</editor-fold>
}
