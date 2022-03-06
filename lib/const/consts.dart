import 'package:waffle/model/product_details_model.dart';

class Consts {
  static const scareGrow = 'assets/scare_grow.png';

  static const cabbage = 'assets/cabbage';
  static const onion = 'assets/onion';
  static const potato = 'assets/potato';
  static const tomato = 'assets/tomato';
  static const watermelon = 'assets/watermelon';
  static const wheat = 'assets/wheat';

  static const cabbageCategory = 'assets/category/cabbage.png';
  static const onionCategory = 'assets/category/onion.png';
  static const potatoCategory = 'assets/category/potato.png';
  static const tomatoCategory = 'assets/category/tomato.png';
  static const watermelonCategory = 'assets/category/watermelon.png';
  static const wheatCategory = 'assets/category/wheat.png';

  static const age1 = 'assets/paxlali1.png';
  static const age2 = 'assets/paxlali2.png';
  static const age3 = 'assets/paxlali3.png';
  static const age4 = 'assets/paxlali4.png';
  static const age5 = 'assets/paxlali5.png';
  static const age6 = 'assets/paxlali6.png';
  static const ageAll = 'assets/paxlali0.png';

  static const c1 = '$cabbage/c1.png';
  static const c2 = '$cabbage/c2.png';
  static const c3 = '$cabbage/c3.png';
  static const c4 = '$cabbage/c4.png';
  static const c5 = '$cabbage/c5.png';
  static const c6 = '$cabbage/c6.png';

  static const o1 = '$onion/o1.png';
  static const o2 = '$onion/o2.png';
  static const o3 = '$onion/o3.png';
  static const o4 = '$onion/o4.png';
  static const o5 = '$onion/o5.png';
  static const o6 = '$onion/o6.png';

  static const p1 = '$potato/p1.png';
  static const p2 = '$potato/p2.png';
  static const p3 = '$potato/p3.png';
  static const p4 = '$potato/p4.png';
  static const p5 = '$potato/p5.png';
  static const p6 = '$potato/p6.png';

  static const t1 = '$tomato/t1.png';
  static const t2 = '$tomato/t2.png';
  static const t3 = '$tomato/t3.png';
  static const t4 = '$tomato/t4.png';
  static const t5 = '$tomato/t5.png';
  static const t6 = '$tomato/t6.png';

  static const w1 = '$watermelon/w1.png';
  static const w2 = '$watermelon/w2.png';
  static const w3 = '$watermelon/w3.png';
  static const w4 = '$watermelon/w4.png';
  static const w5 = '$watermelon/w5.png';
  static const w6 = '$watermelon/w6.png';

  static const wh1 = '$wheat/wt1.png';
  static const wh2 = '$wheat/wt2.png';
  static const wh3 = '$wheat/wt3.png';
  static const wh4 = '$wheat/wt4.png';
  static const wh5 = '$wheat/wt5.png';
  static const wh6 = '$wheat/wt6.png';

  static const sliderImages = [ageAll, age1, age2, age3, age4, age5, age6];

  static const cabbageImages = [c1, c2, c3, c4, c5, c6];
  static const onionImages = [o1, o2, o3, o4, o5, o6];
  static const potatoImages = [p1, p2, p3, p4, p5, p6];
  static const tomatoImages = [t1, t2, t3, t4, t5, t6];
  static const watermelonImages = [w1, w2, w3, w4, w5, w6];
  static const wheatImages = [wh1, wh2, wh3, wh4, wh5, wh6];

  static const categories = [
    cabbageCategory,
    onionCategory,
    tomatoCategory,
    potatoCategory,
    watermelonCategory,
    wheatCategory
  ];

  static final List<ProductDetailsModel> productDetailsList = [
    ProductDetailsModel(
        images: cabbageImages,
        productName: 'Cabbage',
        age: 90,
        waterList: [4, 7, 9, 5],
        type: 'Cruciferous',
        categoryImage: Consts.cabbageCategory),
    ProductDetailsModel(
        images: potatoImages,
        productName: 'Potato',
        age: 120,
        waterList: [3, 5, 8, 5],
        type: 'Root',
        categoryImage: potatoCategory),
    ProductDetailsModel(
      images: watermelonImages,
      productName: 'Watermelon',
      age: 90,
      waterList: [4, 7, 10, 6],
      type: 'Cucurbits',
      categoryImage: watermelonCategory,
    ),
    ProductDetailsModel(
      images: onionImages,
      productName: 'Onion',
      age: 150,
      waterList: [4, 7, 9, 5],
      type: 'Allium',
      categoryImage: onionCategory,
    ),
    ProductDetailsModel(
      images: wheatImages,
      productName: 'Wheat',
      age: 120,
      waterList: [2, 4, 6, 3],
      type: 'Grain',
      categoryImage: wheatCategory,
    ),
    ProductDetailsModel(
      images: tomatoImages,
      productName: 'Tomato',
      age: 60,
      waterList: [3, 5, 7, 4],
      type: 'Nightshade',
      categoryImage: tomatoCategory,
    ),
  ];
}
