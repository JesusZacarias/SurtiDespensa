/// Producto que puede utilizarse dentro de una o varias recetas.
///
/// Es un modelo del dominio: no conoce widgets, formularios ni SQLite.
class Ingredient {
  Ingredient({required String id, required String name})
    : id = id.trim(),
      name = _cleanName(name),
      normalizedName = _normalizeName(name) {
    if (this.id.isEmpty) {
      throw ArgumentError.value(id, 'id', 'No puede estar vacío');
    }
    if (this.name.isEmpty) {
      throw ArgumentError.value(name, 'name', 'No puede estar vacío');
    }
  }

  final String id;

  /// Nombre preparado para mostrarse al usuario.
  final String name;

  /// Nombre comparable utilizado para búsquedas y consolidación.
  ///
  /// Se calcula internamente para que nunca sea contradictorio con [name].
  final String normalizedName;

  /// Crea una nueva versión del ingrediente sin cambiar su identidad.
  Ingredient copyWith({String? name}) {
    return Ingredient(id: id, name: name ?? this.name);
  }

  static String _cleanName(String value) {
    return value.trim().replaceAll(RegExp(r'\s+'), ' ');
  }

  static String _normalizeName(String value) {
    return _cleanName(value).toLowerCase();
  }
}
