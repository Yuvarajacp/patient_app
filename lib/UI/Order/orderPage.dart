import 'dart:async';
import 'package:intl/intl.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pando_app/UI/base/BasePage.dart';
import 'package:pando_app/model/order/pandoOrder.dart';

import 'orderInteractor.dart';
import 'orderPresenterImpl.dart';


class OrderPage extends StatefulWidget {
  OrderPage();

  @override
  OrderPageState createState() => OrderPageState();
}

class OrderPageState extends BasePage<OrderPage> implements OrderView {
  OrderPageState();

  OrderPresenterImpl presenter;
  List<OrderModel> listOfOrderList = new List();

  @override
  Future<void> initState() {

    super.initState();
    presenter = OrderPresenterImpl();
    presenter.attachView(this);

    callApi();
  }

  callApi() async {
    await Future.delayed(Duration(milliseconds: 500));
    String depositId = "5c6b98938affa72b93404528";
    int page = 3;
    int category = 0;
    presenter.getOrder(category, page, depositId);
  }
  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.035),
              alignment: Alignment.center,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  //Header
                  getOrderHeaderWidget(),

                  //List Of Order
                  Container(
                    height: MediaQuery.of(context).size.height*0.86,
                    child: SingleChildScrollView(
                      child: Column(
                        children: getListOfOrderWidget(),
                      ),
                    ),
                  ),
                ],
              ))),
    );
  }

  Widget getOrderHeaderWidget(){
    return Container(
      height: MediaQuery.of(context).size.height*0.10,

      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width*0.15,
            height: MediaQuery.of(context).size.height*0.10,
            color: Color(0xbb002338),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width*0.1,
                  height: MediaQuery.of(context).size.width*0.1,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffa8f8ff)
                  ),
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    'AD',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width*0.70,
            height: MediaQuery.of(context).size.height*0.10,
            color: Color(0xbb002338),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 3),
                  child: Text('30 Jul \'19 - 4 Aug \'19 ', style: TextStyle(letterSpacing:1, color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),),
                ),
                Text('DISPATCHED', style: TextStyle(letterSpacing:2, color: Colors.white, fontSize: 11),)
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width*0.15,
            height: MediaQuery.of(context).size.height*0.10,
            color: Color(0xbb002338),
            child: Icon(Icons.filter_list_alt, color: Colors.white,size: 25,),
          ),
        ],
      ),
    );
  }

  List<Widget> getListOfOrderWidget(){
    List<Widget> listOdWidget = new List();
    if( listOfOrderList != null && listOfOrderList.length != 0 ){
      listOfOrderList.forEach((order) {

        var statusText = getOrderStatusMapping(order.status);

        var statusColorPrimary = getOrderStatusColor(order.status);

        Color statusColor = Color(int.parse('0xFF$statusColorPrimary'));
        Color statusLightColor = Color(int.parse('0x1A$statusColorPrimary'));

        String destinationPlace = "";
        int noOfConsignees = 0;
        if( order.consigneeS != null && order.consigneeS.length != 0){
          destinationPlace = order.consigneeS[0].city;
          noOfConsignees = order.consigneeS.length;
        }else{
          destinationPlace = 'Chennai';
        }

        int dateString = order.createdAt.day;
        String monthString = DateFormat("MMM").format(order.createdAt);

        final birthday = DateTime(order.createdAt.year, order.createdAt.month, order.createdAt.day);
        final date2 = DateTime.now();
        final difference = date2.difference(birthday).inDays;
        String oldDay = "";
        if( (difference / 365 ) >  1 ){
          oldDay = '${(difference / 365 ).round()}Y';
        }else if( (difference / 31 ) >  1  ){
          oldDay = '${(difference / 31 ).round()}M';
        }else{
          oldDay = '${difference}D';
        }


        listOdWidget.add( Column(
          children: [
            Container(
              //margin: EdgeInsets.only(bottom:10 ),
              color: Colors.white,
              height: MediaQuery.of(context).size.height*0.11,
            child: Row(
              children: [
                Container(
                  width: getScreenWidth(20),
                  height: getScreenHeight(10),
                  color: Colors.white,
                  padding: EdgeInsets.only(top: getScreenHeight(1), bottom: getScreenHeight(1)),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('$monthString', style: TextStyle(letterSpacing:1, color: Color(0xaa05ffb4), fontSize: 13),),
                      Text('$dateString', style: TextStyle(letterSpacing:1, color: Color(0xff05ffb4), fontSize: 18),),
                      Text('${oldDay} Old', style: TextStyle(letterSpacing:1, color: Colors.grey[400], fontSize: 9),)
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*0.40,
                  height: MediaQuery.of(context).size.height*0.10,

                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          width: getScreenWidth(60),
                          child: Text(order.vehicle.number != null ? order.vehicle.number :'VEHICLE NOT ASSIGNED', style: TextStyle(letterSpacing:1, color: order.vehicle.number != null ?Color(0xbb002338) : Color(0x44002338), fontSize: order.vehicle.number != null ? 13:11, fontWeight: FontWeight.bold),)),
                      Container(
                        width: getScreenWidth(60),
                          child: Row(
                            children: [
                              Text('Madurai - ${destinationPlace }', style: TextStyle(letterSpacing:1, color: Color(0xbb002338), fontSize: 12.5),),
                              noOfConsignees != 0 ? Container(
                                width: getScreenHeight(1.5),
                                height:getScreenHeight(1.5),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Color(0xbb002338), width: 1),
                                    shape:BoxShape.circle,
                                    color: Colors.white
                                ),
                                alignment: AlignmentDirectional.center,
                                child:Text('$noOfConsignees'),
                              ):Container(),
                            ],
                          )),
                      Container(
                          width: getScreenWidth(60),
                          child: Text('${order.transporter.name}', style: TextStyle(letterSpacing:1, color: Color(0x55002338), fontSize: 10),))
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*0.40,
                  height: MediaQuery.of(context).size.height*0.10,
                  padding: EdgeInsets.only(top: getScreenHeight(1), bottom: getScreenHeight(1), right: getScreenWidth(3)),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          width: getScreenWidth(30),
                          alignment: AlignmentDirectional.centerEnd,
                          child: Text('${order.orderNumber}', style: TextStyle(letterSpacing:0.8, color: Color(0xbb002338), fontSize: 10, fontWeight: FontWeight.bold),)),
                      Container(
                          width: getScreenWidth(30),
                          height: getScreenHeight(4),
                          //color: Colors.blue[100],
                          alignment: AlignmentDirectional.bottomEnd,
                          child: Stack( children: [
                            Align(
                              alignment: AlignmentDirectional.bottomEnd,
                              child: Container(
                                height: getScreenHeight(3),
                                width: getScreenHeight(3),
                                decoration: BoxDecoration(
                                  color: statusLightColor,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional.bottomEnd,
                              child: Container(
                                margin: EdgeInsets.only( bottom: getScreenHeight(2.3), right: getScreenWidth(0.5)),
                                height: getScreenHeight(1),
                                width: getScreenHeight(1),

                                decoration: BoxDecoration(
                                  color: statusColor,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                            Container(
                                alignment: AlignmentDirectional.bottomEnd,
                                padding: EdgeInsets.only(right: getScreenWidth(3), bottom: getScreenHeight(0.5)),
                                child: Text(statusText, style: TextStyle(letterSpacing:1, color: statusColor, fontSize: 11, fontWeight: FontWeight.w500),)),

                          ],)),

                    ],
                  ),
                ),
              ],
            ),),
            Container(
              //margin: EdgeInsets.only(bottom:10 ),
              //color: Color(0xaa002338),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[200], width: 0.8),
                color: Colors.white
              ),
              height: 3,
            width: getScreenWidth(95),
           ),
          ],
        ) );
      });
    }

    return listOdWidget;
  }

  @override
  void updateData(OrderResponse) {
    // TODO: implement updateData
    print('Pando Order List -> ${orderListToJson(OrderResponse)}');
    setState(() {
      listOfOrderList = OrderResponse.data;
    });

  }

  //Status text Mapping
  String getOrderStatusMapping(statusCode){

    if( statusCode == 0 || statusCode == 1 || statusCode == 2 || statusCode == 3 || statusCode == 20 || statusCode == 21){
      return 'INDENTED';
    }else if( statusCode == 4 || statusCode == 16 || statusCode == 22 || statusCode == 24 ){
      return 'ASSIGNED';
    }else if( statusCode == 5 || statusCode == 17 || statusCode == 18 ){
      return 'ARRIVED';
    }else if( statusCode == 6  ){
      return 'DISPATCHED';
    }else if( statusCode == 7 || statusCode == 23  ){
      return 'DELIVERED';
    }else {
      return 'CANCELLED';
    }

  }

  //Status Color Mapping
  String getOrderStatusColor(statusCode){

    if( statusCode == 0 || statusCode == 1 || statusCode == 2 || statusCode == 3 || statusCode == 20 || statusCode == 21){
      return '737373';
    }else if( statusCode == 4 || statusCode == 16 || statusCode == 22 || statusCode == 24 ){
      return 'E48F00';
    }else if( statusCode == 5 || statusCode == 17 || statusCode == 18 ){
      return '3F6ABF';
    }else if( statusCode == 6  ){
      return '50A6E3';
    }else if( statusCode == 7 || statusCode == 23  ){
      return '57994E';
    }else {
      return 'ff0000';
    }

  }
  @override
  BuildContext getContext() {
    return context;
  }

  getScreenWidth(per){
    return MediaQuery.of(context).size.width*(per/100);
  }

  getScreenHeight(per){
    return MediaQuery.of(context).size.height*(per/100);
  }

}
