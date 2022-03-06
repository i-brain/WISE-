// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:waffle/bloc/change_index/change_index_cubit.dart';
import 'package:waffle/const/app_text_styles.dart';
import 'package:waffle/model/product_details_model.dart';

class CustomSlider extends StatefulWidget {
  const CustomSlider({Key? key, required this.productDetails})
      : super(key: key);

  final ProductDetailsModel productDetails;

  @override
  _MyState createState() {
    return _MyState();
  }
}

class _MyState extends State<CustomSlider> {
  double currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  )),
              height: size.height * 0.42,
              width: double.infinity,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                child: Image.asset(
                  widget.productDetails.images[currentIndex.toInt()],
                  key: ValueKey<double>(currentIndex),
                ),
              ),
            ),
            Positioned(
              top: 25,
              left: 15,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  height: 50,
                  width: 50,
                  padding: const EdgeInsets.only(left: 15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        const BoxShadow(
                            color: Colors.black38,
                            offset: Offset(2.0, 2.0),
                            spreadRadius: 0.5,
                            blurRadius: 7.5),
                        BoxShadow(
                            color: Colors.grey[100]!,
                            offset: Offset(-2.0, -2.0),
                            spreadRadius: 0.5,
                            blurRadius: 7.5),
                      ]),
                  child: const Center(
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 35,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 16,
            ),
            child: Text(
              widget.productDetails.productName,
              style: AppTextStyle.whiteText
                  .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Container(
            decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                )),
            height: 75,
            child: Column(
              children: [
                Slider(
                  value: currentIndex,
                  max: widget.productDetails.images.length - 1.toDouble(),
                  min: 0,
                  divisions: widget.productDetails.images.length - 1,
                  onChanged: (value) {
                    setState(() {
                      currentIndex = value;
                      context
                          .read<ChangeIndexCubit>()
                          .updateProduct(currentIndex.toInt());
                    });
                  },
                  label:
                      'Age : ${widget.productDetails.age ~/ 6 * (currentIndex + 1).toDouble().ceil()}',
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      widget.productDetails.waterList.length,
                      (index) => RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: widget.productDetails.waterList[index]
                                .toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.black),
                          ),
                          TextSpan(
                              text: ' mm',
                              style: TextStyle(color: Colors.black))
                        ]),
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ],
    );
  }
}
