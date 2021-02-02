import 'dart:convert';
import 'package:pando_app/Utils/GlobalDetails.dart';
import 'package:pando_app/model/login/LoginRequest.dart';
import 'package:pando_app/model/order/pandoOrder.dart';
import 'package:pando_app/network/Api.dart';
import 'orderInteractor.dart';

class OrderPresenterImpl implements OrderPresenter {
  @override
  OrderView view;

  @override
  void attachView(OrderView view) {
    this.view = view;
  }

  @override
  void detachView() {
    this.view = null;
  }

  Future<void> getOrder(category, page, depositId) async {
    view.showFullScreenLoader(true);


    Api.create().getOrderList( category: category, page: page, depot_id: depositId ).then((response) {
      view.showFullScreenLoader(false);

      if (response.error != null) {
       //handle Error

      } else if (response.body != null) {

        view.updateData(orderListFromJson(response.body));
      }
    }, onError: (e) {
      view.handleException(e);
    });
  }

}
