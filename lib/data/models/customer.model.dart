import 'dart:convert';

Customer customerFromJson(String str) => Customer.fromJson(json.decode(str));

String customerToJson(Customer data) => json.encode(data.toJson());

class Customer {
  Customer({
    required this.id,
    // required this.userid,
    required this.fullname,
    required this.email,
    required this.password,
    required this.birthDate,
    required this.address,
    required this.zipcode,
    required this.city,
  });

  String id;
  // String userid;
  String fullname;
  String email;
  String password;
  String birthDate;
  String address;
  String zipcode;
  String city;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"],
        // userid: json["userid"],
        fullname: json["fullname"],
        email: json["email"],
        password: json["password"],
        birthDate: json["birthDate"],
        address: json["address"],
        zipcode: json["zipcode"],
        city: json["city"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        // "userid": userid,
        "fullname": fullname,
        "email": email,
        "password": password,
        "birthDate": birthDate,
        "address": address,
        "zipcode": zipcode,
        "city": city,
      };
}
