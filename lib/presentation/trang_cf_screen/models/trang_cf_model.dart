
class TrangCfModel {
  List<CoffeeItemModel>? items;

  TrangCfModel({this.items});

  TrangCfModel copyWith({List<CoffeeItemModel>? items}){
    return TrangCfModel(
      items: items ?? this.items,
    );
  }
}

class CoffeeItemModel {
  final String name;
  final String price;
  final String image;
  final String rating;
  final String description;

  CoffeeItemModel({
    required this.name,
    required this.price,
    required this.image,
    required this.rating,
    required this.description,
  });
}
