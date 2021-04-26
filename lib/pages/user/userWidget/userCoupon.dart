//我的==》优惠卷
import 'package:flutter/material.dart';
import 'package:flutter_router/pages/user/userWidget/ATitle.dart';
import 'package:flutter_router/widgets/card.dart';

var _Coupon=(String title,num price,String timeEnd ,String desc) =>
    CardBox(
      height: 170,
        child: Padding(
          padding: EdgeInsets.all(1),
          child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 0,
                      ),
                      Text(desc,),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: Text(timeEnd,)),
                      SizedBox(
                        child: Text("￥" + price.toString(), style: TextStyle(color: Colors.red)),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ));


class CouponPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
          height: 500,
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                  child: ListView(
                    children: <Widget>[

                      ATitle("购物券"),
                      _Coupon("五一购物券", 99, "2019-11-1", "满 500 可用"),
                      _Coupon("圣诞礼券", 109, "2019-11-1", "无限制")
                    ],
                  ))
            ],
          ),
        ));
  }
}
