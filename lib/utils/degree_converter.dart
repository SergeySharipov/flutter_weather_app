class DegreeConverter {
  static String degreeToCardinalDirection(int directionInDegrees){
    const directions = ['N', 'NE', 'E', 'SE', 'S', 'SW', 'W', 'NW'];
    return directions[(directionInDegrees / 45).round() % 8];
  }
}
