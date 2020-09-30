import 'dart:convert';

import 'street.dart';

class Location {
  final Street street;
  final String city;
  final String state;
  final String country;

  Location({
    this.street,
    this.city,
    this.state,
    this.country,
  });

  Location copyWith({
    Street street,
    String city,
    String state,
    String country,
    String postcode,
  }) {
    return Location(
      street: street ?? this.street,
      city: city ?? this.city,
      state: state ?? this.state,
      country: country ?? this.country,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'street': street?.toMap(),
      'city': city,
      'state': state,
      'country': country,
    };
  }

  factory Location.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Location(
      street: Street.fromMap(map['street']),
      city: map['city'],
      state: map['state'],
      country: map['country'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Location.fromJson(String source) =>
      Location.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Location(street: $street, city: $city, state: $state, country: $country)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Location &&
        o.street == street &&
        o.city == city &&
        o.state == state &&
        o.country == country;
  }

  @override
  int get hashCode {
    return street.hashCode ^ city.hashCode ^ state.hashCode ^ country.hashCode;
  }
}
