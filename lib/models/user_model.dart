import 'dart:convert';

import 'location.dart';
import 'name.dart';
import 'picture.dart';

class UserModel {
  final Name name;
  final Location location;
  final String email;
  final String phone;
  final String cell;
  final Picture picture;
  UserModel({
    this.name,
    this.location,
    this.email,
    this.phone,
    this.cell,
    this.picture,
  });

  UserModel copyWith({
    Name name,
    Location location,
    String email,
    String phone,
    String cell,
    Picture picture,
  }) {
    return UserModel(
      name: name ?? this.name,
      location: location ?? this.location,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      cell: cell ?? this.cell,
      picture: picture ?? this.picture,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name?.toMap(),
      'location': location?.toMap(),
      'email': email,
      'phone': phone,
      'cell': cell,
      'picture': picture?.toMap(),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return UserModel(
      name: Name.fromMap(map['name']),
      location: Location.fromMap(map['location']),
      email: map['email'],
      phone: map['phone'],
      cell: map['cell'],
      picture: Picture.fromMap(map['picture']),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User_model(name: $name, location: $location, email: $email, phone: $phone, cell: $cell, picture: $picture)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is UserModel &&
        o.name == name &&
        o.location == location &&
        o.email == email &&
        o.phone == phone &&
        o.cell == cell &&
        o.picture == picture;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        location.hashCode ^
        email.hashCode ^
        phone.hashCode ^
        cell.hashCode ^
        picture.hashCode;
  }
}
