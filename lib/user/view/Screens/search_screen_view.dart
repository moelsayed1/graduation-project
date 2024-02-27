import 'package:flutter/material.dart';
import '../../view_model/search_view_model.dart';

class SearchScreenView extends StatelessWidget {
  const SearchScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
      child: Column(
        children: const [
          Text(
            "Find Your Doctor",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
          ),
          DoctoresearchListVM(),
        ],
      ),
    );
  }
}
