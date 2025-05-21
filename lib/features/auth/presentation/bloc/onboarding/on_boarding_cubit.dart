import 'package:aqar_zone_flutter_app/core/static/static.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<int> {
  final SharedPreferences sharedPreferences;
  OnBoardingCubit({required this.sharedPreferences}) : super(0);

  void changePage(int index) {
    emit(index);
  }

  Future<void> finishPage() async {
    await sharedPreferences.setBool(isFirstOpenKey, true);
  }
}
