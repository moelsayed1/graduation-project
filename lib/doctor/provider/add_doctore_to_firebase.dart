
import 'package:cloud_firestore/cloud_firestore.dart';



Future<void> adddoctoreDataToFireBase({
  required Map DoctorModel , required String uID
}){
  CollectionReference user = FirebaseFirestore.instance.collection("doctor");
  return  user.doc(uID).set(DoctorModel).then((value) {print("done");}) ;
}

