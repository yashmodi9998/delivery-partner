import 'package:deliveryapplication/utils/Styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextDivider extends StatelessWidget {
  const TextDivider({Key? key, required this.txt}) : super(key: key);
  final String txt;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(height: 20, thickness: 0.5),
        Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.elliptical(20, 50))),
            child: Text(
              txt,
              style: Styles.textH2,
            )),
        const Divider(
          height: 20,
          thickness: 0.5,
        ),
      ],
    );
  }
}
