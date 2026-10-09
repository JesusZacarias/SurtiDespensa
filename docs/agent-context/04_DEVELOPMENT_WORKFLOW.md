# Flujo de desarrollo

## Orden para cada feature

1. Aclarar el caso de uso y sus criterios de aceptación.
2. Definir o ajustar reglas y modelos.
3. Escribir pruebas unitarias de las reglas relevantes.
4. Definir la operación del repositorio.
5. Implementar primero una fuente simple cuando ayude a aprender el flujo.
6. Crear el ViewModel y sus estados.
7. Conectar la pantalla y sus componentes.
8. Añadir pruebas de widgets e integración.
9. Revisar UX: carga, vacío, éxito, error y accesibilidad.
10. Ejecutar formato, análisis, pruebas y comprobación manual.
11. Actualizar `05_CURRENT_STATUS.md`.

## Ciclo de revisión con el usuario

```text
Usuario implementa una parte pequeña
    → Agente revisa sin reescribir innecesariamente
    → Agente explica errores y propone ajustes
    → Usuario ejecuta pruebas
    → Se aprueba el paso
    → Se elige el siguiente paso
```

## Estrategia de pruebas

### Unitarias

Para modelos, cálculos, consolidación, repositorios y ViewModels. Usar el patrón
Preparar → Actuar → Comprobar y nombres que describan la conducta.

### Widgets

Para validadores, formularios, estados visuales, callbacks y navegación. Evitar
localizadores frágiles basados únicamente en la posición cuando pueda usarse una
`Key` semántica o un controlador conocido.

### Integración

Para recorridos críticos:

- crear receta y verla en el catálogo;
- cerrar y abrir la app conservando datos;
- planear y generar una lista;
- completar compra e historial;
- trabajar offline y sincronizar después.

## Lista de terminado por tarea

- [ ] El comportamiento satisface el criterio de aceptación.
- [ ] Los nombres de código están en inglés y son claros.
- [ ] No se duplicó lógica de negocio en la interfaz.
- [ ] Se manejan estados de carga y error cuando aplican.
- [ ] Existen pruebas proporcionales al riesgo.
- [ ] `dart format` fue aplicado.
- [ ] `flutter analyze` no reporta problemas.
- [ ] `flutter test` pasa completamente.
- [ ] Se realizó una comprobación manual del flujo.
- [ ] Se actualizó el contexto si cambió el estado o una decisión.

## Política de cambios

- Preferir cambios pequeños y revisables.
- No mezclar refactors amplios con una nueva función.
- No introducir dependencias “por si acaso”.
- Explicar cualquier eliminación o sustitución importante.
- Nunca guardar secretos de Supabase o firmas Android en Git.

