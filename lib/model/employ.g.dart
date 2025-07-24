// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employ.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Employ _$EmployFromJson(Map<String, dynamic> json) => Employ(
  id: json['id'] as String?,
  name: json['name'] as String?,
  position: json['position'] as String?,
  email: json['email'] as String?,
  phone: json['phone'] as String?,
);

Map<String, dynamic> _$EmployToJson(Employ instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'position': instance.position,
  'email': instance.email,
  'phone': instance.phone,
};
