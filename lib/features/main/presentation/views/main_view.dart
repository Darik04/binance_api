import 'package:binance_api/constants/main_config_app.dart';
import 'package:flutter/material.dart';
import 'package:binance_api/constants/texts/text_styles.dart';
import 'package:binance_api/features/main/presentation/views/home_view.dart';



class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(MainConfigApp.appName, style: TextStyles(context).title_app_bar,),
      ),
      body: HomeView(),
    );
  }
}