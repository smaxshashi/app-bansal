import 'dart:convert';
import 'package:http/http.dart' as http;

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
  final int wholesalerId;
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
    required this.wholesalerId,
    required this.imageUrls,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
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
      wholesalerId: json["wholesalerId"],
      imageUrls: List<String>.from(json["imageUrls"] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
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
      "wholesalerId": wholesalerId,
      "imageUrls": imageUrls,
    };
  }
}

Future<List<Product>> fetchProducts({
  required String categoryId,
  required int wholesalerId,
}) async {
  final url = Uri.parse(
      'https://product-service-254137058023.asia-south1.run.app/product/getProducts');

  final body = {
    "categoryId": categoryId,
    "wholesalerId": wholesalerId,
  };

  final response = await http.post(
    url,
    headers: {
      "Content-Type": "application/json",
    },
    body: jsonEncode(body),
  );

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    if (data['status'] == 0 && data['products'] != null) {
      return List<Product>.from(
        data['products'].map((product) => Product.fromJson(product)),
      );
    } else {
      throw Exception(data['message'] ?? 'Failed to fetch products');
    }
  } else {
    throw Exception(
        'Failed to fetch products. Status code: ${response.statusCode}');
  }
}
