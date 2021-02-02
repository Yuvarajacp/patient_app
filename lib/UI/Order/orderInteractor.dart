
import 'package:pando_app/UI/base/BasePresentor.dart';
import 'package:pando_app/UI/base/BaseView.dart';
import 'package:pando_app/model/order/pandoOrder.dart';

abstract class OrderPresenter extends BasePresentor<OrderView> {
  void getOrder(int category, int page, String depositId);
}

abstract class OrderView extends BaseView {
  void updateData(OrderList loginResponse);
}
