import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomCheckbox extends StatefulWidget {
  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
      return GestureDetector(
        onTap: () {
          setState(() {
            ref.watch(isCheckedProvider.state).state = !    ref.watch(isCheckedProvider.state).state;
            isChecked = !isChecked;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color: isChecked ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(4.0),
            border: isChecked ? null : Border.all(color: Colors.blueGrey, width: 1.5),
          ),
          width: 20,
          height: 20,
          child: isChecked
              ? const Icon(
            Icons.check,
            size: 20,
            color: Colors.blue,
          )
              : null,
        ),
      );
    },

    );

  }
}
StateProvider<bool> isCheckedProvider = StateProvider<bool>((ref)=>false);
StateProvider<bool> isAcceptedProvider = StateProvider<bool>((ref)=>true);