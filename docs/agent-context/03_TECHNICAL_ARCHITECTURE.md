# Arquitectura técnica

## Enfoque acordado

El proyecto usa una **arquitectura pragmática por features**, inspirada en MVVM
y separación por capas. No busca implementar Clean Architecture estricta.

La prioridad es mantener las reglas del negocio independientes sin crear una
cantidad innecesaria de abstracciones para un proyecto en aprendizaje.

## Organización esperada

```text
lib/
├── app/
│   ├── router/
│   └── theme/
├── core/
│   └── presentation/widgets/
└── features/
    └── recipes/
        ├── models/
        ├── data/
        └── presentation/
            ├── controllers/
            ├── screens/
            ├── view_models/
            └── widgets/
```

Las features futuras —planner, shopping list, history, auth/sync— deben seguir
la misma separación y compartir en `core` solo piezas verdaderamente genéricas.

## Responsabilidades

### Models

- Representan conceptos y reglas del negocio.
- No importan Flutter Material, SQLite ni Supabase.
- Rechazan estados imposibles mediante constructores y métodos.

### Presentation

- `screens`: ensamblan pantallas y coordinan navegación.
- `widgets`: dibujan componentes pequeños y reutilizables.
- `controllers`: contienen estado temporal propio del formulario, como
  `TextEditingController`.
- `view_models`: coordinan acciones, estados de carga, éxito y error.

### Data

- Los repositorios ofrecen operaciones a los ViewModels.
- La implementación actual de recetas usa memoria temporal.
- La siguiente implementación usará SQLite sin obligar a reescribir pantallas.
- La sincronización remota se incorporará detrás de servicios/repositorios.

## Flujo de dependencias

```text
Screen / Widget
      ↓
ViewModel
      ↓
Repository
      ↓
SQLite local ←→ Servicio de sincronización ←→ Supabase
```

## Tecnologías elegidas

- Flutter y Dart.
- Provider para inyección sencilla y ViewModels.
- GoRouter para navegación.
- sqflite y path para persistencia local.
- UUID para identificadores creados offline.
- intl para fechas y cantidades.
- Supabase: autenticación, Postgres y sincronización en una fase posterior.

## Estrategia offline

- Los UUID se generan localmente.
- Las escrituras se confirman primero en SQLite.
- La UI no espera a Supabase para completar operaciones esenciales.
- Una cola futura registra cambios pendientes.
- Las tablas sincronizadas necesitarán timestamps y borrado lógico.
- Los conflictos deben tener una política explícita antes de implementar sync.

