import 'user.dart';

class Comment {
  int? id;
  int? userId;
  int? productId;
  String? content;
  DateTime? createdAt;
  DateTime? updatedAt;
  User? user;

  Comment({
    this.id,
    this.userId,
    this.productId,
    this.content,
    this.createdAt,
    this.updatedAt,
    this.user,
  });

  @override
  String toString() {
    return 'Comment(id: $id, userId: $userId, productId: $productId, content: $content, createdAt: $createdAt, updatedAt: $updatedAt, user: $user)';
  }

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        id: json['id'] as int?,
        userId: json['user_id'] as int?,
        productId: json['product_id'] as int?,
        content: json['content'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'product_id': productId,
        'content': content,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'user': user?.toJson(),
      };
}
