import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:irctctest/core/routes_constant.dart';

class SignUpController extends GetxController{
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var mobileController = TextEditingController();
  var passwordController = TextEditingController();

  var emailError = ''.obs;
  var nameError = ''.obs;
  var mobileError = ''.obs;
  var passwordError = ''.obs;

  var isPasswordHidden = true.obs;

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  bool validateInputs() {
    bool isValid = true;

    if (emailController.text.isEmpty || !emailController.text.contains('@')) {
      emailError.value = 'Please enter a valid email';
      isValid = false;
    } else {
      emailError.value = '';
    }

    if (nameController.text.isEmpty) {
      nameError.value = 'Please enter your name';
      isValid = false;
    } else {
      nameError.value = '';
    }

    if (mobileController.text.isEmpty || mobileController.text.length != 10) {
      mobileError.value = 'Please enter a valid mobile number';
      isValid = false;
    } else {
      mobileError.value = '';
    }

    if (passwordController.text.isEmpty || passwordController.text.length < 6) {
      passwordError.value = 'Password must be at least 6 characters long';
      isValid = false;
    } else {
      passwordError.value = '';
    }

    return isValid;
  }

  Future<void> signUp() async {
    if (validateInputs()) {
      try {
        UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        // Handle additional user info storage (like name and mobile) in Firestore if needed
        Get.snackbar('Success', 'Account created successfully');
        Get.toNamed(RoutesConstant.home);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          passwordError.value = 'The password provided is too weak';
        } else if (e.code == 'email-already-in-use') {
          emailError.value = 'The account already exists for that email';
        } else {
          Get.snackbar('Error', e.message ?? 'An error occurred');
        }
      }
    }
  }

  Future<void> signUpWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        return; // User canceled the sign-in
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential = await auth.signInWithCredential(credential);

      Get.snackbar('Success', 'Google sign-in successful');
      Get.toNamed(RoutesConstant.home);
      // Navigate to the home screen or another appropriate screen
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  /*Future<void> signUpWithFacebook() async {
    FacebookAuth fbauth=FacebookAuth.instance;
    try {
      // await fbauth.logOut();
      // await auth.signOut();
      final fbloginResult=await fbauth.login();
      final userData=await fbauth.getUserData();
      final fbAuthCredential=FacebookAuthProvider.credential(fbloginResult.accessToken!.tokenString);
      await auth.signInWithCredential(fbAuthCredential);
      print('userDatareere');
      print(userData);
      print('userDatatrtrtr');
    } catch (e) {
      await fbauth.logOut();
      await auth.signOut();
      print("hello i am here119");
      print(e);

    }
  }*/

  void signOut() async {
    await auth.signOut();
    await FacebookAuth.instance.logOut();

  }

  Future<void> signUpWithFacebook() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final FacebookAuth fbauth = FacebookAuth.instance;

    try {
      // Facebook login
      final fbloginResult = await fbauth.login();
      final userData = await fbauth.getUserData();
      final fbAuthCredential = FacebookAuthProvider.credential(fbloginResult.accessToken!.tokenString);

      // Sign in with Facebook credentials
      await auth.signInWithCredential(fbAuthCredential);

      print('User data: $userData');
    } catch (e) {
      if (e is FirebaseAuthException && e.code == 'account-exists-with-different-credential') {
        print('e.codehello i am here line 145');
        print(e.code);
        print('e.code hello i am here 147');
        final String email = e.email!;
        final AuthCredential pendingCredential = e.credential!;

        // Fetch the list of sign-in methods associated with the email
        final List<String> signInMethods = await auth.fetchSignInMethodsForEmail(email);

        // Check the existing sign-in methods and prompt the user to sign in with the appropriate provider
        if (signInMethods.contains('google.com')) {
          // Prompt user to sign in with Google
          print('Sign in using Google');
          await _signInWithExistingProvider(GoogleAuthProvider(), pendingCredential);
        } else if (signInMethods.contains('password')) {
          // Prompt user to sign in with email and password
          print('Sign in using email and password');
          // Implement email and password sign-in flow here
        } else if (signInMethods.contains('facebook.com')) {
          // Prompt user to sign in with Facebook
          print('Sign in using Facebook');
          await _signInWithExistingProvider(FacebookAuthProvider(), pendingCredential);
        }
      } else {
        await fbauth.logOut();
        await auth.signOut();
        print("Error during Facebook sign-up: $e");
      }
    }
  }
  Future<void> _signInWithExistingProvider(AuthProvider provider, AuthCredential pendingCredential) async {
    final FirebaseAuth auth = FirebaseAuth.instance;

    try {
      // Sign in with the existing provider
      final UserCredential userCredential = await auth.signInWithProvider(provider);

      // Link the pending credential to the user
      await userCredential.user?.linkWithCredential(pendingCredential);
    } catch (e) {
      print("Error during linking credentials: $e");
    }
  }

}