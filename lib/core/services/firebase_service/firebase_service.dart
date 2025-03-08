import 'package:daladala/core/models/api_response_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

/// This is a Service Class to handle all requests to Firebase. ie FirebaseAuth and Firestore Database.
mixin FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  /// Sign In User with Email and Password
  Future<ApiResponseModel<bool>> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      UserCredential user = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (user.user != null) {
        return ApiResponseModel(
          data: true,
          statusCode: 200,
          message: "User Logged in successfully",
        );
      } else {
        return ApiResponseModel(
          data: false,
          statusCode: 403,
          message: "Failed to login User. Please try again",
        );
      }
    } on FirebaseAuthException catch (e) {
      return ApiResponseModel(
        data: false,
        statusCode: 500,
        message: e.message ?? "Unknown error occurred",
      );
    }
  }

  /// Create User with Email and Password
  Future<ApiResponseModel<bool>> createUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      UserCredential user = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (user.user != null) {
        return ApiResponseModel(
          data: true,
          statusCode: 200,
          message: "User Created in successfully",
        );
      } else {
        return ApiResponseModel(
          data: false,
          statusCode: 403,
          message: "Failed to create user. Please try again",
        );
      }
    } on FirebaseAuthException catch (e) {
      return ApiResponseModel(
        data: false,
        statusCode: 500,
        message: e.message ?? "Unknown error occurred",
      );
    }
  }

  /// Sign in with Google
  Future<ApiResponseModel<bool>> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return ApiResponseModel(
          data: false,
          statusCode: 403,
          message: "Google sign-in aborted by user",
        );
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await _auth.signInWithCredential(
        credential,
      );
      if (userCredential.user != null) {
        return ApiResponseModel(
          data: true,
          statusCode: 200,
          message: "User signed in with Google successfully",
        );
      } else {
        return ApiResponseModel(
          data: false,
          statusCode: 403,
          message: "Failed to sign in with Google. Please try again",
        );
      }
    } on FirebaseAuthException catch (e) {
      return ApiResponseModel(
        data: false,
        statusCode: 500,
        message: e.message ?? "Unknown error occurred",
      );
    } catch (e) {
      return ApiResponseModel(
        data: false,
        statusCode: 500,
        message: "Unknown error occurred: ${e.toString()}",
      );
    }
  }

  /// Check if there is a currently logged-in user
  Future<ApiResponseModel<bool>> checkLoggedInUser() async {
    try {
      final User? user = _auth.currentUser;

      if (user != null) {
        return ApiResponseModel(
          data: true,
          statusCode: 200,
          message: "User is already logged in",
        );
      } else {
        return ApiResponseModel(
          data: false,
          statusCode: 404,
          message: "No user is currently logged in",
        );
      }
    } catch (e) {
      return ApiResponseModel(
        data: false,
        statusCode: 500,
        message:
            "Unknown error occurred while checking the logged-in user: ${e.toString()}",
      );
    }
  }

  /// Sign Out LoggedInUser
  Future<ApiResponseModel<bool>> signOut() async {
    try {
      await _auth.signOut();
      await _googleSignIn.signOut();

      return ApiResponseModel(
        data: true,
        statusCode: 200,
        message: "User Signed out successfully",
      );
    } on FirebaseAuthException catch (e) {
      return ApiResponseModel(
        data: false,
        statusCode: 500,
        message: e.message ?? "Unknown error occurred",
      );
    } catch (e) {
      return ApiResponseModel(
        data: false,
        statusCode: 500,
        message: "Unknown error occurred: ${e.toString()}",
      );
    }
  }
}
