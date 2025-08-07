// email

String? validateEmail(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Email is required';
  }
  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  if (!emailRegex.hasMatch(value.trim())) {
    return 'Enter a valid email';
  }
  return null;
}
// password

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Password is required';
  }
  if (value.length < 8) {
    return 'Password must be at least 8 characters long';
  }
  if (!RegExp(r'[A-Z]').hasMatch(value)) {
    return 'Password must contain at least one uppercase letter';
  }
  if (!RegExp(r'[a-z]').hasMatch(value)) {
    return 'Password must contain at least one lowercase letter';
  }
  if (!RegExp(r'[0-9]').hasMatch(value)) {
    return 'Password must contain at least one number';
  }

  return null;
}

// firstname
String? validateFirstName(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'First name is required';
  }
  if (value.trim().length < 2) {
    return 'First name must be at least 2 characters';
  }
  if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
    return 'Only letters allowed in first name';
  }
  return null;
}

// Last name
String? validateLastName(String? value) {
  if (value != null && value.trim().isNotEmpty) {
    if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
      return 'Only letters allowed in last name';
    }
  }
  return null;
}

// OTP
String? validateOtp(String? value) {
  if (value == null || value.isEmpty) {
    return 'OTP is required';
  }
  if (value.length != 6 || !RegExp(r'^\d+$').hasMatch(value)) {
    return 'Enter a valid 6-digit OTP';
  }
  return null;
}

// validate day
String? validateDay(String? value) {
  if (value == null || value.isEmpty) return 'Day is required';
  final day = int.tryParse(value);
  if (day == null || day < 1 || day > 31) return 'Enter a valid day (1–31)';
  return null;
}

// validate month
String? validateMonth(String? value) {
  if (value == null || value.isEmpty) return 'Month is required';

  const validMonths = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  if (!validMonths.contains(value.trim())) {
    return 'Enter a valid month name';
  }

  return null;
}

// validate year

String? validateYear(String? value) {
  if (value == null || value.isEmpty) return 'Year is required';
  final year = int.tryParse(value);
  if (year == null || year < 1900 || year > DateTime.now().year) {
    return 'Enter a valid year';
  }
  return null;
}

String? validateFullName(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Full name is required';
  }
  return null;
}

String? validatePhoneNumber(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Phone number is required';
  }
  if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
    return 'Enter a valid 10-digit phone number';
  }
  return null;
}

String? validatePincode(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Pincode is required';
  }
  if (!RegExp(r'^[0-9]{6}$').hasMatch(value)) {
    return 'Enter a valid 6-digit pincode';
  }
  return null;
}

String? validateState(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'State is required';
  }
  return null;
}

String? validateCity(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'City is required';
  }
  return null;
}

String? validateLandmark(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Landmark is required';
  }
  return null;
}

String? validateHouseNumber(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'House/Building name is required';
  }
  return null;
}

String? validateRoadAreaColony(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Road name/Area/Colony is required';
  }
  return null;
}

String? validateAddressType(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please select address type';
  }
  return null;
}
