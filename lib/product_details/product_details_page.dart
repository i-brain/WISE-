import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/src/provider.dart';
import 'package:waffle/change_index/change_index_cubit.dart';
import 'package:waffle/const/app_colors.dart';
import 'package:waffle/const/consts.dart';
import 'package:waffle/model/product_details_model.dart';
import 'package:waffle/model/saved_product_model.dart';
import 'package:waffle/model/unsaved_product_model.dart';
import 'package:waffle/product_details/details_text_field.dart';
import 'package:waffle/product_details/estimated_card.dart';
import 'package:waffle/save_product_cubit/save_product_cubit.dart';
import 'package:waffle/unsaved_cubit/unsaved_product_cubit.dart';
import 'package:waffle/widgets/custom_slider.dart';

class ProductDetailsPage extends StatefulWidget {
  ProductDetailsPage({
    Key? key,
    required this.productDetails,
  }) : super(key: key);

  final ProductDetailsModel productDetails;

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  TextEditingController areaController = TextEditingController(text: '');

  @override
  void initState() {
    super.initState();
    areaController = TextEditingController(text: '');

    context
        .read<UnsavedProductCubit>()
        .updateProduct(estimatedPrice: 0, estimatedWater: 0);
  }

  double estimatedWater = 0;
  double estimatedPrice = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.greenColor,
      body: SafeArea(
        child: SingleChildScrollView(
          // physics: NeverScrollableScrollPhysics(),
          child: SizedBox(
            height: size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomSlider(
                  productDetails: widget.productDetails,
                ),
                Expanded(
                  child: Container(
                    color: Colors.grey[100],
                    padding: const EdgeInsets.all(12),
                    child: SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      child: BlocConsumer<ChangeIndexCubit, int>(
                        listener: (context, index) {
                          setState(() {
                            estimatedWater = calculateEstimatedWater(
                              index: index,
                              age: widget.productDetails.age * index ~/ 6,
                              waterList: widget.productDetails.waterList,
                              area: int.parse(areaController.text.isEmpty
                                  ? '0'
                                  : areaController.text),
                              realAge: widget.productDetails.age,
                            );
                            estimatedPrice = getEstimatedPrice(estimatedWater);
                            context.read<UnsavedProductCubit>().updateProduct(
                                  estimatedPrice: estimatedPrice,
                                  estimatedWater: estimatedWater,
                                );
                          });
                        },
                        builder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              DetailsTextField(
                                controller: areaController,
                                onChanged: (_) {
                                  print('onchanged');
                                  setState(() {
                                    estimatedWater = calculateEstimatedWater(
                                      index: index,
                                      age: widget.productDetails.age *
                                          index ~/
                                          6,
                                      waterList:
                                          widget.productDetails.waterList,
                                      area: int.parse(
                                          areaController.text.isEmpty
                                              ? '0'
                                              : areaController.text),
                                      realAge: widget.productDetails.age,
                                    );
                                    estimatedPrice =
                                        getEstimatedPrice(estimatedWater);
                                    context
                                        .read<UnsavedProductCubit>()
                                        .updateProduct(
                                          estimatedPrice: estimatedPrice,
                                          estimatedWater: estimatedWater,
                                        );
                                  });
                                },
                              ),
                              BlocBuilder<UnsavedProductCubit,
                                  UnsavedProductModel>(
                                builder: (context, unsavedProduct) {
                                  print(unsavedProduct.estimatedPrice);
                                  return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      EstimatedCard(
                                        title: 'Estimated price',
                                        subTitle: unsavedProduct.estimatedPrice
                                            .toStringAsFixed(1),
                                        color: Colors.green[600]!,
                                        unitType: UnitType.price,
                                      ),
                                      EstimatedCard(
                                        title: 'Water',
                                        subTitle: unsavedProduct.estimatedWater
                                            .toStringAsFixed(1),
                                        color: Colors.blue[600]!,
                                        unitType: UnitType.water,
                                      ),
                                    ],
                                  );
                                },
                              ),
                              Center(
                                child: SizedBox(
                                  width: 200,
                                  child: ElevatedButton(
                                    onPressed: areaController.text.isEmpty
                                        ? null
                                        : () {
                                            print('onsave');
                                            onSave(index);
                                          },
                                    child: const Padding(
                                      padding: EdgeInsets.all(16.0),
                                      child: Text(
                                        'Save',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  double calculateExpencedWater(
      {required int index, required int age, required List<int> waterList}) {
    switch (index) {
      case 0:
        return age * waterList[0].toDouble();
      case 1:
        return age * (waterList[0] * 0.75 + 0.25 * waterList[1]);
      case 2:
        return age * (waterList[0] + waterList[1]) * 0.5;

      case 3:
        return age *
            (3 / 8 * waterList[0] +
                3 / 8 * waterList[1] +
                1 / 4 * waterList[2]);
      case 4:
        return age *
            (0.3 * waterList[0] +
                0.3 * waterList[1] +
                0.3 * waterList[2] +
                0.1 * waterList[3]);

      case 5:
        return age *
            (0.25 * waterList[0] +
                0.25 * waterList[1] +
                0.25 * waterList[2] +
                0.25 * waterList[3]);

      default:
        return 0;
    }
  }

  double calculateEstimatedWater(
      {required int index,
      required int age,
      required List<int> waterList,
      required int area,
      required int realAge}) {
    return (area *
        (calculateExpencedWater(index: 5, age: realAge, waterList: waterList) -
            calculateExpencedWater(
                index: index,
                age: (age + realAge / 6).toInt(),
                waterList: waterList)));
  }

  double getEstimatedPrice(double estimatedWater) {
    return 0.0005 * estimatedWater;
  }

  double getExpancedPrice(
      {required int index,
      required int age,
      required List<int> waterList,
      required double area,
      required double realAge}) {
    var estimatedPrice = calculateEstimatedWater(
      index: index,
      age: age,
      waterList: waterList,
      area: area.toInt(),
      realAge: realAge.toInt(),
    );
    return estimatedPrice * 0.3 * 0.0005;
  }

  // double getMoisture() {
  //   return Random(60).nextDouble();
  // }

  void onSave(int index) {
    var getExpencedPrice = getExpancedPrice(
      index: index,
      age: (widget.productDetails.age * (index)) ~/ 6,
      waterList: widget.productDetails.waterList,
      area: double.parse(areaController.text),
      realAge: widget.productDetails.age.toDouble(),
    ).toInt();

    context.read<SaveProductCubit>().addProduct(
          SavedProductModel(
            moisture: (30.0 + Random().nextInt(15) + Random().nextDouble())
                .toStringAsFixed(0),
            age: ((widget.productDetails.age * (index + 1)) ~/ 6).toString() +
                '/${widget.productDetails.age}',
            expence: getExpencedPrice,
            estimatedPrice:
                getEstimatedPrice(estimatedWater).toInt() - getExpencedPrice,
            image: widget.productDetails.categoryImage,
          ),
        );

    Navigator.popUntil(context, (route) => route.isFirst);
  }
}
