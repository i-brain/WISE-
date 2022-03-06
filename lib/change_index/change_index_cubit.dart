import 'package:bloc/bloc.dart';

import 'package:waffle/model/unsaved_product_model.dart';

class ChangeIndexCubit extends Cubit<int> {
  ChangeIndexCubit() : super(0);

  // late UnsavedProductModel unsavedProduct;

  void updateProduct(
    int currentIndex,
  ) {
    emit(currentIndex);
  }

  void clearIndex() => emit(0);
}
