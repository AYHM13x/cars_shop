class ProductAllProducts {
  int? id;
  String? title;
  String? description;
  String? image;
  int? comments;
  double? rate;
  String? createdAt;
  String? updatedAt;

  ProductAllProducts({
    this.id,
    this.title,
    this.description,
    this.image,
    this.comments,
    this.rate,
    this.createdAt,
    this.updatedAt,
  });

  @override
  String toString() {
    return 'Datum(id: $id, title: $title, description: $description, image: $image, comments: $comments, rate: $rate, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  factory ProductAllProducts.fromJson(Map<String, dynamic> json) =>
      ProductAllProducts(
        id: json['id'] as int?,
        title: json['title'] as String?,
        description: json['description'] as String?,
        image: json['image'] as String?,
        comments: json['comments'] as int?,
        rate: (json['rate'] as num?)?.toDouble(),
        createdAt: json['created_at'] as String?,
        updatedAt: json['updated_at'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'image': image,
        'comments': comments,
        'rate': rate,
        'created_at': createdAt,
        'updated_at': updatedAt,
      };
}
