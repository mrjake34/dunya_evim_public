import 'package:bloc/bloc.dart';

base class BaseBloc<V, T> extends Bloc<V, T> {
  BaseBloc(super.initialState);
  void safeEmit(T state) {
    if (isClosed) return;
    emit(state);
  }
}