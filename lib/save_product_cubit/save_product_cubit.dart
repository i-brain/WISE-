import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:waffle/model/saved_product_model.dart';

class SaveProductCubit extends Cubit<List<SavedProductModel>> {
  SaveProductCubit() : super([]);

  List<SavedProductModel> savedProductList = [];

  void addProduct(SavedProductModel savedProduct) {
    savedProductList.add(savedProduct);
    emit([]);
    emit(savedProductList);
  }

  void deleteProduct(String id) {
    int index = savedProductList.indexWhere((product) => product.image == id);
    log(index.toString());
    savedProductList.removeAt(index);
    emit([]);
    print(savedProductList.length);
    emit(savedProductList);
  }
}
