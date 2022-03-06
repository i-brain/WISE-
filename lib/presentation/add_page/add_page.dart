import 'package:flutter/material.dart';
import 'package:waffle/const/consts.dart';
import 'package:waffle/presentation/product_details/product_details_page.dart';

import 'add_page_card.dart';

class AddPage extends StatelessWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
      ),
      body: GridView.builder(
        itemCount: Consts.productDetailsList.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (ctx, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailsPage(
                      productDetails: Consts.productDetailsList[index],
                    ),
                  ));
            },
            child: AddPageCard(
              image: Consts.productDetailsList[index].categoryImage,
              typeName: Consts.productDetailsList[index].productName,
            ),
          );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.822),
      ),
    );
  }
}
