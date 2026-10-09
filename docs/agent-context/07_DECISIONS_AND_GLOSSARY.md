# Decisiones y glosario

## Registro de decisiones

### D-001 · Flutter como cliente móvil

**Estado:** aceptada.  
**Motivo:** experiencia previa del desarrollador, una base para Android e iOS y
ecosistema apropiado para interfaces móviles.

### D-002 · SQLite como fuente local

**Estado:** aceptada.  
**Motivo:** la aplicación debe funcionar offline y el desarrollador ya conoce
SQLite. `sqflite` será el adaptador inicial.

### D-003 · Supabase como backend

**Estado:** aceptada para fase de sincronización.  
**Motivo:** autenticación, Postgres, políticas RLS y menor carga operativa.

### D-004 · Cuenta opcional

**Estado:** aceptada.  
**Motivo:** el usuario puede comenzar sin fricción; la cuenta se solicita para
respaldo, cambio de dispositivo y futuras funciones compartidas.

### D-005 · Arquitectura pragmática por features

**Estado:** aceptada.  
**Motivo:** conserva separación y capacidad de prueba sin la complejidad de una
Clean Architecture estricta. Usa modelos, presentation y data por feature.

### D-006 · Provider y GoRouter

**Estado:** aceptada.  
**Motivo:** herramientas conocidas, suficientes para el MVP y compatibles con
el enfoque de ViewModels y navegación declarativa.

### D-007 · IDs UUID locales

**Estado:** aceptada.  
**Motivo:** permiten crear datos sin conexión y reducen conflictos al sincronizar.

## Decisiones pendientes

- Esquema definitivo de tablas y migraciones SQLite.
- Política de resolución de conflictos de sincronización.
- Estrategia exacta para fotografías históricas de recetas/listas.
- Taxonomía inicial de categorías.
- Límites precisos del drag and drop para el primer MVP.

## Glosario

- **Recipe:** definición reutilizable de una comida con porciones base.
- **Ingredient:** producto normalizado que puede aparecer en varias recetas.
- **RecipeIngredient:** relación que añade cantidad y unidad a un ingrediente.
- **Base servings:** personas para las que fueron capturadas las cantidades.
- **Planned meal:** aparición de una receta en un día, momento y número de
  personas concretos.
- **Free meal:** evento que no requiere una receta, como comer fuera o sobras.
- **Shopping list:** resultado consolidado de un plan semanal.
- **Source breakdown / procedencia:** detalle de qué recetas aportan cada cantidad.
- **Snapshot histórico:** copia lógica inmutable de la información usada cuando
  se finalizó una lista.
- **Offline first:** el dispositivo local es capaz de completar las operaciones
  esenciales y sincroniza después.
- **Repository:** puerta de acceso a datos que evita que la UI dependa de SQLite
  o Supabase.
- **ViewModel:** estado y acciones que conectan una pantalla con el repositorio.
- **JWT:** token firmado que representa la sesión autenticada; se estudiará al
  integrar Supabase Auth.

