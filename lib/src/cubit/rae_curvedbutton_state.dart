part of './rae_curvedbutton_cubit.dart';

@immutable
abstract class RAECurvedButtonState {}


class RAECurvedButtonInitial extends RAECurvedButtonState {
  RAECurvedButtonInitial();
}

class RAECurvedButtonTapped extends RAECurvedButtonState {
  final RAECurvedButtonSelected selectedButton;
  RAECurvedButtonTapped(this.selectedButton);
}

