// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:get/get.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class Auth extends GetxController {
//   Future<UserCredential?> signInWithGoogle() async {
//     // Create an instance of the firebase auth and google signin
//     FirebaseAuth auth = FirebaseAuth.instance;
//     final GoogleSignIn googleSignIn = GoogleSignIn();
//     //Triger the authentication flow
//     final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

//     //Obtain the auth details from the request
//     final GoogleSignInAuthentication googleAuth =
//         await googleUser!.authentication;
//     //Create a new credentials
//     final AuthCredential credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth.accessToken,
//       idToken: googleAuth.idToken,
//     );
//     //Sign in the user with the credentials
//     final UserCredential userCredential =
//         await auth.signInWithCredential(credential);
//     return null;
//   }
// }
