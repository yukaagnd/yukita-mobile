// To parse this JSON data, do
//
//     final shopEntry = shopEntryFromJson(jsonString);

import 'dart:convert';

List<ShopEntry> shopEntryFromJson(String str) => List<ShopEntry>.from(json.decode(str).map((x) => ShopEntry.fromJson(x)));

String shopEntryToJson(List<ShopEntry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ShopEntry {
    Model model;
    String pk;
    Fields fields;

    ShopEntry({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory ShopEntry.fromJson(Map<String, dynamic> json) => ShopEntry(
        model: modelValues.map[json["model"]]!,
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": modelValues.reverse[model],
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    int user;
    String productName;
    int price;
    int quantity;
    String location;
    String description;

    Fields({
        required this.user,
        required this.productName,
        required this.price,
        required this.quantity,
        required this.location,
        required this.description,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        productName: json["product_name"],
        price: json["price"],
        quantity: json["quantity"],
        location: json["location"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "product_name": productName,
        "price": price,
        "quantity": quantity,
        "location": location,
        "description": description,
    };
}

enum Model {
    MAIN_SHOPENTRY
}

final modelValues = EnumValues({
    "main.shopentry": Model.MAIN_SHOPENTRY
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
