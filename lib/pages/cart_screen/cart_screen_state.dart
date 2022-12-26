class Cart_screenState {
  final List<Map> myJson = [
    {"id": '1', "image": "assets/images/image8.png", "name": "DANA"},
    {"id": '3', "image": "assets/images/image8.png", "name": "Gopay"},
    {"id": '2', "image": "assets/images/image8.png", "name": "ShopeePay"},
    {"id": '4', "image": "assets/images/image8.png", "name": "LinkAja"},
    {"id": '5', "image": "assets/images/image8.png", "name": "Tunai"},
  ];
  final int totalBayar;
  Cart_screenState({this.totalBayar = 0});
  Cart_screenState copyWith({int? totalBayar}) {
    return Cart_screenState(
      totalBayar: totalBayar ?? this.totalBayar,
    );
  }
  // Cart_screenState init() {
  //   return Cart_screenState();
  // }

  // Cart_screenState clone() {
  //   return Cart_screenState();
  // }
}
