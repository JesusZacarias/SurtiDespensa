/// Error comprensible para las capas superiores de la aplicación.
class AppFailure implements Exception {
  const AppFailure(this.message, {this.cause});

  final String message;
  final Object? cause;

  @override
  String toString() => 'AppFailure: $message';
}
