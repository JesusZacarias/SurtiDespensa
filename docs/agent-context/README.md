# Contexto para agentes

Esta carpeta permite que una persona o agente nuevo comprenda SurtiDespensa
antes de intervenir en el código. Su propósito no es documentar cada clase,
sino conservar las decisiones, el alcance y el estado necesarios para continuar
sin reconstruir toda la conversación original.

## Orden obligatorio de lectura

1. [`01_PROJECT_OVERVIEW.md`](01_PROJECT_OVERVIEW.md)
2. [`02_PRODUCT_SCOPE.md`](02_PRODUCT_SCOPE.md)
3. [`03_TECHNICAL_ARCHITECTURE.md`](03_TECHNICAL_ARCHITECTURE.md)
4. [`04_DEVELOPMENT_WORKFLOW.md`](04_DEVELOPMENT_WORKFLOW.md)
5. [`05_CURRENT_STATUS.md`](05_CURRENT_STATUS.md)
6. [`06_COLLABORATION_GUIDE.md`](06_COLLABORATION_GUIDE.md)
7. [`07_DECISIONS_AND_GLOSSARY.md`](07_DECISIONS_AND_GLOSSARY.md)

También debe leerse el archivo [`../../AGENTS.md`](../../AGENTS.md), que contiene
las reglas operativas aplicables al repositorio.

## Mantenimiento

- Actualiza `05_CURRENT_STATUS.md` después de completar un flujo importante.
- Registra en `07_DECISIONS_AND_GLOSSARY.md` las decisiones que afecten a varias
  features o que sean difíciles de revertir.
- Actualiza el alcance solo después de que el usuario confirme el cambio.
- Evita guardar aquí secretos, tokens, contraseñas o datos personales.
- Usa rutas relativas para que la documentación funcione local y remotamente.

Última actualización general: **9 de octubre de 2026**.

