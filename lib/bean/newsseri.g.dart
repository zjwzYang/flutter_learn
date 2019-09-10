// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'newsseri.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsSeri _$NewsSeriFromJson(Map<String, dynamic> json) {
  return NewsSeri(
      json['status'] as int,
      json['msg'] as String,
      json['result'] == null
          ? null
          : ResultSeri.fromJson(json['result'] as Map<String, dynamic>));
}

Map<String, dynamic> _$NewsSeriToJson(NewsSeri instance) => <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'result': instance.result
    };
