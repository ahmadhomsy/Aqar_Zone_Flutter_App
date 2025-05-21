import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'check_box_state.dart';

class CheckBoxCubit extends Cubit<bool> {
  CheckBoxCubit() : super(false);
  void changedCheckBoxState(bool isCheck) {
    emit(isCheck);
  }
}
