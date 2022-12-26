class Home_screenState {
  final int currentCategory;
  final bool filter;
  Home_screenState({this.currentCategory = 1, this.filter = false});
  Home_screenState copyWith({int? currentCategory, bool? filter}) {
    return Home_screenState(
        currentCategory: currentCategory ?? this.currentCategory,
        filter: filter ?? this.filter);
  }
  // Home_screenState init() {
  //   return Home_screenState();
  // }

  // Home_screenState clone() {
  //   return Home_screenState();
  // }
}
