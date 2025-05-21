import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'drop_down_menu_state.dart';

class DropDownMenuCubit extends Cubit<String> {
  DropDownMenuCubit() : super("+963");
  void selectCountryCode(String code) {
    emit(code);
  }
}
