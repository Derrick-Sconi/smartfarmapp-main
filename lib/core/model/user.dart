import 'package:equatable/equatable.dart';

/// [User] entity consists of the details of a user
class User extends Equatable {
  /// Unique identification
  final String uid;

  /// email
  final String email;

  /// password
  final String password;

  /// display name
  final String name;

  ///  address
  final String address;

  /// url of display picture
  final String photoURL;

  /// phone number of user
  final String phoneNumber;

  User({
    this.uid = '',
    this.email = '',
    this.password = '',
    this.name = '',
    this.address = '',
    this.phoneNumber = '',
    this.photoURL = '',
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      uid: json['uid'],
      email: json['email'],
      password: json['password'],
      name: json['name'],
      address: json['address'],
      phoneNumber: json['phoneNumber'],
      photoURL: json['photoURL'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'password': password,
      'name': name,
      'address': address,
      'phoneNumber': phoneNumber,
      'photoURL': photoURL,
    };
  }

  User copy({
    String? uid,
    String? email,
    String? password,
    String? name,
    String? address,
    String? phoneNumber,
    String? photoURL,
  }) {
    return User(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      password: password ?? this.password,
      name: name ?? this.name,
      address: address ?? this.address,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      photoURL: photoURL ?? this.photoURL,
    );
  }

  @override
  List<Object> get props => [
        uid,
        email,
        password,
        name,
        address,
        phoneNumber,
        photoURL,
      ];
}
