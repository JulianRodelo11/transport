String distanceFormat(int valueInMeters) {
  if (valueInMeters >= 1000) {
    return "${(valueInMeters).toStringAsFixed(0)} km";
  }
  return "$valueInMeters m";
}
