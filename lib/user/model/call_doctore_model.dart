import 'package:cloud_firestore/cloud_firestore.dart';

class CallDoctorModel {
  late String name, address, phone, imageUrl, email, category,id;
  late bool isDoctor ;
 // late List doctorsIds ;

  CallDoctorModel(
      {required this.name,
        required this.address,
        required this.phone,
        required this.category,
        required this.imageUrl,
        required this.email,
        required this.isDoctor,required this.id,
       // required this.doctorsIds
      });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'address': address,
      'phone': phone,
      'imageUrl': imageUrl,
      'email': email,
      'category':category,
      'isDoctor':true ,
     // 'doctorsIds':doctorsIds
    };
  }

  factory CallDoctorModel.fromMap({required DocumentSnapshot  doc}) {

   dynamic   map = doc.data();
    return CallDoctorModel(
      //doctorsIds: map['doctorsIds'] as List ,
      id:  doc.id ,
      name: map['name'] as String,
      address: map['address'] as String,
      phone: map['phone'] as String,
      imageUrl: map['imageUrl'] as String,
      email: map['email'] as String,
      category: map['category'] as String,
      isDoctor:  map['isDoctor'] as bool,
    );
  }
}
