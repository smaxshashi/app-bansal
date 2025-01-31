import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CartController extends GetxController {
  var cartItems = [].obs;
  var isLoading = false.obs;

  Future<void> addToCart(String userId, String productId) async {
    isLoading.value = true;
    final url = Uri.parse(
        'https://user-service-254137058023.asia-south1.run.app/user/cart/add?userId=$userId&productId=$productId');
    try {
      final response = await http.post(url);
      if (response.statusCode == 200) {
        fetchCartItems(userId);
        Get.snackbar(
          'Yay! 🎉',
          'Your item has been added to the cart 🛒. Happy shopping! 😊',
          snackPosition: SnackPosition.BOTTOM,
          margin: EdgeInsets.only(bottom: 20.h),
          backgroundColor: const Color.fromARGB(255, 1, 80, 4),
          colorText: Colors.white, // Change text color here
        );
      } else {
        Get.snackbar(
          'Oops! 😓',
          'Failed to add item to cart. Please try again later. 🚫',
          snackPosition: SnackPosition.BOTTOM,
          margin: EdgeInsets.only(bottom: 20.h),
          backgroundColor: Colors.red,
          colorText: Colors.white, // Change text color here
        );
      }
    } catch (e) {
      Get.snackbar(
        'Network Issue 🌐',
        'Oops! Something went wrong with the network: $e. Please try again. ⚠️',
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.only(bottom: 20.h),
        backgroundColor: Colors.red,
        colorText: Colors.white, // Change text color here
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchCartItems(String userId) async {
    isLoading.value = true;
    final url = Uri.parse(
        'https://user-service-254137058023.asia-south1.run.app/user/cart/getItem?userId=$userId');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        cartItems.value = data['finalProductList'] ?? [];
      } else {
        Get.snackbar(
          'Oops! 😓',
          'Failed to fetch cart items. Please try again. 🚫',
          snackPosition: SnackPosition.BOTTOM,
          margin: EdgeInsets.only(bottom: 20.h),
          backgroundColor: Colors.red,
          colorText: Colors.white, // Change text color here
        );
      }
    } catch (e) {
      Get.snackbar(
        'Network Issue 🌐',
        'Oops! Something went wrong with the network: $e. Please try again. ⚠️',
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.only(bottom: 20.h),
        backgroundColor: Colors.red,
        colorText: Colors.white, // Change text color here
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> removeFromCart(String userId, String productId) async {
    isLoading.value = true;
    final url = Uri.parse(
        'https://user-service-254137058023.asia-south1.run.app/user/cart/remove?userId=$userId&productId=$productId');
    try {
      final response = await http.post(url);
      if (response.statusCode == 200) {
        fetchCartItems(userId);
        Get.snackbar(
          'Success!',
          'Item has been removed from your cart 🛒. We’ll miss it! 😔',
          snackPosition: SnackPosition.BOTTOM,
          margin: EdgeInsets.only(bottom: 20.h),
          backgroundColor: const Color.fromARGB(255, 1, 80, 4),
          colorText: Colors.white, // Change text color here
        );
      } else {
        Get.snackbar(
          'Oops! 😓',
          'Failed to remove item from cart. Please try again later. 🚫',
          snackPosition: SnackPosition.BOTTOM,
          margin: EdgeInsets.only(bottom: 20.h),
          backgroundColor: Colors.red,
          colorText: Colors.white, // Change text color here
        );
      }
    } catch (e) {
      Get.snackbar(
        'Network Issue 🌐',
        'Oops! Something went wrong with the network: $e. Please try again. ⚠️',
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.only(bottom: 20.h),
        backgroundColor: Colors.red,
        colorText: Colors.white, // Change text color here
      );
    } finally {
      isLoading.value = false;
    }
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:gehnamall/hooks/fetch_wholesaler_id.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class CartController extends GetxController {
//   var cartItems = [].obs;
//   var isLoading = false.obs;

//   // Helper to append wholesalerId
//   Future<Uri> appendWholesalerId(Uri baseUri) async {
//     final wholesalerId = await fetchWholesalerId();
//     if (wholesalerId != null) {
//       final newQuery = {
//         ...baseUri.queryParameters,
//         'wholesalerId': '$wholesalerId'
//       };
//       return baseUri.replace(queryParameters: newQuery);
//     }
//     return baseUri;
//   }

//   Future<void> addToCart(String userId, String productId) async {
//     isLoading.value = true;
//     final baseUrl = Uri.parse(
//         'https://user-service-254137058023.asia-south1.run.app/user/add?userId=$userId&productId=$productId');
//     final url = await appendWholesalerId(baseUrl);

//     try {
//       final response = await http.post(url);
//       if (response.statusCode == 200) {
//         fetchCartItems(userId);
//         Get.snackbar(
//           'Yay! 🎉',
//           'Your item has been added to the cart 🛒. Happy shopping! 😊',
//           snackPosition: SnackPosition.BOTTOM,
//           margin: EdgeInsets.only(bottom: 20.h),
//           backgroundColor: const Color.fromARGB(255, 1, 80, 4),
//           colorText: Colors.white,
//         );
//       } else {
//         Get.snackbar(
//           'Oops! 😓',
//           'Failed to add item to cart. Please try again later. 🚫',
//           snackPosition: SnackPosition.BOTTOM,
//           margin: EdgeInsets.only(bottom: 20.h),
//           backgroundColor: Colors.red,
//           colorText: Colors.white,
//         );
//       }
//     } catch (e) {
//       Get.snackbar(
//         'Network Issue 🌐',
//         'Oops! Something went wrong with the network: $e. Please try again. ⚠️',
//         snackPosition: SnackPosition.BOTTOM,
//         margin: EdgeInsets.only(bottom: 20.h),
//         backgroundColor: Colors.red,
//         colorText: Colors.white,
//       );
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   Future<void> fetchCartItems(String userId) async {
//     isLoading.value = true;
//     final baseUrl = Uri.parse(
//         'https://user-service-254137058023.asia-south1.run.app/user/getItem?userId=$userId');
//     final url = await appendWholesalerId(baseUrl);

//     try {
//       final response = await http.get(url);
//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         cartItems.value = data['enhancedProducts'] ?? [];
//       } else {
//         Get.snackbar(
//           'Oops! 😓',
//           'plz Login🚫',
//           snackPosition: SnackPosition.BOTTOM,
//           margin: EdgeInsets.only(bottom: 20.h),
//           backgroundColor: Colors.red,
//           colorText: Colors.white,
//         );
//       }
//     } catch (e) {
//       Get.snackbar(
//         'Network Issue 🌐',
//         'Oops! Something went wrong with the network: $e. Please try again. ⚠️',
//         snackPosition: SnackPosition.BOTTOM,
//         margin: EdgeInsets.only(bottom: 20.h),
//         backgroundColor: Colors.red,
//         colorText: Colors.white,
//       );
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   Future<void> removeFromCart(String userId, String productId) async {
//     isLoading.value = true;
//     final baseUrl = Uri.parse(
//         'https://user-service-254137058023.asia-south1.run.app/user/remove?userId=$userId&productId=$productId');
//     final url = await appendWholesalerId(baseUrl);

//     try {
//       final response = await http.post(url);
//       if (response.statusCode == 200) {
//         fetchCartItems(userId);
//         Get.snackbar(
//           'Success!',
//           'Item has been removed from your cart 🛒. We’ll miss it! 😔',
//           snackPosition: SnackPosition.BOTTOM,
//           margin: EdgeInsets.only(bottom: 20.h),
//           backgroundColor: const Color.fromARGB(255, 1, 80, 4),
//           colorText: Colors.white,
//         );
//       } else {
//         Get.snackbar(
//           'Oops! 😓',
//           'Failed to remove item from cart. Please try again later. 🚫',
//           snackPosition: SnackPosition.BOTTOM,
//           margin: EdgeInsets.only(bottom: 20.h),
//           backgroundColor: Colors.red,
//           colorText: Colors.white,
//         );
//       }
//     } catch (e) {
//       Get.snackbar(
//         'Network Issue 🌐',
//         'Oops! Something went wrong with the network: $e. Please try again. ⚠️',
//         snackPosition: SnackPosition.BOTTOM,
//         margin: EdgeInsets.only(bottom: 20.h),
//         backgroundColor: Colors.red,
//         colorText: Colors.white,
//       );
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }
