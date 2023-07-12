import 'package:dunya_evim/screens/auth/login/bloc/login_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:huawei_hmsavailability/huawei_hmsavailability.dart';
import 'package:mockito/mockito.dart';

class MockGeolocator extends Mock implements Geolocator {}

class MockHmsApiAvailability extends Mock implements HmsApiAvailability {}

void main() {
  group('LoginBloc', () {
    late LoginBloc loginBloc;
    late MockFirebaseService mockFirebaseService;
    late MockGeolocator mockGeolocator;


    setUp(() {
      mockFirebaseService = MockFirebaseService();
      mockGeolocator = MockGeolocator();
      loginBloc = LoginBloc(
        firebaseService: mockFirebaseService,
        geolocator: mockGeolocator,
      );
    });

    tearDown(() {
      loginBloc.close();
    });

    test('initial state is correct', () {
      expect(loginBloc.state, LoginState(passwordVisibility: true, firebaseAuthErrorEnums: null));
    });
    // blocTest<LoginBloc, LoginState>(
    //   'emits [loading, success] when user login is successful',
    //   build: () {
    //     when(mockFirebaseService.firebaseAuth.signInWithEmailAndPassword(
    //       email: anyNamed('email'),
    //       password: anyNamed('password'),
    //     )).thenAnswer((_) async {
    //       UserCredential userCredential = UserCredential(user: User()); // create an instance
    //       User user = userCredential.user();
    //    // call the user method on the instance
    //     });
    //     return loginBloc;
    //   },
    //   act: (bloc) => bloc.add(UserLoginEvent(model: LoginRequestModel(email: 'test@test.com', password: 'test123'))),
    //   expect: () => [
    //     LoginState(status: Status.loading, passwordVisibility: true, firebaseAuthErrorEnums: null),
    //     LoginState(
    //         status: Status.success,
    //         passwordVisibility: true,
    //         firebaseAuthErrorEnums: null,
    //         userCredential: UserCredential.fromAuthResult(AuthResult(user: User()))),
    //   ],
    // );

    // blocTest<LoginBloc, LoginState>(
    //   'emits [loading, failed] when user login fails with user not found error',
    //   build: () {
    //     when(mockFirebaseService.firebaseAuth.signInWithEmailAndPassword(
    //       email: anyNamed('email'),
    //       password: anyNamed('password'),
    //     )).thenThrow(FirebaseAuthException(code: FirebaseAuthErrorEnums.userNotFound.value));
    //     return loginBloc;
    //   },
    //   act: (bloc) => bloc.add(UserLoginEvent(model: LoginRequestModel(email: 'test@test.com', password: 'test123'))),
    //   expect: () => [
    //     LoginState(status: Status.loading, passwordVisibility: true, firebaseAuthErrorEnums: null),
    //     LoginState(status: Status.failed, passwordVisibility: true, firebaseAuthErrorEnums: FirebaseAuthErrorEnums.userNotFound),
    //   ],
    // );
  });
}
