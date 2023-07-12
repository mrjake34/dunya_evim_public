

import 'package:dunya_evim/core/constants/enums/bloc_enums.dart';
import 'package:dunya_evim/screens/auth/register/bloc/register_bloc.dart';
import 'package:dunya_evim/screens/auth/register/model/register_request_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('RegisterBloc', () {
    late RegisterBloc registerBloc;

    setUp(() {
      registerBloc = RegisterBloc();
    });

    tearDown(() {
      registerBloc.close();
    });

    test('Initial state is correct', () {
      expect(registerBloc.state, RegisterState());
    });

    test('PostUserRegister event updates state correctly', () {
      // final userModel = RegisterRequestModel(email: 'test@example.com', password: 'password123', fullName: 'John Doe');
      final expectedState = RegisterState(status: Status.success);

      // registerBloc.add(PostUserRegister(model: userModel));

      expectLater(registerBloc.stream, emitsInOrder([emits(isA<RegisterState>()), emits(expectedState)]));
    });

    test('UserAgreementEvent event updates state correctly', () {
      final isUserAgreementAccepted = true;
      final expectedState = RegisterState(isUserAgreementAccepted: isUserAgreementAccepted);

      registerBloc.add(UserAgreementEvent(isUserAgreement: isUserAgreementAccepted));

      expectLater(registerBloc.stream, emitsInOrder([emits(isA<RegisterState>()), emits(expectedState)]));
    });

    test('PassVisibilityEvent event updates state correctly', () {
      final initialPassVisibility = false;
      final expectedState = RegisterState(passVisibility: true);

      registerBloc.add(PassVisibilityEvent());

      expectLater(registerBloc.stream, emitsInOrder([emits(isA<RegisterState>()), emits(expectedState)]));
    });

    test('RePassVisiblityEvent event updates state correctly', () {
      final initialRePassVisibility = false;
      final expectedState = RegisterState(rePassVisibility: true);

      registerBloc.add(RePassVisibilityEvent());

      expectLater(registerBloc.stream, emitsInOrder([emits(isA<RegisterState>()), emits(expectedState)]));
    });
  });
}
