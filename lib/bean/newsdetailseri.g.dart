// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'newsdetailseri.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsDetailSeri _$NewsDetailSeriFromJson(Map<String, dynamic> json) {
  return NewsDetailSeri(json['title'] as String, json['time'] as String,
      json['src'] as String, json['pic'] as String, json['url'] as String);
}

Map<String, dynamic> _$NewsDetailSeriToJson(NewsDetailSeri instance) =>
    <String, dynamic>{
      'title': instance.title,
      'time': instance.time,
      'src': instance.src,
      'pic': instance.pic,
      'url': instance.url
    };
