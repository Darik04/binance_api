import 'package:binance_api/features/main/presentation/bloc/packages/main_bloc.dart';
import 'package:binance_api/features/main/presentation/views/main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:binance_api/constants/colors/color_styles.dart';
import 'package:binance_api/constants/main_config_app.dart';
import 'locator.dart';

void main() {
  setupInjections();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(428, 926),
      builder: (_, __) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => sl<MainBloc>()),
        ], 
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: MainConfigApp.appName,
          theme: ThemeData(
            primaryColor: ColorStyles.primary,
            primarySwatch: ColorStyles.primarySwath,
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: ColorStyles.white
            ),
            bottomAppBarColor: Colors.black,
            appBarTheme: const AppBarTheme(
              backgroundColor: ColorStyles.white,
              centerTitle: true,
              elevation: 2.0,
              toolbarHeight: 56,
              iconTheme: IconThemeData(
                color: ColorStyles.black,
              ),
            )
          ),
          home: MainView(),
        ),
      ),
    );
  }
}
