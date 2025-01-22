import 'dart:convert';

LightCardModels lightCardModelsFromJson(String str) =>
    LightCardModels.fromJson(json.decode(str));

String lightCardModelsToJson(LightCardModels data) =>
    json.encode(data.toJson());

class LightCardModels {
  final int status;
  final String message;
  final int totalProducts;
  final List<Product> products;

  LightCardModels({
    required this.status,
    required this.message,
    required this.totalProducts,
    required this.products,
  });

  factory LightCardModels.fromJson(Map<String, dynamic> json) =>
      LightCardModels(
        status: json["status"],
        message: json["message"],
        totalProducts: json["totalProducts"],
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "totalProducts": totalProducts,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class Product {
  final int productId;
  final String productName;
  final String description;
  final String categoryName;
  final int categoryId;
  final String subCategoryName;
  final int subCategoryId;
  final String weight;
  final String karat;
  final String wastage;
  final String occasion;
  final String soulmate;
  final String gifting;
  final String gender;
  final int wholesalerId;
  final List<String> imageUrls;
  final bool checked;

  Product({
    required this.productId,
    required this.productName,
    required this.description,
    required this.categoryName,
    required this.categoryId,
    required this.subCategoryName,
    required this.subCategoryId,
    required this.weight,
    required this.karat,
    required this.wastage,
    required this.occasion,
    required this.soulmate,
    required this.gifting,
    required this.gender,
    required this.wholesalerId,
    required this.imageUrls,
    required this.checked,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        productId: json["productId"],
        productName: json["productName"],
        description: json["description"],
        categoryName: json["categoryName"],
        categoryId: json["categoryId"],
        subCategoryName: json["subCategoryName"],
        subCategoryId: json["subCategoryId"],
        weight: json["weight"],
        karat: json["karat"],
        wastage: json["wastage"],
        occasion: json["occasion"] ?? '',
        soulmate: json["soulmate"] ?? '',
        gifting: json["gifting"] ?? '',
        gender: json["gender"],
        wholesalerId: json["wholesalerId"],
        imageUrls: List<String>.from(json["imageUrls"].map((x) => x)),
        checked: json["checked"],
      );

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "productName": productName,
        "description": description,
        "categoryName": categoryName,
        "categoryId": categoryId,
        "subCategoryName": subCategoryName,
        "subCategoryId": subCategoryId,
        "weight": weight,
        "karat": karat,
        "wastage": wastage,
        "occasion": occasion,
        "soulmate": soulmate,
        "gifting": gifting,
        "gender": gender,
        "wholesalerId": wholesalerId,
        "imageUrls": List<dynamic>.from(imageUrls.map((x) => x)),
        "checked": checked,
      };
}
