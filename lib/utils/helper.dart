String? validateEmail({ required String? value}) {
  if (value == null || value.isEmpty) {
    return 'Please enter an email';
  }

  else{

    final RegExp emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');

    if(emailRegex.hasMatch(value)){
      return null;

    }else{
      return 'Enter a valid email';

    }
  }
}

String? validatePassword({required String password}) {
  if (password.isEmpty) {
    return 'Please enter a password';
  } else if (password.length < 6) {
    return 'Password must be at least 6 characters long';
  } 
  return null;  // Password is valid
}


String ? validateDropdown({ required String ? value}) {
  if (value == null) {

     return 'Please select an option';

  } else {

      return null;

  }
}

