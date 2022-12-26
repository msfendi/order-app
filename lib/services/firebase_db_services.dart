import 'package:cloud_firestore/cloud_firestore.dart';

class firebaseDBServices {
  FirebaseFirestore db = FirebaseFirestore.instance;

  Future<QuerySnapshot<Map<String, dynamic>>> getCategory() async {
    var hasil = await db.collection('category').get();
    return hasil;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getAllProducts() {
    var hasil = db.collection('products').snapshots();
    return hasil;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getProductsByCategories(
      int idCategory) {
    var hasil = db
        .collection('products')
        .where('id_categories', isEqualTo: idCategory)
        .snapshots();
    return hasil;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getMyCart(String idUser) {
    var hasil =
        db.collection('cart').where('id_user', isEqualTo: idUser).snapshots();
    return hasil;
  }

  Future addProductToCart(
      {required String nameProduct,
      required int price,
      required int total_price,
      required int quantity,
      required String uid}) async {
    var product = {
      "id_user": uid,
      "name_product": nameProduct,
      "price": price,
      "total_price": total_price,
      "quantity": quantity,
      "status": 1
    };

    var hasil = await db
        .collection('cart')
        .doc()
        .set(product)
        .then((value) => print("success created"));
  }

  editProductInCart(
      {required int total_price,
      required int quantity,
      required String idPesanan}) async {
    var product = {"total_price": total_price, "quantity": quantity};

    var hasil = await db
        .collection('cart')
        .doc(idPesanan)
        .update(product)
        .then((value) => print("Data successfully update"));
  }

  deleteProduct(idProduct) async {
    var hasil = await db
        .collection('cart')
        .doc(idProduct)
        .delete()
        .then((value) => print("product successfully delete"));
  }
}
