// import 'dart:convert';

// import 'package:bavera/app/data/entities/match_entities.dart';
// import 'package:bavera/app/data/entities/user.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import '../../utils/constants.dart';
// import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:bavera/app/data/entities/match_entities.dart';
import 'package:bavera/app/data/entities/user.dart';
import 'package:bavera/app/utils/constants.dart';
import 'package:http/http.dart' as http;

class BaveraRepository {
  Future<List<MatchEntity>> matchListAll() async {
    var url = Uri.parse('$baseUrl/match?select=*');
    var headers = {'apikey': apiKey, 'Authorization': 'Bearer $apiKey'};
    final response = await http.get(url, headers: headers);

    return (jsonDecode(response.body) as List)
        .map((e) => MatchEntity.fromJson(e))
        .toList();
  }

  Future<List<UserEntity>> usersListAll() async {
    var url = Uri.parse('$baseUrl/match?select=*');
    var headers = {'apikey': apiKey, 'Authorization': 'Bearer $apiKey'};
    final response = await http.get(url, headers: headers);

    return (jsonDecode(response.body) as List)
        .map((e) => UserEntity.fromJson(e))
        .toList();
  }
}
// class BaveraRepository {
//  Future<List<MatchEntity>> getMatch({
//     required String nameSatu,
//     required String nameDua,
//     required String nameTiga,
//     required String nameEmpat,
//     required int skorTeamSatu,
//     required int skorTeamDua,
//     required int kok,
//     required int lapangan,
//   }) async {
//     final listMatch =
//         Supabase.instance.client.from('match').stream(primaryKey: ['id']);

//     // Listen for new data from the stream and add it to the allDebtDataList list.
//     listMatch.listen((match) {
      

   
//     });
//   }
//   // Future createUser({
//   //   required String name,
//   //   required String npm,
//   // }) async {
//   //   final docProduct = FirebaseFirestore.instance.collection('user').doc();

//   //   final user = UserEntity(name: name, npm: npm);
//   //   final json = user.toJson();
//   //   await docProduct.set(json);
//   // }

//   // Future<List<UserEntity>> getUserList() async {
//   //   final response = await FirebaseFirestore.instance.collection("user").get();

//   //   print(response.docs.length);

//   //   final List<UserEntity> users = [];
//   //   // for (final doc in response.docs) {
//   //   //   final userEntity = UserEntity.fromJson(doc.data());
//   //   //   users.add(userEntity);
//   //   // }
//   //   print(users);
//   //   return users;
//   // }

//   // static Future createTransaction({
//   //   required String name,
//   //   required String sellPrice,
//   //   required String buyPrice,
//   //   required String code,
//   //   required String? image,
//   //   required String stock,
//   //   required int totalOrder,
//   // }) async {
//   //   final docTransaction = FirebaseFirestore.instance.collection('transaction').doc();
//   //   final userId = FirebaseAuth.instance.currentUser!.uid;

//   //   final transaction = TransactionData(
//   //     userId: userId,
//   //     name: name,
//   //     sellPrice: int.parse(sellPrice),
//   //     buyPrice: int.parse(buyPrice),
//   //     code: code,
//   //     stock: int.parse(stock),
//   //     image: image,
//   //     date: DateTime.now(),
//   //     uuid: docTransaction.id,
//   //     totalOrder: totalOrder,
//   //   );

//   //   final json = transaction.toJson();

//   //   await docTransaction.set(json);
//   // }

//   // static Future createCart({
//   //   required String? name,
//   //   required String? sellPrice,
//   //   required String? buyPrice,
//   //   required String? code,
//   //   required String? image,
//   //   required String? stock,
//   //   required String? totalOrder,
//   //   required String? profit,
//   //   String? subTotal,
//   //   String? cash,
//   // }) async {
//   //   final docCart = FirebaseFirestore.instance.collection('report').doc();
//   //   final userId = FirebaseAuth.instance.currentUser!.uid;

//   //   final cart = Cart(
//   //     cash: int.parse(cash!),
//   //     subTotal: int.parse(subTotal!),
//   //     profit: int.parse(profit!),
//   //     userId: userId,
//   //     name: name,
//   //     sellPrice: int.parse(sellPrice!),
//   //     buyPrice: int.parse(buyPrice!),
//   //     code: code,
//   //     stock: int.parse(stock!),
//   //     image: image,
//   //     date: DateTime.now(),
//   //     uuid: docCart.id,
//   //     totalOrder: int.parse(totalOrder!),
//   //   );

//   //   final json = cart.toJson();

//   //   await docCart.set(json);
//   // }

//   // static Future createLaporan({
//   //   required String? name,
//   //   required String? totalOrder,
//   //   required String? profit,
//   //   required String? totalTransaction,
//   //   required String? income,
//   // }) async {
//   //   final docCart = FirebaseFirestore.instance.collection('laporan').doc();
//   //   final userId = FirebaseAuth.instance.currentUser!.uid;

