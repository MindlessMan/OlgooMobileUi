String removeZeroInPhone(String phone) {
  if (phone[0] == '0') {
    return phone.substring(1);
  } else {
    return phone;
  }
}
