import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shoply_app/core/helper/error_handle_helper.dart';
import 'package:shoply_app/core/utils/constants/firestore_collections.dart';
import 'package:shoply_app/model/login/request_login.dart';
import 'package:shoply_app/model/login/response_login.dart';

// Handles the user login process
class LoginUsecase {
  // Attempts to log in and returns either an error message or user data
  // Left(String) represents failure
  // Right(ResponseLogin) represents success with the user's data
  Future<Either<String, ResponseLogin>> login({
    // Contains the user's email and password
    required RequestLogin requestLogin,
  }) async {
    // Try to execute the login process
    try {
      // Sign in using the email and password provided by the user
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: requestLogin.email, // Get the email from the request
        password: requestLogin.password, // Get the password from the request
      );

      // Get the authenticated user from the login result
      final user = credential.user;

      // Check whether Firebase returned a valid user
      if (user == null) {
        return const Left('Login failed. Try again.');
      }

      // Check whether the user has verified their email address
      if (!user.emailVerified) {
        // Sign out users whose email is not verified
        await FirebaseAuth.instance.signOut();

        // Stop the login process and return an error message
        return const Left('Please verify your email, then log in.');
      }

      // Find the user's document in the Firestore users collection
      // The document ID is the user's Firebase UID
      final doc = await FirebaseFirestore.instance
          .collection(FirestoreCollections.users)
          .doc(user.uid)
          .get();

      // Extract the document data as a Map
      final data = doc.data();

      // Check whether the user data exists in Firestore
      if (data == null) {
        // Sign out if the user's data cannot be found
        await FirebaseAuth.instance.signOut();

        // Stop the login process and return an error message
        return const Left('User data not found.');
      }

      // Convert the Firestore Map into a ResponseLogin object
      // Return the user's data as a successful result
      return Right(ResponseLogin.fromJson(data));

      // Handle Firebase Authentication errors
    } on FirebaseAuthException catch (e) {
      // Convert the Firebase error code into a readable message
      return Left(ErrorHandleHelper.getCustomErrorMessage(e.code));

      // Handle other Firebase errors, such as Firestore errors
    } on FirebaseException catch (e) {
      // Return the Firebase error message or a default message
      return Left(e.message ?? 'Database error. Try again.');

      // Handle any unexpected errors
    } catch (_) {
      return const Left('An unexpected error occurred. Please try again.');
    }
  }
}
