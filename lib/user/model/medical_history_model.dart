import 'package:cloud_firestore/cloud_firestore.dart';

class MedicalHistoryModel {
  late String ComplaintDescoription,
      duration,
      nAndDecrease,
      dateOfLastAttack,
      occupation,
      specialHabites,
      postHistory,
      familyHistory;
  late bool marrid;

  Map<String, dynamic> toMap() {
    return {
      'ComplaintDescoription': this.ComplaintDescoription,
      'duration': this.duration,
      'nAndDecrease': this.nAndDecrease,
      'dateOfLastAttack': this.dateOfLastAttack,
      'occupation': this.occupation,
      'specialHabites': this.specialHabites,
      'postHistory': this.postHistory,
      'familyHistory': this.familyHistory,
      'marrid': this.marrid,
    };
  }

  factory MedicalHistoryModel.fromMap({required DocumentSnapshot  doc}) {
    dynamic map = doc.data();
    return MedicalHistoryModel(
      ComplaintDescoription: map['ComplaintDescoription'] as String,
      duration: map['duration'] as String,
      nAndDecrease: map['nAndDecrease'] as String,
      dateOfLastAttack: map['dateOfLastAttack'] as String,
      occupation: map['occupation'] as String,
      specialHabites: map['specialHabites'] as String,
      postHistory: map['postHistory'] as String,
      familyHistory: map['familyHistory'] as String,
      marrid: map['marrid'] as bool,
    );
  }

  MedicalHistoryModel(
      {required this.ComplaintDescoription,
      required this.duration,
      required this.nAndDecrease,
      required this.dateOfLastAttack,
      required this.occupation,
      required this.specialHabites,
      required this.postHistory,
      required this.familyHistory,
      required this.marrid});
}
