import 'package:json_annotation/json_annotation.dart';
import 'resultseri.dart';
part 'newsseri.g.dart';

@JsonSerializable()
class NewsSeri {
  int status;
  String msg;
  ResultSeri result;

  NewsSeri(this.status, this.msg, this.result);

  //不同的类使用不同的mixin即可
  factory NewsSeri.fromJson(Map<String, dynamic> json) => _$NewsSeriFromJson(json);
  Map<String, dynamic> toJson() => _$NewsSeriToJson(this);
}
