import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rae_curvedbottombutton_package/rae_curvedbottombutton_package.dart';

part './rae_curvedbutton_state.dart';


class RAECurvedButtonCubit extends Cubit<RAECurvedButtonState>{
    RAECurvedButtonCubit() : super (RAECurvedButtonInitial());

    void setInitial(){
        emit(RAECurvedButtonInitial());
    }

    void onButtonTapped(RAECurvedButtonSelected selectedButton){
        emit(RAECurvedButtonTapped(selectedButton));
    }
}