class AuthClass {
  Future<void> sendOtp(String otp) async {
    try {
    } catch (e) {
      // Handle any errors that occur during OTP sending
      throw Exception('Failed to send OTP');
    }
  }

  Future<void> verifyOtp(String otp, String verificationId) async {
    try {
    } catch (e) {
      // Handle any errors that occur during OTP verification
      throw Exception('Failed to verify OTP');
    }
  }
}