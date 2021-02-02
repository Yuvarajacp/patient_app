abstract class BasePresentor<T> {
  T view;

  void attachView(T view) {
    this.view = view;
  }

  void detachView() {
    this.view = null;
  }
}
