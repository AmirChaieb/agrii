// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostImpl _$$PostImplFromJson(Map<String, dynamic> json) => _$PostImpl(
      postId: json['postId'] as String,
      PostDescription: json['PostDescription'] as String,
      Quantity: json['Quantity'] as String,
      Price: json['Price'] as String,
      TVA: json['TVA'] as String,
      Localisation: json['Localisation'] as String,
      Category: json['Category'] as String,
      PostImage: json['PostImage'] as String,
    );

Map<String, dynamic> _$$PostImplToJson(_$PostImpl instance) =>
    <String, dynamic>{
      'postId': instance.postId,
      'PostDescription': instance.PostDescription,
      'Quantity': instance.Quantity,
      'Price': instance.Price,
      'TVA': instance.TVA,
      'Localisation': instance.Localisation,
      'Category': instance.Category,
      'PostImage': instance.PostImage,
    };
