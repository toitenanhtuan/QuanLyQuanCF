class SinhToModel {
  List<SinhToItemModel>? items;

  SinhToModel({this.items});

  SinhToModel copyWith({List<SinhToItemModel>? items}) {
    return SinhToModel(
      items: items ?? this.items,
    );
  }
}

class SinhToItemModel {
  final String name;
  final String price;
  final String image;
  final String rating;

  SinhToItemModel({
    required this.name,
    required this.price,
    required this.image,
    required this.rating,
  });
}