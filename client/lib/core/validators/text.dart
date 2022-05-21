String? validateText(String text, {int? minLength, int? maxLength}) {
  if (minLength != null && text.length < minLength) {
    return 'Text too short';
  }

  if (maxLength != null && text.length > maxLength) {
    return 'Text too long';
  }

  return null;
}
