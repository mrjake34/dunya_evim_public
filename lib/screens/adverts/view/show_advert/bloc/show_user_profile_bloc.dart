import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'show_user_profile_event.dart';
part 'show_user_profile_state.dart';

class ShowUserProfileBloc extends Bloc<ShowUserProfileEvent, ShowUserProfileState> {
  ShowUserProfileBloc() : super(ShowUserProfileInitial()) {
    on<ShowUserProfileEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
