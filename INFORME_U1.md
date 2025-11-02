**Análisis de Modelado y Calidad de Datos**

**Nombre:** Edith Chuico

En este informe se abordarán temas que ayuden a justificar el uso de un modelo dual y los diversos problemas potenciales de calidad de datos en los sistemas de origen.

**Justificación del Modelo Dual**

Se opta por utilizar el sistema SQL para la sección de ventas ya que es necesario y obligatorio que cada venta sea consistente, ya que no podemos dejar datos sin completar o por el contrario, campos completados con datos que no son respectivos o acorde a su estructura pensada y esto se puede cubrir con la normalización entre tablas utilizando claves foráneas, característica principal del uso de estructura SQL.

Por otra parte, la base de datos NoSQL fue utilizada para el inventario ya que se cuenta con diversos productos que tienen atributos muy distintos y como solución a ello se pueden crear son documentos o documentos anidados en donde cada producto puede contar con campos únicos sin necesidad de crear colecciones diferentes o dejar campos nulos. Y a la vez, el guardar toda la información de un producto en una misma tabla, ayuda a que las consultas que se deseen realizar a futuro sean más rápidas ya que toda la información se puede recuperar de un mismo documento y colección.

**Problemas potenciales de calidad de datos**

1. **Cambios en fecha y hora**

   Dentro de SQL, en el campo Ventas,fecha\_venta se cuenta con la falta de una configuración de zona horaria necesaria. Esto representa un grave problema ya que en caso de contar con diversas sucursales que se encuentren en zonas horarias diferentes los registros de ventas se verán de manera diferente en base a la ubicación desde donde se observa. Con este tipo de inconsistencias se presentan dificultades al momento de querer realizar análisis o cálculos de las ventas realizadas en relación a las horas.

1. **Cambio de precios**

   Dentro del sistema SQL se cuenta con el campo Detalle\_Ventas.precio\_venta\_momento mientras que en NoSQL se obtiene el campo productos.precio\_unitario, el campo de la base de datos estructural registra el precio real bajo el que se vendió un producto, esto puede incluir precios modificados o descuentos, mientras que en MongoDB se utiliza el valor actual de cada producto sin importar si lo venden en oferta o con un descuento. Esto puede generar inconvenientes en caso de que deseen usar el precio de MongoDB en lugar del de la base de datos estrcturada ya que puede existir un desajuste en el análisis de ganancias y perdidas en la empresa.

1. **Ausencia de información**

   En la base de datos estructural se indica que el campo id\_empleados de la tabla Ventas puede ser nulo, y esto puede darse en caso de existir ventas en línea. Esto se define como un problema ya que a nivel administrativo no se podrá realizar un análisis efectivo del rendimiento individual de los empleados dado que no se obliga a que cada uno registre su id en las ventas.

