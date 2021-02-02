import 'dart:convert';
import 'package:pando_app/model/login/LoginRequest.dart';
import 'package:pando_app/network/Api.dart';
import 'loginInteractor.dart';

class LoginPresenterImpl implements LoginPresenter {
  @override
  LoginView view;

  @override
  void attachView(LoginView view) {
    this.view = view;
  }

  @override
  void detachView() {
    this.view = null;
  }

  @override
  Future<void> login(username, password) async {
    view.showFullScreenLoader(true);
    var loginDetails = LoginRequest(data: DataSample(email:username, password: password));

    Api.create().getLogin(jsonEncode(loginDetails.toJson())).then((response) {
      view.showFullScreenLoader(false);

      if (response.error != null) {
        //handle Error
      } else if (response.headers != null) {

        view.updateData(response.headers['x-auth-token']);
      }
    }, onError: (e) {

      view.handleException(e);
    });
  }

}
