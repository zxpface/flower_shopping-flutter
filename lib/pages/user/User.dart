import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_router/pages/user/userWidget/ATitle.dart';
import 'package:flutter_router/pages/user/userWidget/userCoupon.dart';
import 'package:flutter_router/pages/user/userWidget/userShop.dart';
class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18,vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ATitle('个人中心'),
              UserAvatar(),
              SelectItems('购物车'),
              SelectItems('优惠卷',path:'/CouponPage'),
              SelectItems('修改密码',path: '/changePass',),
              Divider(),
              SelectItems('退出登录'),
            ],
          ),

      ),
    );
  }
}
