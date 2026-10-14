class ErrorHandleHelper {
  static String getCustomErrorMessage(String errorCode) {
    switch (errorCode) {
      case 'invalid-credential':
      case 'wrong-password':
      case 'user-not-found':
        return 'Incorrect email or password. Please try again.';
      case 'email-already-in-use':
        return 'This email address is already registered.';
      case 'weak-password':
        return 'The password is too weak. Try a longer combination.';
      case 'invalid-email':
        return 'Please enter a valid email address.';
      case 'user-disabled':
        return 'This account has been disabled. Contact support.';
      case 'too-many-requests':
        return 'Too many attempts. Please try again later.';
      case 'network-request-failed':
        return 'No internet connection. Check your network.';
      default:
        return 'An unexpected error occurred. Please try again.';
    }
  }
}
