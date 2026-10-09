/// Datos generales de la base local.
///
/// Todavía no abre SQLite. Sirve para mostrar que la configuración física
/// pertenece a `core/database`, no al dominio de recetas.
abstract final class DatabaseConfig {
  static const name = 'surtidespensa.db';
  static const schemaVersion = 1;
}
