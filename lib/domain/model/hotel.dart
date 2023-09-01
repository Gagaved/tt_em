import 'package:equatable/equatable.dart';

class Hotel extends Equatable {
  final int id;
  final String name;
  final String address;
  final int minimalPrice;
  final String priceForIt;
  final int rating;
  final String ratingName;
  final List<String> imageUrls;
  final HotelDescription aboutTheHotel;

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

class HotelDescription extends Equatable {
  final String description;
  final List<String> peculiarities;

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
