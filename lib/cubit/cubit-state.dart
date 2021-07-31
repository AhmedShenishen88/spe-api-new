abstract class CubitState {}

class InitialStates extends CubitState {}

class ChangeBottomNavigatorBarScreen extends CubitState {}

class GetBusinessData extends CubitState {}

class LoadingBusinessData extends CubitState {}

class ErrorBusinessData extends CubitState {
  final error;
  ErrorBusinessData(this.error);
}

class GetSportsData extends CubitState {}

class LoadingSportsData extends CubitState {}

class ErrorSportsData extends CubitState {
  final error;
  ErrorSportsData(this.error);
}

class GetScienceData extends CubitState {}

class LoadingScienceData extends CubitState {}

class ErrorScienceData extends CubitState {
  final error;
  ErrorScienceData(this.error);
}

class GetSearchData extends CubitState {}

class LoadingSearchData extends CubitState {}

class ErrorSearchData extends CubitState {
  final error;
  ErrorSearchData(this.error);
}
