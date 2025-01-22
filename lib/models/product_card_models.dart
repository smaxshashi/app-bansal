//lib/models/product_card_models.dart

import 'dart:convert';

ProductCardModels productCardModelsFromJson(String str) =>
    ProductCardModels.fromJson(json.decode(str));

String productCardModelsToJson(ProductCardModels data) =>
    json.encode(data.toJson());

class ProductCardModels {
  final int status;
  final String message;
  final int totalProducts;
  final List<Product> products;

  ProductCardModels({
    required this.status,
    required this.message,
    required this.totalProducts,
    required this.products,
  });

  factory ProductCardModels.fromJson(Map<String, dynamic> json) =>
      ProductCardModels(
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
  final int subCategoryId;
  final String subCategoryName;
  final String weight;
  final String karat;
  final String wastage;
  final String occasion;
  final String soulmate;
  final String gifting;
  final String gender;
  final String? tagNumber;
  final String? size;
  final String? length;
  final String? productType;
  final int wholesalerId;
  final String? wholesaler;
  final List<String> imageUrls;

  Product({
    required this.productId,
    required this.productName,
    required this.description,
    required this.categoryName,
    required this.categoryId,
    required this.subCategoryId,
    required this.subCategoryName,
    required this.weight,
    required this.karat,
    required this.wastage,
    required this.occasion,
    required this.soulmate,
    required this.gifting,
    required this.gender,
    required this.tagNumber,
    required this.size,
    required this.length,
    required this.productType,
    required this.wholesalerId,
    required this.wholesaler,
    required this.imageUrls,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        productId: json["productId"],
        productName: json["productName"],
        description: json["description"],
        categoryName: json["categoryName"],
        categoryId: json["categoryId"],
        subCategoryId: json["subCategoryId"],
        subCategoryName: json["subCategoryName"],
        weight: json["weight"],
        karat: json["karat"],
        wastage: json["wastage"],
        occasion: json["occasion"],
        soulmate: json["soulmate"],
        gifting: json["gifting"],
        gender: json["gender"],
        tagNumber: json["tagNumber"],
        size: json["size"],
        length: json["length"],
        productType: json["productType"],
        wholesalerId: json["wholesalerId"],
        wholesaler: json["wholesaler"],
        imageUrls: List<String>.from(json["imageUrls"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "productName": productName,
        "description": description,
        "categoryName": categoryName,
        "categoryId": categoryId,
        "subCategoryId": subCategoryId,
        "subCategoryName": subCategoryName,
        "weight": weight,
        "karat": karat,
        "wastage": wastage,
        "occasion": occasion,
        "soulmate": soulmate,
        "gifting": gifting,
        "gender": gender,
        "tagNumber": tagNumber,
        "size": size,
        "length": length,
        "productType": productType,
        "wholesalerId": wholesalerId,
        "wholesaler": wholesaler,
        "imageUrls": List<dynamic>.from(imageUrls.map((x) => x)),
      };
}
