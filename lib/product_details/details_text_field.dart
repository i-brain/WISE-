import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DetailsTextField extends StatelessWidget {
  const DetailsTextField({
    Key? key,
    required this.controller,
    this.onChanged,
  }) : super(key: key);

  final TextEditingController controller;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 225,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Area',
            style: TextStyle(
                fontSize: 25, color: Colors.brown, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            width: 10,
            height: 40,
            child: VerticalDivider(
              thickness: 1,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(4),
            margin: const EdgeInsets.all(4),
            width: 85,
            child: TextField(
              textAlign: TextAlign.center,
              onChanged: onChanged,
              keyboardType: TextInputType.number,
              controller: controller,
              style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown),
              maxLength: 3,
              decoration: const InputDecoration(
                fillColor: Colors.white,
                hintText: '0',
                hintStyle: TextStyle(color: Colors.brown),
                counterText: "",
                filled: true,
                hoverColor: Colors.green,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                      text: 'ha',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.brown,
                          fontWeight: FontWeight.bold)),
                  // WidgetSpan(
                  //   child: Transform.translate(
                  //     offset: const Offset(2, -6),
                  //     child: const Text(
                  //       '2',
                  //       style: TextStyle(
                  //         fontWeight: FontWeight.bold,
                  //       ),
                  //       textScaleFactor: 0.7,
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
