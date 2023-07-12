import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'show_advert_event.dart';
part 'show_advert_state.dart';

class ShowAdvertBloc extends Bloc<ShowAdvertEvent, ShowAdvertState> {
  ShowAdvertBloc() : super(ShowAdvertInitial()) {
    on<ShowAdvertEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