//   //   final cart = Report(
//   //     totalTransaction: int.parse(totalTransaction!),
//   //     profit: int.parse(profit!),
//   //     userId: userId,
//   //     income: int.parse(income!),
//   //     date: DateTime.now(),
//   //     uuid: docCart.id,
//   //   );

//   //   final json = cart.toJson();

//   //   await docCart.set(json);
//   // }

//   // static Future getLaporan() async {
//   //   List itemsList = [];
//   //   try {
//   //     await FirebaseFirestore.instance.collection("laporan").get().then((querySnapshot) {
//   //       for (var element in querySnapshot.docs) {
//   //         itemsList.add(element);
//   //       }
//   //     });
//   //     return itemsList;
//   //   } catch (e) {}
//   // }

//   // static Future<List<dynamic>?> getReport() async {
//   //   List itemsList = [];
//   //   try {
//   //     await FirebaseFirestore.instance.collection("report").get().then((querySnapshot) {
//   //       for (var element in querySnapshot.docs) {
//   //         itemsList.add(element);
//   //       }
//   //     });
//   //     return itemsList;
//   //   } catch (e) {
//   //     return null;
//   //   }
//   // }

//   // static Future<void> addProduct({
//   //   required Map<String, dynamic> data,
//   // }) async {
//   //   String? imagePath = data['image'];
//   //   if (imagePath != null) {
//   //     await uploadImage(File(imagePath)).then((url) {
//   //       data['image'] = url;
//   //     });
//   //   }
//   //   add(collectionName: 'products', data: data);
//   // }

//   // static Future<List<Map<String, dynamic>>> getProduct() async {
//   //   List<Map<String, dynamic>> data = [];
//   //   await get(collectionName: 'products').then((value) {
//   //     data = value.docs.map((doc) {
//   //       var dat = doc.data();
//   //       dat['uuid'] = doc.get('uuid');
//   //       return dat;
//   //     }).toList();
//   //   });

//   //   return data;
//   // }

//   // static Future<List<Map<String, dynamic>>> getTransactionFirebase() async {
//   //   List<Map<String, dynamic>> data = [];
//   //   await get(collectionName: 'transaction').then((value) {
//   //     data = value.docs.map((doc) {
//   //       var dat = doc.data();
//   //       return dat;
//   //     }).toList();
//   //   });

//   //   return data;
//   // }

//   // static Future<void> add({
//   //   required String collectionName,
//   //   required Map<String, dynamic> data,
//   // }) async {
//   //   _firestore.collection(collectionName).add(data).catchError(
//   //     (e) {
//   //       log(e);
//   //     },
//   //   );
//   // }

//   // static Future<QuerySnapshot<Map<String, dynamic>>> get({
//   //   required String collectionName,
//   // }) async {
//   //   return await _firestore.collection(collectionName).where('user_id', isEqualTo: Session.user.id).get();
//   // }

//   // static Future<void> update({
//   //   required String collection,
//   //   required Map<String, dynamic> data,
//   //   required String uuid,
//   // }) async {
//   //   _firestore.collection(collection).doc(uuid).update(data).catchError(
//   //     (e) {
//   //       log(e);
//   //     },
//   //   );
//   // }

//   // static Future<void> delete({required String collectionName, required String documentID}) async {
//   //   _firestore.collection(collectionName).doc(documentID).delete().catchError(
//   //     (e) {
//   //       log(e);
//   //     },
//   //   );
//   // }

//   // static Future<dynamic> getUserByEmail(String email) async {
//   //   CollectionReference ref = _firestore.collection('users');

//   //   QuerySnapshot querySnapshot = await ref.where('email', isEqualTo: email).get();

//   //   if (querySnapshot.docs.isNotEmpty) {
//   //     return querySnapshot.docs.first.data();
//   //   } else {
//   //     return null;
//   //   }
//   // }

//   // static Future<dynamic> getProductByID(String id) async {
//   //   CollectionReference ref = _firestore.collection('products');

//   //   QuerySnapshot querySnapshot = await ref.where('uuid', isEqualTo: id).get();

//   //   if (querySnapshot.docs.isNotEmpty) {
//   //     return querySnapshot.docs.first.data();
//   //   } else {
//   //     return null;
//   //   }
//   // }

//   // static Future<String> uploadImage(File image) async {
//   //   String userId = Session.user.id ?? FirebaseAuth.instance.currentUser!.uid;
//   //   Reference storageRef = FirebaseStorage.instance.ref();
//   //   UploadTask task = storageRef.child("$userId/images/${DateTime.now()}").putFile(image);
//   //   TaskSnapshot snapshot = await task.whenComplete(() => null);
//   //   String downloadUrl = await snapshot.ref.getDownloadURL();
//   //   return downloadUrl;
//   // }
// }
