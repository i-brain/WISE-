import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waffle/bloc/save_product_cubit/save_product_cubit.dart';
import 'package:waffle/const/consts.dart';
import 'package:waffle/model/saved_product_model.dart';
import 'package:waffle/presentation/add_page/add_page.dart';

import 'list_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Wise'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: BlocBuilder<SaveProductCubit, List<SavedProductModel>>(
          builder: (context, savedProductList) {
            return savedProductList.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 250,
                          child: Image.asset(
                            Consts.scareGrow,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Your garden is empty',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.green),
                        )
                      ],
                    ),
                  )
                : ListView.builder(
                    itemBuilder: ((context, index) => ListItem(
                          savedProduct: savedProductList[index],
                        )),
                    itemCount: savedProductList.length,
                  );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Center(
            child: Icon(
              Icons.add,
              color: Colors.green,
              size: 36,
            ),
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddPage(),
                ));
          }),
    );
  }
}
