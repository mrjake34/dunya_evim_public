import 'package:country_code_picker/country_code_picker.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/base/class/base_bloc.dart';
import '../../../../core/base/firebase/firebase_service.dart';
import '../../../../core/constants/enums/bloc_enums.dart';
import '../model/register_request_model.dart';
part 'register_event.dart';
part 'register_state.dart';

final class RegisterBloc extends BaseBloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterState()) {
    on<PostUserRegisterEvent>((event, emit) async {
      safeEmit(state.copyWith(status: Status.loading));
      if (event.model?.email != null && event.model?.password != null) {
        try {
          final userCredential = await FirebaseService.instance.firebaseAuth
              .createUserWithEmailAndPassword(email: event.model?.email ?? '', password: event.model?.password ?? '');
          if (userCredential.user != null) {
            await userCredential.user?.updateDisplayName(event.model?.fullName ?? '');
            final newModel;
            newModel = await event.model?.copyWith(uid: userCredential.user?.uid, password: ' ');
            await FirebaseService.instance.userCollection.doc(userCredential.user?.uid).set(newModel?.toJson());
            safeEmit(state.copyWith(status: Status.success));
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == FirebaseAuthErrorEnums.emailAlreadyInUse.value) {
            safeEmit(state.copyWith(status: Status.failed, firebaseAuthErrorEnums: FirebaseAuthErrorEnums.emailAlreadyInUse));
          } else if (e.code == FirebaseAuthErrorEnums.manyTried.value) {
            safeEmit(state.copyWith(status: Status.failed, firebaseAuthErrorEnums: FirebaseAuthErrorEnums.manyTried));
          } else {
            safeEmit(state.copyWith(status: Status.failed, firebaseAuthErrorEnums: FirebaseAuthErrorEnums.error));
          }
        }
        safeEmit(state.copyWith(status: Status.failed));
      }
    });
    on<UserAgreementEvent>((event, emit) {
      safeEmit(state.copyWith(isUserAgreementAccepted: event.isUserAgreement));
    });
    on<PassVisibilityEvent>((event, emit) {
      if (state.passVisibility == false) {
        safeEmit(state.copyWith(passVisibility: true));
      } else {
        safeEmit(state.copyWith(passVisibility: false));
      }
    });
    on<RePassVisibilityEvent>((event, emit) {
      if (state.rePassVisibility == false) {
        emit(state.copyWith(rePassVisibility: true));
      } else {
        safeEmit(state.copyWith(rePassVisibility: false));
      }
    });
    on<RegisterClearErrorEvent>((event, emit) {
      if (state.firebaseAuthErrorEnums != null) {
        safeEmit(state.copyWith(firebaseAuthErrorEnums: null));
      }
    });
    on<ChangeLocationEvent>((event, emit) {
      if (event.country != null) {
        safeEmit(state.copyWith(country: event.country));
      }
    });
  }
}
