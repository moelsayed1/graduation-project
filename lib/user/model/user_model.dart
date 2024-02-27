import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  late String name, address, phone, imageUrl, email;
  late double age, weight, height;
  late bool isDoctor;
  late List doctorList ;
  late List medicalHistory;
  late var medicalForm;
  UserModel(
      {required this.name,
      required this.address,
      required this.phone,
      required this.age,
      required this.weight,
      required this.height,
      required this.imageUrl,
      required this.email,
      required this.isDoctor,
      required this.doctorList,
        required this.medicalHistory,
        required this.medicalForm,

      });

  Map<String, dynamic> UserModeltoMap() {
    return {
      'name': name,
      'address': address,
      'phone': phone,
      'age': age,
      'weight': weight,
      'height': height,
      'imageUrl': imageUrl,
      'email': email,
      'isDoctor':false ,
      'doctorList':[],
      'History_Form':{
        "complaintController":
        " no data",
        "durationController":
        " no data",
        "attackController": " no data",
        "increaseController":
        " no data",
        "specialhabitsController":
        " no data",
        "occupationController":
        " no data",
        "familyHistoryController":
        " no data",
        "pastHistoryController":
        " no data",
        "married": false
      },
      'medicalHistory':[]
    };
  }

  factory UserModel.fromMap(DocumentSnapshot data) {
  dynamic  map = data.data() as Map  ;
    return UserModel(
      name: map['name'] as String,
      address: map['address'] as String,
      phone: map['phone'] as String,
      age: map['age'] as double,
      weight: map['weight'] as double,
      height: map['height'] as double,
      imageUrl: map['imageUrl'] as String,
      email: map['email'] as String,
      isDoctor: false ,
      doctorList:  map['doctorList'] as List,
      medicalHistory:  map['medicalHistory'] as List,
      medicalForm: map['History_Form'] as Map   ,
    );
  }
}

class MedicalHistoryModel {
 late String doctorName , note ,date ;

 MedicalHistoryModel({required this.doctorName, required this.note, required this.date});

 Map<String, dynamic> toMap() {
    return {
      'doctorName': this.doctorName,
      'note': this.note,
      'date': this.date,
    };
  }

  factory MedicalHistoryModel.fromMap( DocumentSnapshot data) {
    Map  map = data.data() as Map  ;
    return MedicalHistoryModel(
      doctorName: map['doctorName'] as String,
      note: map['note'] as String,
      date: map['date'] as String,
    );
  }
}