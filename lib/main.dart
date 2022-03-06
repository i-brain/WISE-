import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waffle/presentation/add_page/add_page.dart';
import 'package:waffle/presentation/home/home_page.dart';

import 'bloc/change_index/change_index_cubit.dart';
import 'bloc/save_product_cubit/save_product_cubit.dart';
import 'bloc/unsaved_cubit/unsaved_product_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SaveProductCubit(),
        ),
        BlocProvider(
          create: (context) => ChangeIndexCubit(),
        ),
        BlocProvider(
          create: (context) => UnsavedProductCubit(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: const Color(0xfff3f7fa),
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: Colors.white,
            primary: Colors.green,
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
        routes: {
          '/addPage': (context) => const AddPage(),
        },
      ),
    );
  }
}
