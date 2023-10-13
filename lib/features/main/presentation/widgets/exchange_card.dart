import 'package:binance_api/constants/colors/color_styles.dart';
import 'package:binance_api/constants/texts/text_styles.dart';
import 'package:binance_api/features/main/domain/enities/exchange_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class ExchangeCard extends StatelessWidget {
  final ExchangeEntity exchangeEntity;
  const ExchangeCard({super.key, required this.exchangeEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20.w, 0, 20.w, 10.h),
      padding: EdgeInsets.all(30.h),
      decoration: BoxDecoration(
        color: ColorStyles.black,
        borderRadius: BorderRadius.circular(30)
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(exchangeEntity.symbol, style: TextStyles(context).white_18_w700,),
              Text(exchangeEntity.status, style: TextStyles(context).white_18_w700.copyWith(color: ColorStyles.grey888,)),
            ],
          ),
          SizedBox(height: 20.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(exchangeEntity.baseAsset, style: TextStyles(context).white_18_w700,),
              SizedBox(width: 10.w,),
              Text('->', style: TextStyles(context).white_18_w700,),
              SizedBox(width: 10.w,),
              Text(exchangeEntity.quoteAsset, style: TextStyles(context).white_18_w700.copyWith(color: ColorStyles.diamond,)),
            ],
          ),
          SizedBox(height: 20.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox.shrink(),
              Text(exchangeEntity.getPrices, style: TextStyles(context).white_18_w700.copyWith(color: ColorStyles.yellow,)),
            ],
          ),
        ],
      ),
    );
  }
}