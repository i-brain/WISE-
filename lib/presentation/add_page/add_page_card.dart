import 'package:flutter/material.dart';

class AddPageCard extends StatelessWidget {
  final String image;
  final String typeName;
  const AddPageCard({
    Key? key,
    required this.image,
    required this.typeName,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0.3,
              blurRadius: 5,
              offset: const Offset(2, 3), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Image.asset(image),
            Expanded(child: Container()),
            const SizedBox(
              height: 5,
            ),
            Text(typeName),
          ]),
        ),
      ),
    );
  }
}
