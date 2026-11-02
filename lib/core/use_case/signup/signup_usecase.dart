import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shoply_app/core/helper/error_handle_helper.dart';
import 'package:shoply_app/core/service/upload_image_service.dart';
import 'package:shoply_app/core/utils/constants/firestore_collections.dart';
import 'package:shoply_app/model/signup/request_signup.dart';

// Handles the user registration process
class SignupUsecase {
  // Registers a new user and returns either an error message or success
  Future<Either<String, bool>> signup({
    required String password, // User's password
    required RequestSignup requestSignup,
    required File? image,
    // User's registration data
  }) async {
    // Try to execute the registration process
    try {
      // Create a new account using email and password
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: requestSignup.email.trim(), // Get email from the request
            password: password, // Send password to Firebase Authentication
          );

      // Get the newly created user
      final user = userCredential.user;

      // Check if the user was created successfully
      if (user == null) {
        return const Left('Could not create the account. Try again.');
      }

      // Try saving user data and sending the verification email
      try {
        // Save the user's data in the Firestore users collection
        // Use the Firebase UID as the document ID
        //pick image and send to firstor

        final imageUrl = await _uploadImage(image: image);

        await FirebaseFirestore.instance
            .collection(FirestoreCollections.users)
            .doc(user.uid)
            .set({
              // Convert the request data to a Map and add the user's UID
              ...requestSignup
                  .copyWith(uid: user.uid, profileImage: imageUrl)
                  .toJson(),

              // Add the account creation timestamp from the Firestore server
              'createdAt': FieldValue.serverTimestamp(),
            });

        // Send an email verification link to the user
        await user.sendEmailVerification();
      } catch (_) {
        // Try deleting the authentication account if saving data
        // or sending the verification email fails
        await user.delete();

        // Pass the error to the outer error handler
        rethrow;
      }

      // Sign out after completing registration
      await FirebaseAuth.instance.signOut();

      // Return success
      return const Right(true);

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

// image from image pick and image servis function uplding image

Future<String?> _uploadImage({required File? image}) async {
  if (image != null) {
    final imageUrl = await UploadImageService.uplaodImage(imageFile: image);
    return imageUrl;
  } else {
    return null;
  }
}
