class Room {
  final int id;
  final String name;
  final int price;
  final String pricePer;
  final List<String> peculiarities;
  final List<String> imageUrls;

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
