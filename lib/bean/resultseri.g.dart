// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resultseri.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultSeri _$ResultSeriFromJson(Map<String, dynamic> json) {
  return ResultSeri(
      json['channel'] as String,
      json['num'] as int,
      (json['list'] as List)
          ?.map((e) => e == null
              ? null
              : NewsDetailSeri.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$ResultSeriToJson(ResultSeri instance) =>
    <String, dynamic>{
      'channel': instance.channel,
      'num': instance.num,
      'list': instance.list
    };
