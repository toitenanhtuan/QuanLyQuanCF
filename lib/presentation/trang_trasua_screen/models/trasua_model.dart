class TraSuaModel {
  List<TraSuaItemModel>? items;

  TraSuaModel({this.items});

  TraSuaModel copyWith({List<TraSuaItemModel>? items}) {
    return TraSuaModel(
      items: items ?? this.items,
    );
  }
}

class TraSuaItemModel {
  final String name;
  final String price;
  final String image;
  final String rating;

  TraSuaItemModel({
    required this.name,
    required this.price,
    required this.image,
    required this.rating,
  });
}