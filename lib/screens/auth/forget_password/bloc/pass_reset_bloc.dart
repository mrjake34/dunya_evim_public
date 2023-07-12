import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/base/class/base_bloc.dart';
import '../../../../core/base/firebase/firebase_service.dart';
import '../../../../core/constants/enums/bloc_enums.dart';

part 'pass_reset_event.dart';
part 'pass_reset_state.dart';

final class PassResetBloc extends BaseBloc<PassResetEvent, PassResetState> {
  PassResetBloc() : super(PassResetState()) {
    on<PassResetEmailSender>((event, emit) async {
      safeEmit(state.copyWith(status: Status.loading));
      try {
        if (event.email?.isNotEmpty == true) {
          await FirebaseService.instance.firebaseAuth.sendPasswordResetEmail(email: event.email!);
          safeEmit(state.copyWith(status: Status.success));
          //
        } else {
          safeEmit(state.copyWith(status: Status.failed));
        }
      } on FirebaseAuthException catch (e) {
        print('Pass Reset Error ${e.code}');
        if (e.code == FirebaseAuthErrorEnums.userNotFound.value) {
          safeEmit(state.copyWith(status: Status.failed, firebaseAuthErrorEnums: FirebaseAuthErrorEnums.userNotFound));
        }
      }
    });
    on<ClearPassResetErrorEvent>((event, emit) {
      safeEmit(state.copyWith(firebaseAuthErrorEnums: null));
    });
  }
}
