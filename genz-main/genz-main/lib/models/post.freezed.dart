// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Post _$PostFromJson(Map<String, dynamic> json) {
  return _Post.fromJson(json);
}

/// @nodoc
mixin _$Post {
  String get postId => throw _privateConstructorUsedError;
  String get PostDescription => throw _privateConstructorUsedError;
  String get Quantity => throw _privateConstructorUsedError;
  String get Price => throw _privateConstructorUsedError;
  String get TVA => throw _privateConstructorUsedError;
  String get Localisation => throw _privateConstructorUsedError;
  String get Category => throw _privateConstructorUsedError;
  String get PostImage => throw _privateConstructorUsedError;

  /// Serializes this Post to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PostCopyWith<Post> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostCopyWith<$Res> {
  factory $PostCopyWith(Post value, $Res Function(Post) then) =
      _$PostCopyWithImpl<$Res, Post>;
  @useResult
  $Res call(
      {String postId,
      String PostDescription,
      String Quantity,
      String Price,
      String TVA,
      String Localisation,
      String Category,
      String PostImage});
}

/// @nodoc
class _$PostCopyWithImpl<$Res, $Val extends Post>
    implements $PostCopyWith<$Res> {
  _$PostCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postId = null,
    Object? PostDescription = null,
    Object? Quantity = null,
    Object? Price = null,
    Object? TVA = null,
    Object? Localisation = null,
    Object? Category = null,
    Object? PostImage = null,
  }) {
    return _then(_value.copyWith(
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      PostDescription: null == PostDescription
          ? _value.PostDescription
          : PostDescription // ignore: cast_nullable_to_non_nullable
              as String,
      Quantity: null == Quantity
          ? _value.Quantity
          : Quantity // ignore: cast_nullable_to_non_nullable
              as String,
      Price: null == Price
          ? _value.Price
          : Price // ignore: cast_nullable_to_non_nullable
              as String,
      TVA: null == TVA
          ? _value.TVA
          : TVA // ignore: cast_nullable_to_non_nullable
              as String,
      Localisation: null == Localisation
          ? _value.Localisation
          : Localisation // ignore: cast_nullable_to_non_nullable
              as String,
      Category: null == Category
          ? _value.Category
          : Category // ignore: cast_nullable_to_non_nullable
              as String,
      PostImage: null == PostImage
          ? _value.PostImage
          : PostImage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PostImplCopyWith<$Res> implements $PostCopyWith<$Res> {
  factory _$$PostImplCopyWith(
          _$PostImpl value, $Res Function(_$PostImpl) then) =
      __$$PostImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String postId,
      String PostDescription,
      String Quantity,
      String Price,
      String TVA,
      String Localisation,
      String Category,
      String PostImage});
}

/// @nodoc
class __$$PostImplCopyWithImpl<$Res>
    extends _$PostCopyWithImpl<$Res, _$PostImpl>
    implements _$$PostImplCopyWith<$Res> {
  __$$PostImplCopyWithImpl(_$PostImpl _value, $Res Function(_$PostImpl) _then)
      : super(_value, _then);

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postId = null,
    Object? PostDescription = null,
    Object? Quantity = null,
    Object? Price = null,
    Object? TVA = null,
    Object? Localisation = null,
    Object? Category = null,
    Object? PostImage = null,
  }) {
    return _then(_$PostImpl(
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      PostDescription: null == PostDescription
          ? _value.PostDescription
          : PostDescription // ignore: cast_nullable_to_non_nullable
              as String,
      Quantity: null == Quantity
          ? _value.Quantity
          : Quantity // ignore: cast_nullable_to_non_nullable
              as String,
      Price: null == Price
          ? _value.Price
          : Price // ignore: cast_nullable_to_non_nullable
              as String,
      TVA: null == TVA
          ? _value.TVA
          : TVA // ignore: cast_nullable_to_non_nullable
              as String,
      Localisation: null == Localisation
          ? _value.Localisation
          : Localisation // ignore: cast_nullable_to_non_nullable
              as String,
      Category: null == Category
          ? _value.Category
          : Category // ignore: cast_nullable_to_non_nullable
              as String,
      PostImage: null == PostImage
          ? _value.PostImage
          : PostImage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PostImpl implements _Post {
  _$PostImpl(
      {required this.postId,
      required this.PostDescription,
      required this.Quantity,
      required this.Price,
      required this.TVA,
      required this.Localisation,
      required this.Category,
      required this.PostImage});

  factory _$PostImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostImplFromJson(json);

  @override
  final String postId;
  @override
  final String PostDescription;
  @override
  final String Quantity;
  @override
  final String Price;
  @override
  final String TVA;
  @override
  final String Localisation;
  @override
  final String Category;
  @override
  final String PostImage;

  @override
  String toString() {
    return 'Post(postId: $postId, PostDescription: $PostDescription, Quantity: $Quantity, Price: $Price, TVA: $TVA, Localisation: $Localisation, Category: $Category, PostImage: $PostImage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostImpl &&
            (identical(other.postId, postId) || other.postId == postId) &&
            (identical(other.PostDescription, PostDescription) ||
                other.PostDescription == PostDescription) &&
            (identical(other.Quantity, Quantity) ||
                other.Quantity == Quantity) &&
            (identical(other.Price, Price) || other.Price == Price) &&
            (identical(other.TVA, TVA) || other.TVA == TVA) &&
            (identical(other.Localisation, Localisation) ||
                other.Localisation == Localisation) &&
            (identical(other.Category, Category) ||
                other.Category == Category) &&
            (identical(other.PostImage, PostImage) ||
                other.PostImage == PostImage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, postId, PostDescription,
      Quantity, Price, TVA, Localisation, Category, PostImage);

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostImplCopyWith<_$PostImpl> get copyWith =>
      __$$PostImplCopyWithImpl<_$PostImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostImplToJson(
      this,
    );
  }
}

abstract class _Post implements Post {
  factory _Post(
      {required final String postId,
      required final String PostDescription,
      required final String Quantity,
      required final String Price,
      required final String TVA,
      required final String Localisation,
      required final String Category,
      required final String PostImage}) = _$PostImpl;

  factory _Post.fromJson(Map<String, dynamic> json) = _$PostImpl.fromJson;

  @override
  String get postId;
  @override
  String get PostDescription;
  @override
  String get Quantity;
  @override
  String get Price;
  @override
  String get TVA;
  @override
  String get Localisation;
  @override
  String get Category;
  @override
  String get PostImage;

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostImplCopyWith<_$PostImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
