import 'package:bloc/bloc.dart';

import 'bmi_state.dart';

class FirstPageCubit extends Cubit<FirstPageState> {
  FirstPageCubit() : super(FirstPageState.initial());

  void toggleGender(bool isMale) {
    emit(state.copyWith(male: isMale));
  }

  void updateHeight(double height) {
    emit(state.copyWith(height: height));
  }

  void incrementWeight() {
    emit(state.copyWith(weight: state.weight + 1));
  }

  void decrementWeight() {
    if (state.weight > 1) {
      emit(state.copyWith(weight: state.weight - 1));
    }
  }

  void incrementAge() {
    emit(state.copyWith(age: state.age + 1));
  }

  void decrementAge() {
    if (state.age > 1) {
      emit(state.copyWith(age: state.age - 1));
    }
  }
}


