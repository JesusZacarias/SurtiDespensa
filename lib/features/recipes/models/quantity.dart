/// Cantidad válida de un ingrediente.
class Quantity {
  Quantity(this.value) {
    if (!value.isFinite || value <= 0) {
      throw ArgumentError.value(value, 'value', 'Debe ser mayor que cero');
    }
  }

  final double value;

  Quantity scaledBy(double factor) {
    if (!factor.isFinite || factor <= 0) {
      throw ArgumentError.value(factor, 'factor', 'Debe ser mayor que cero');
    }
    return Quantity(value * factor);
  }
}
