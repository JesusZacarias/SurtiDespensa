# Alcance del producto

## Recorrido principal del MVP

```text
Crear recetas
    → Planear comidas de la semana
    → Ajustar personas por comida
    → Generar lista consolidada
    → Revisar existencias y comprar
    → Finalizar lista
    → Confirmar comidas preparadas
    → Conservar historial
```

## Funciones incluidas

### Recetas

- Catálogo personal.
- Crear, consultar, editar y eliminar recetas.
- Ingredientes, cantidades, unidades y porciones base.
- Categorías definidas inicialmente de manera manual.
- Una receta no puede repetir el mismo ingrediente dentro de sí misma.
- La misma receta puede planearse varias veces durante una semana.

### Planeación semanal

- Varias comidas por día.
- Momentos: desayuno, comida, cena, colación y personalizados.
- Número de personas independiente para cada aparición de una receta.
- Comidas libres: comer fuera, pedir comida o preparar sobras.
- Mover comidas entre días. El drag and drop es deseable, pero debe existir una
  alternativa accesible como “Mover a…”.

### Lista de compras

- Generación desde el plan semanal.
- Escalado de ingredientes según las personas.
- Consolidación únicamente entre cantidades y unidades compatibles.
- Detalle de procedencia de cada cantidad.
- Artículos añadidos manualmente.
- Revisión de productos disponibles en casa.
- Estados de compra y sustituciones.

### Historial

- Finalización de listas.
- Confirmación de las comidas realmente preparadas.
- La receta y la lista histórica conservan una fotografía lógica de los datos
  utilizados; editar una receta no debe reescribir el pasado.

### Cuenta y sincronización

- La cuenta no es obligatoria para comenzar.
- Se requiere para respaldo, recuperación y cambio de dispositivo.
- SQLite conserva la fuente local de trabajo.
- Supabase permite autenticación y sincronización individual.
- Preferencias: cualquier red, solo Wi-Fi o sincronización manual.

## Fuera del MVP inicial

- Recomendaciones automáticas basadas en historial.
- Compartición y edición colaborativa de recetas.
- Detección automática avanzada de categorías.
- Integraciones con supermercados, inventarios o precios.
- Conversión inteligente de unidades incompatibles.
- Publicación para iOS.

## Reglas de negocio esenciales

- Una receta contiene uno o más ingredientes.
- Un ingrediente puede pertenecer a muchas recetas.
- Una lista semanal puede incluir muchas recetas y una receta puede aparecer en
  muchas listas o días.
- Las cantidades deben ser finitas y mayores que cero.
- Las porciones base deben ser enteras y mayores que cero.
- Cambiar una receta no debe modificar listas históricas finalizadas.
- Los borrados que deban sincronizarse requerirán borrado lógico.

