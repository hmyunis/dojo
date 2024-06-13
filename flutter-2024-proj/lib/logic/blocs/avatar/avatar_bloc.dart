import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'avatar_event.dart';

class AvatarBloc extends Bloc<AvatarEvent, int> {
  AvatarBloc() : super(0) {
    on<SetAvatarIndex>((event, emit) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setInt('avatarIndex', event.index);
      emit(event.index);
    });
    on<GetAvatarIndex>((event, emit) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      emit(prefs.getInt('avatarIndex')??0);
    },);
    on<ResetAvatarIndex>((event, emit) {
      emit(0);
    });
  }
}
