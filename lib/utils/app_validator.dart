class AppValidator {
  static appValidator(String input, ValidationType type) {
    if (type == ValidationType.email) {
      if (input == "") {
        return "Email Address is Required!";
      } else if (!emailReg.hasMatch(input)) {
        return "The Email Address is Invalid";
      } else {
        return null;
      }
    } else if (type == ValidationType.pass) {
      if (input == "") {
        return "Account Password is Required!";
      } else if (input.length < 8) {
        return "Password Must Contain At Least 8 Chars";
      } else if (!passReg.hasMatch(input)) {
        return "Password Isn't Correct";
      } else {
        return null;
      }
    }
  }
}

enum ValidationType { email, pass }

RegExp passReg = RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*[\d!@#$%^&*]).{8,}$');
RegExp emailReg = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,}$');
