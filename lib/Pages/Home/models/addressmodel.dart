// To parse this JSON data, do
//
//     final address = addressFromJson(jsonString);

import 'dart:convert';

Address addressFromJson(String str) => Address.fromJson(json.decode(str));

String addressToJson(Address data) => json.encode(data.toJson());

class Address {
    String id;
    String fullname;
    String phonenumber;
    String alternatenumber;
    String pincode;
    String state;
    String city;
    String landmark;
    String housenumber;
    String area;
    String addresstype;
    int v;

    Address({
        required this.id,
        required this.fullname,
        required this.phonenumber,
        required this.alternatenumber,
        required this.pincode,
        required this.state,
        required this.city,
        required this.landmark,
        required this.housenumber,
        required this.area,
        required this.addresstype,
        required this.v,
    });

    factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["_id"],
        fullname: json["Fullname"],
        phonenumber: json["Phonenumber"],
        alternatenumber: json["Alternatenumber"],
        pincode: json["Pincode"],
        state: json["State"],
        city: json["City"],
        landmark: json["Landmark"],
        housenumber: json["Housenumber"],
        area: json["Area"],
        addresstype: json["Addresstype"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "Fullname": fullname,
        "Phonenumber": phonenumber,
        "Alternatenumber": alternatenumber,
        "Pincode": pincode,
        "State": state,
        "City": city,
        "Landmark": landmark,
        "Housenumber": housenumber,
        "Area": area,
        "Addresstype": addresstype,
        "__v": v,
    };
}
