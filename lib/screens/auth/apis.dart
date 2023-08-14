import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../models/user_profile.dart';

class API {
  // static User get user => auth.currentUser!;

  static FirebaseAuth auth = FirebaseAuth.instance;
  static late UserModel me;

  // to return current user
  static User get user => auth.currentUser!;
  // for authentication
//  static FirebaseAuth auth = FirebaseAuth.instance;

  // for accessing cloud firestore database
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  // for accessing firebase storage
  static FirebaseStorage storage = FirebaseStorage.instance;

  //static FirebaseFirestore firestore = FirebaseFirestore.instance;
  



// static FirebaseFirestore firestore = Firebase
   static Stream<QuerySnapshot<Map<String, dynamic>>> getspecuser (){
    return firestore.collection('users').where('phoneNumber',isNotEqualTo: user.phoneNumber).snapshots();
  
}



  
}
