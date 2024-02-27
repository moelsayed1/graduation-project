
import 'package:cloud_firestore/cloud_firestore.dart';



Future<void> addUserDataToFireBase({
  required Map userData , required String uID
}){
  CollectionReference user = FirebaseFirestore.instance.collection("usersData");
  return  user.doc(uID).set(userData).then((value) {()=>value ;
  }) ;
}


