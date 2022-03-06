import 'package:bloc/bloc.dart';
import 'package:waffle/model/unsaved_product_model.dart';

class UnsavedProductCubit extends Cubit<UnsavedProductModel> {
  UnsavedProductCubit()
      : super(UnsavedProductModel(estimatedPrice: 0, estimatedWater: 0));

  late UnsavedProductModel unsavedProduct;

  void updateProduct({
    required double estimatedPrice,
    required double estimatedWater,
  }) {
    unsavedProduct = UnsavedProductModel(
        estimatedPrice: estimatedPrice, estimatedWater: estimatedWater);
    emit(unsavedProduct);
  }

  void clear() {
    unsavedProduct = UnsavedProductModel(estimatedPrice: 0, estimatedWater: 0);
  }
}
