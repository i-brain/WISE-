// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:waffle/bloc/save_product_cubit/save_product_cubit.dart';
import 'package:waffle/const/consts.dart';
import 'package:waffle/model/saved_product_model.dart';

class ListItem extends StatefulWidget {
  const ListItem({Key? key, required this.savedProduct}) : super(key: key);

  final SavedProductModel savedProduct;

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  bool _value = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(bottom: 12, left: 10, right: 10),
      height: _value ? 130 : 80,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          // color: Theme.of(context).colorScheme.secondary,
          color: Colors.grey[200]),
      child: ExpansionTile(
        onExpansionChanged: ((value) {
          setState(() {
            _value = value;
          });
        }),
        leading: CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage(
            widget.savedProduct.image,
          ),
        ),
        title: RichText(
          text: TextSpan(children: [
            const TextSpan(
              text: 'Moisture of soil:',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            TextSpan(
                text: ' ${widget.savedProduct.moisture}%',
                style: const TextStyle(
                    color: Colors.blue,
                    fontSize: 18,
                    fontWeight: FontWeight.w600)),
          ]),
        ),
        subtitle: Padding(
          padding: EdgeInsets.only(top: 4.0),
          child: RichText(
            text: TextSpan(children: [
              TextSpan(
                text: 'Age:',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              TextSpan(
                  text: ' ${widget.savedProduct.age}',
                  style: TextStyle(
                    color: Colors.black,
                  )),
            ]),
          ),
        ),
        expandedAlignment: Alignment.bottomLeft,
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        childrenPadding: const EdgeInsets.only(left: 73),
        children: [
          RichText(
            text: TextSpan(children: [
              TextSpan(
                text: 'Expence:',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              TextSpan(
                  text: ' ${widget.savedProduct.expence} \$',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 18,
                      fontWeight: FontWeight.w600)),
            ]),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: 'Estimated price:',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  TextSpan(
                    text: ' ${widget.savedProduct.estimatedPrice}\$',
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8, right: 8),
                child: GestureDetector(
                  onTap: () {
                    context
                        .read<SaveProductCubit>()
                        .deleteProduct(widget.savedProduct.image);
                  },
                  child: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
