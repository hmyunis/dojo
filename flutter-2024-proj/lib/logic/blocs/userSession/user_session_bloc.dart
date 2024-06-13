import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/user.dart';

part 'user_session_event.dart';

class UserSessionBloc extends Bloc<UserSessionEvent, User> {
  UserSessionBloc()
      : super(User(username: "", email: "", joinDate: "", role: "")) {
    on<UserSessionLogin>((event, emit) {
      emit(User(
        id: event.user.id,
        username: event.user.username,
        email: event.user.email,
        joinDate: event.user.joinDate,
        role: event.user.role,
        token: event.user.token,
      ));
    });
    on<UserSessionLogout>((event, emit) async {
      final prefs = await SharedPreferences.getInstance();
      prefs.remove('id');
      prefs.remove('username');
      prefs.remove('email');
      prefs.remove('joinDate');
      prefs.remove('role');
      prefs.remove('token');
      prefs.remove('avatarIndex');
      emit(User(username: "", email: "", joinDate: "", role: ""));
    });
  }
}
