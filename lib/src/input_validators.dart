class InputValidators {
  final int passwordLength = 8;
  final int validationCodeLength = 8;
  InputValidators();

  bool fieldNotEmpty(
    String? value,
  ) {
    return value == null || value.isEmpty;
  }

  bool validEmail(
    String? emailId,
  ) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(
      emailId!,
    );
  }

  bool checkValidPasswordFormat(String? password) {
    return RegExp(
            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
        .hasMatch(
      password!,
    );
  }

  bool checkValidPasswordLength(String? password) {
    return (password?.length ?? 0) >= passwordLength;
  }

  bool checkValidationCodeLength(String? password) {
    return (password?.length ?? 0) == validationCodeLength;
  }
}
