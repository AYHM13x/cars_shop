import 'comment.dart';

class ProductsDetails {
  int? id;
  String? title;
  String? description;
  String? image;
  DateTime? createdAt;
  DateTime? updatedAt;
  double? rate;
  List<Comment>? comments;

  ProductsDetails({
    this.id,
    this.title,
    this.description,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.rate,
    this.comments,
  });

  @override
  String toString() {
    return 'Data(id: $id, title: $title, description: $description, image: $image, createdAt: $createdAt, updatedAt: $updatedAt, rate: $rate, comments: $comments)';
  }

  factory ProductsDetails.fromJson(Map<String, dynamic> json) =>
      ProductsDetails(
        id: json['id'] as int?,
        title: json['title'] as String?,
        description: json['description'] as String?,
        image: json['image'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        rate: (json['rate'] as num?)?.toDouble(),
        comments: (json['comments'] as List<dynamic>?)
            ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'image': image,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'rate': rate,
        'comments': comments?.map((e) => e.toJson()).toList(),
      };
}
