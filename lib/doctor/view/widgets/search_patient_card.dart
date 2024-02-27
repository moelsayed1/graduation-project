import 'package:flutter/material.dart';
import '../../../user/model/call_doctore_model.dart';
import '../../../user/view/widget/book_form.dart';
import '../../model/call_doctore_model.dart';
// import 'book_form.dart';

class DoctoreSearchCardWidget extends StatelessWidget {
  late CallDoctorModel doctorDataModel ;
  DoctoreSearchCardWidget({Key? key, required this.doctorDataModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: IntrinsicHeight(
        child: Container(
          margin: const EdgeInsets.only(left: 24, right: 24, top: 16),
          child: Material(
            elevation: 10.0,
            borderRadius: BorderRadius.circular(10.0),
            type: MaterialType.card,
            color: Colors.white,
            shadowColor: const Color(0xFFE9EAFF),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 40,
                            child: Image.network(doctorDataModel.imageUrl),
                          ),
                          Expanded(
                            child: ListTile(
                              title: Text(doctorDataModel.name),
                              subtitle: Text(doctorDataModel.category),
                            ),
                          ),
                          TextButton(onPressed: () {
                            showDialog<String>(
                                context: context,
                                builder: (BuildContext context) =>BookForm(doctorId: doctorDataModel.id, )
                                  );
                          }, child: const Text("Book now"),)
                        ],
                      ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


