import 'package:freezed_annotation/freezed_annotation.dart';

part 'post.freezed.dart';
part 'post.g.dart';

List<Post> postsFromJson(dynamic str) =>
    List<Post>.from((str).map((e) => Post.fromJson(e)));

@freezed
abstract class Post with _$Post {
  factory Post(
      {
      required String postId,
      required String PostDescription,
      required String Quantity,
      required String Price,
      required String TVA,
      required String Localisation,
      required String Category,
      required String PostImage}) = _Post;
  factory Post.fromJson(Map<String, dynamic> json) =>
      _$PostFromJson(json);
}

