import 'package:json_annotation/json_annotation.dart';
part 'out_source.g.dart';

@JsonSerializable()
class OutSource {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "company")
  String? company;
  @JsonKey(name: "username")
  String? username;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "address")
  String? address;
  @JsonKey(name: "zip")
  String? zip;
  @JsonKey(name: "state")
  String? state;
  @JsonKey(name: "country")
  String? country;
  @JsonKey(name: "phone")
  String? phone;
  @JsonKey(name: "photo")
  String? photo;

  OutSource({
    this.id,
    this.name,
    this.company,
    this.username,
    this.email,
    this.address,
    this.zip,
    this.state,
    this.country,
    this.phone,
    this.photo,
  });

  factory OutSource.fromJson(Map<String, dynamic> json) =>
      _$OutSourceFromJson(json);

  Map<String, dynamic> toJson() => _$OutSourceToJson(this);
}
