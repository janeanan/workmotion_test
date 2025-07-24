import 'package:json_annotation/json_annotation.dart';
part 'employ.g.dart';

@JsonSerializable()
class Employ {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "position")
  String? position;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "phone")
  String? phone;

  Employ({this.id, this.name, this.position, this.email, this.phone});

  factory Employ.fromJson(Map<String, dynamic> json) => _$EmployFromJson(json);

  Map<String, dynamic> toJson() => _$EmployToJson(this);
}
