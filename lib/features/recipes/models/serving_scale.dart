/// Calcula el factor para adaptar una receta a otra cantidad de personas.
class ServingScale {
  const ServingScale();

  double factor({required int baseServings, required int desiredServings}) {
    if (baseServings <= 0 || desiredServings <= 0) {
      throw ArgumentError('Las porciones deben ser mayores que cero');
    }
    return desiredServings / baseServings;
  }
}
