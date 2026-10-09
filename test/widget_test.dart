import 'package:flutter_test/flutter_test.dart';
import 'package:surtidespensa/app/surti_despensa_app.dart';

void main() {
  testWidgets('muestra el catálogo de recetas de ejemplo', (tester) async {
    await tester.pumpWidget(const SurtiDespensaApp());
    await tester.pumpAndSettle();

    expect(find.text('Mis recetas'), findsOneWidget);
    expect(find.text('Todavía no tienes recetas.'), findsOneWidget); 
  });
}
