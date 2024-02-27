import 'package:cloud_firestore/cloud_firestore.dart';

class DoctorModel {
  late String name, address, phone, imageUrl, email, category;
  late bool isDoctor ;
  late List requestList ;

  DoctorModel(
      {required this.name,
      required this.address,
      required this.phone,
      required this.category,
      required this.imageUrl,
      required this.email,
      required this.isDoctor,
        required this.requestList

      });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'address': address,
      'phone': phone,
      'imageUrl': imageUrl,
      'email': email,
      'category':category,
      'isDoctor':true,
      'requestList':[],
    };
  }

  factory DoctorModel.fromMap(DocumentSnapshot  map) {
    return DoctorModel(
      name: map['name'] as String,
      address: map['address'] as String,
      phone: map['phone'] as String,
      imageUrl: map['imageUrl'] as String,
      email: map['email'] as String,
      category: map['category'] as String,
      isDoctor:  map['isDoctor'] as bool,
        requestList: map['requestList'] as List
    );
  }
}
