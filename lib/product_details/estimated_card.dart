import 'package:flutter/material.dart';

enum UnitType {
  price,
  water,
}

class EstimatedCard extends StatelessWidget {
  const EstimatedCard(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.color,
      required this.unitType})
      : super(key: key);

  final String title;
  final String subTitle;
  final Color color;
  final UnitType unitType;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(color: color, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            width: 100,
            height: 10,
            child: Divider(
              thickness: 1,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          RichText(
            text: TextSpan(
              style: TextStyle(fontWeight: FontWeight.bold, color: color),
              children: [
                TextSpan(
                  text: subTitle,
                  style: const TextStyle(
                    fontSize: 25,
                  ),
                ),
                TextSpan(text: unitType == UnitType.water ? ' m' : ' \$'),
                if (unitType == UnitType.water)
                  WidgetSpan(
                    child: Transform.translate(
                      offset: const Offset(2, -4),
                      child: Text(
                        '3',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: color),
                        textScaleFactor: 0.7,
                      ),
                    ),
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
