import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_firebase/core/exceptions/firebase_auth_exceptions.dart';
import 'package:e_commerce_firebase/core/exceptions/firebase_exceptions.dart';
import 'package:e_commerce_firebase/core/exceptions/platform_exceptions.dart';
import 'package:e_commerce_firebase/core/services/firestore_service.dart';
import 'package:e_commerce_firebase/features/categories/data/models/categories_model.dart';
import 'package:e_commerce_firebase/features/home/data/models/product_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class HomeRepo {
  final _service = FireStoreServices.instance;

  Future<List<ProductModel>> getProductList() async {
    try {
      var list = await _service.getCollectionData(collectionName: "products");

      var response = list.map((e) {
        return ProductModel.fromJson(e.data() as Map<String, dynamic>);
      }).toList();

      return response;
    } on FirebaseAuthException catch (e) {
      throw AppFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<List<CategoriesModel>> getCategoriesList() async {
    try {
      var list = await _service.getCollectionData(collectionName: "categories");

      var response = list.map((e) {
        return CategoriesModel.fromJson(e.data() as Map<String, dynamic>);
      }).toList();

      return response;
    } on FirebaseAuthException catch (e) {
      throw AppFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<List<ProductModel>> getOffersList() async {
    try {
      var list = await _service.getCollectionData(collectionName: "offers");

      var response = list.map((e) {
        return ProductModel.fromJson(e.data() as Map<String, dynamic>);
      }).toList();

      return response;
    } on FirebaseAuthException catch (e) {
      throw AppFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> addFavoriteProduct(ProductModel product) async {
    try {
      var favoritesRef = FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('favorites')
          .doc(product.productId.toString());

      return await favoritesRef.set(product.toJson());
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> removeFavoriteProduct(ProductModel product) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('favorites')
          .doc(product.productId.toString())
          .delete();
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<List<ProductModel>> fetchUserFavorites() async {
    try {
      var favoritesSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('favorites')
          .get();

      return favoritesSnapshot.docs
          .map((doc) => ProductModel.fromJson(doc.data()))
          .toList();
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<bool> isProductFavorite(ProductModel product) async {
    try {
      var favoriteDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('favorites')
          .doc(product.productId.toString())
          .get();

      return favoriteDoc.exists;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw e.toString();
    }
  }

  Stream<List<ProductModel>> listenToFavorites() {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth
            .instance.currentUser!.uid)
        .collection('favorites')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => ProductModel.fromJson(doc.data()))
          .toList();
    });
  }
}
