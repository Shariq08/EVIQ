class Validators {
  static String? nameValidator(String? value) {
    if (value?.isEmpty ?? true) {
      return 'Enter a valid name';
    }

    final nameRegex = RegExp(r"^[a-zA-Z\s'-]+");

    if (!nameRegex.hasMatch(value!)) {
      return 'Enter a valid name (letters, spaces, hyphens only)';
    }

    return null;
  }

  static String? phoneOrEmailValidator(String? value) {
    if (value?.isEmpty ?? true) {
      return 'Enter phone or email';
    }

    final phoneRegex = RegExp(r"^\+?[0-9]{10,15}");
    final emailRegex =
        RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}");

    if (!phoneRegex.hasMatch(value!) && !emailRegex.hasMatch(value)) {
      return 'Enter a valid phone number or email';
    }

    return null;
  }

  static String? passwordValidator(String? value) {
    if (value?.isEmpty ?? true) {
      return 'Password cannot be empty';
    }

    // Regular expression to enforce:
    // - At least 12 characters
    // - At least one uppercase letter
    // - At least one lowercase letter
    // - At least one number
    // - At least one special character (!, @, $, %, ^, &, *, +, #)
    final passwordRegex = RegExp(
        r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@\$%\^&\*\+#])[A-Za-z\d!@\$%\^&\*\+#]{12,}$');

    if (!passwordRegex.hasMatch(value!)) {
      return r'Password must contain at least 12 characters, including uppercase, lowercase, numbers, and special characters (!, @, $, %, ^, &, *, +, #).';
    }

    return null; // Valid password
  }

  static String? phoneEmailOrNameValidator(String? value) {
    if (value?.isEmpty ?? true) {
      return 'Enter phone, email, or name';
    }

    final phoneRegex = RegExp(r"^\+?[0-9]{10,15}");
    final emailRegex =
        RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}");
    final nameRegex = RegExp(r"^[a-zA-Z\s'-]+");

    if (!phoneRegex.hasMatch(value!) &&
        !emailRegex.hasMatch(value) &&
        !nameRegex.hasMatch(value)) {
      return 'Enter a valid phone number, email, or name';
    }

    return null;
  }
}
