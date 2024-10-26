
class TrangCfModel {
  final List<CoffeeItemModel>? items;

  TrangCfModel({this.items});

  TrangCfModel copyWith({List<CoffeeItemModel>? items}) {
    return TrangCfModel(
      items: items ?? this.items,
    );
  }
}


class CoffeeItemModel {
  final String name;
  final String description;
  final String price;
  final String image;

  CoffeeItemModel({
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });
}
