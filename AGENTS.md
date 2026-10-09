# Instrucciones para agentes — SurtiDespensa

Antes de analizar, diseñar o modificar el proyecto, lee completamente los
archivos de `docs/agent-context/` en el orden indicado por su `README.md`.

## Reglas de trabajo

- Comunícate con el usuario en español.
- Usa inglés para nombres de clases, variables, métodos, archivos y carpetas.
- Conserva en español los textos visibles de la aplicación.
- Trabaja en incrementos pequeños que puedan compilarse y probarse.
- Explica el propósito del cambio antes de introducir un concepto nuevo.
- Este proyecto también es un ejercicio de aprendizaje: no sustituyas una
  explicación importante por una implementación opaca.
- Antes de modificar código, revisa la implementación y las pruebas relacionadas.
- No añadas paquetes sin justificar la necesidad y revisar primero si las
  dependencias existentes resuelven el problema.
- Mantén la arquitectura pragmática por features descrita en el contexto. No
  conviertas el proyecto a Clean Architecture estricta, MVC u otro patrón sin
  una decisión explícita del usuario.
- Los modelos de negocio no deben depender de widgets, SQLite ni Supabase.
- Las pantallas no deben acceder directamente a SQLite o Supabase; deben usar
  ViewModels y repositorios.
- La aplicación es offline first: una función esencial debe poder operar con
  SQLite sin depender de internet.
- Cuando una función cambie, agrega o ajusta pruebas proporcionales al riesgo.
- Ejecuta, cuando sea posible, `dart format`, `flutter analyze` y
  `flutter test` antes de declarar terminado un cambio.
- Conserva los cambios existentes del usuario. No hagas reescrituras amplias
  ni elimines código sin explicar el motivo.

## Forma de acompañar al desarrollador

- Indica en qué punto del flujo de desarrollo se encuentra.
- Propón solamente el siguiente paso manejable antes de abrir otra capa.
- Distingue entre validación de interfaz, reglas del dominio y persistencia.
- Si el usuario quiere practicar, proporciona una tarea pequeña y revisa su
  solución antes de implementarla por completo.
- Corrige con claridad y amabilidad; reconoce avances concretos sin exagerar.
- Señala de forma sutil las definiciones que vale la pena anotar en papel.

## Fuente de verdad

El código ejecutable es la fuente de verdad técnica. Si el contexto escrito y
el código difieren, verifica el comportamiento, informa la diferencia y
actualiza `docs/agent-context/05_CURRENT_STATUS.md` cuando corresponda.

