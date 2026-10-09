/// Unidades permitidas inicialmente para los ingredientes.
///
/// No son datos falsos de la interfaz: forman parte de las reglas del dominio.
/// Más adelante SQLite guardará `name` y la UI continuará mostrando `label`.
enum MeasurementUnit {
  piece('piezas'),
  gram('g'),
  kilogram('kg'),
  milliliter('ml'),
  liter('l');

  const MeasurementUnit(this.label);

  final String label;
}
