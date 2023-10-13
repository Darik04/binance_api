import 'package:binance_api/constants/texts/text_styles.dart';
import 'package:binance_api/core/utils/helpers/toasts.dart';
import 'package:binance_api/features/main/presentation/bloc/packages/main_bloc.dart';
import 'package:binance_api/features/main/presentation/widgets/exchange_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:binance_api/constants/colors/color_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  @override
  void initState() {
    super.initState();
    final bloc = context.read<MainBloc>();
    if(bloc.exchanges.isEmpty || bloc.state is MainInitialState){
      bloc.add(GetMainEvent());
    }
  }

  List<int> limits = [5, 10, 20, 50];

  int currentLimit = 20;


  @override
  Widget build(BuildContext context) {
    MainBloc bloc = context.read<MainBloc>();

    return Scaffold(
      backgroundColor: ColorStyles.white,
      body: RefreshIndicator(
        onRefresh: () async{
          bloc.add(GetMainEvent());
          return;
        },
        child: BlocConsumer<MainBloc, MainState>(
          listener: (context, state) {
            if(state is MainErrorState){
              showAlertToast(state.message);
            }
            if(state is MainInternetErrorState){
              showAlertToast('Проверьте соединение с интернетом!');
            }
          },
          builder: (context, state) {
            if(state is MainLoadingState || state is MainInitialState){
              return Center(child: CircularProgressIndicator(strokeWidth: 2,));
            }
            return SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(parent: ClampingScrollPhysics()),
              child: Column(
                children: [
                  SizedBox(height: 20.h,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Limit:', style: TextStyles(context).black_18_w700,),
                        DropdownButton<int>(
                          value: currentLimit,
                          items: limits.map((e) 
                            => DropdownMenuItem<int>(value: e,child: Text(e.toString()),)
                          ).toList(), 
                          onChanged:(value) {
                            setState(() {
                              currentLimit = value ?? 20;
                            });
                          },
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h,),
                  ...List.generate(currentLimit, (index) 
                    => ExchangeCard(exchangeEntity: bloc.exchanges[index])
                  ).toList()
                ]
              ),
            );
          }
        ),
      ),
    );
  }
}