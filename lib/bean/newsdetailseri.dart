import 'package:json_annotation/json_annotation.dart';
part 'newsdetailseri.g.dart';

@JsonSerializable()
class NewsDetailSeri {
  String title;
  String time;
  String src;
  String pic;
  String url;

  NewsDetailSeri(this.title, this.time, this.src, this.pic, this.url);

  //不同的类使用不同的mixin即可
  factory NewsDetailSeri.fromJson(Map<String, dynamic> json) => _$NewsDetailSeriFromJson(json);
  Map<String, dynamic> toJson() => _$NewsDetailSeriToJson(this);
}