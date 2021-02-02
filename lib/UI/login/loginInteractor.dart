
import 'package:pando_app/UI/base/BasePresentor.dart';
import 'package:pando_app/UI/base/BaseView.dart';

abstract class LoginPresenter extends BasePresentor<LoginView> {
  void login(String email, String password);
}

abstract class LoginView extends BaseView {
  void updateData(String x_token);
}
