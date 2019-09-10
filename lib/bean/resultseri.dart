import 'package:json_annotation/json_annotation.dart';
import 'newsdetailseri.dart';
part 'resultseri.g.dart';

@JsonSerializable()
class ResultSeri {
  String channel;
  int num;
  List<NewsDetailSeri> list;

  ResultSeri(this.channel, this.num, this.list);
  
//不同的类使用不同的mixin即可
  factory ResultSeri.fromJson(Map<String, dynamic> json) => _$ResultSeriFromJson(json);
  Map<String, dynamic> toJson() => _$ResultSeriToJson(this);
}