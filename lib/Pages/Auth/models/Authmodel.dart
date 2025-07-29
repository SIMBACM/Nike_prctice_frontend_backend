// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
    String firstname;
    String lastname;
    String email;
    String password;
    String day;
    String month;
    String year;

    Welcome({
        required this.firstname,
        required this.lastname,
        required this.email,
        required this.password,
        required this.day,
        required this.month,
        required this.year,
    });

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        firstname: json["Firstname"],
        lastname: json["Lastname"],
        email: json["Email"],
        password: json["Password"],
        day: json["Day"],
        month: json["Month"],
        year: json["Year"],
    );

    Map<String, dynamic> toJson() => {
        "Firstname": firstname,
        "Lastname": lastname,
        "Email": email,
        "Password": password,
        "Day": day,
        "Month": month,
        "Year": year,
    };
}
