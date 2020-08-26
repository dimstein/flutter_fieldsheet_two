import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
//import 'package:google_sign_in_mocks/google_sign_in_mocks.dart';

main() {
  // Mock sign in with Google.
  // final googleSignIn = MockGoogleSignIn();
  // final signinAccount = await googleSignIn.signIn();
  // final googleAuth = await signinAccount.authentication;
  // final AuthCredential credential = GoogleAuthProvider.getCredential(
  //   accessToken: googleAuth.accessToken,
  //   idToken: googleAuth.idToken,
  // );
  // Sign in.
  final auth = MockFirebaseAuth();
  //String user;
  //final result = await auth.signInWithCredential(credential);
  auth
      .signInWithEmailAndPassword(email: 'test@test.com', password: '123456')
      .then((value) => print(
          'sign in test email: ${value.user.displayName}, user.uid: ${value.user.uid} '));
  //final user = await result.user;
  //print('sign in test email: $user');

  //expect(user, 'test@test.com');
}
