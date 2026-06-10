# Proyecto BI - Cartularium Notarial Americano

## Descripción del proyecto

Este repositorio contiene el desarrollo de una solución analítica de inteligencia de negocios para el área de capacitaciones de la PYME Cartularium Notarial Americano. El proyecto tiene como propósito centralizar, organizar, transformar y visualizar información relacionada con cursos, participantes, inscripciones, pagos, asistencia, instructores, certificados, modalidades y otros datos relevantes del proceso de capacitación.

La solución busca apoyar la toma de decisiones mediante indicadores clave de desempeño y visualizaciones que permitan evaluar el comportamiento operativo, financiero y estratégico del área de capacitaciones.

## Organización seleccionada

La organización seleccionada es Cartularium Notarial Americano, una PYME costarricense dedicada a la prestación de servicios legales, notariales y corporativos. Para este proyecto, el análisis se enfoca únicamente en el área de capacitaciones, la cual ofrece formación en temas jurídicos, notariales, administrativos y empresariales.

Esta área representa una unidad importante dentro de la organización, ya que permite compartir conocimiento especializado, fortalecer la relación con clientes y generar valor adicional mediante cursos, talleres, charlas o seminarios.

## Problema identificado

El problema principal identificado es que el área de capacitaciones no cuenta con una solución analítica integrada que permita evaluar de forma rápida y confiable el desempeño de sus actividades.

La información puede encontrarse distribuida en diferentes registros, como formularios de inscripción, hojas de cálculo, listas de asistencia, comprobantes de pago, encuestas, registros de instructores, correos o reportes manuales. Esta dispersión dificulta obtener una visión completa del área y limita la toma de decisiones basada en datos.

Como consecuencia, se vuelve más difícil identificar cuáles cursos tienen mayor demanda, cuáles generan mejores ingresos, qué porcentaje de inscritos asiste realmente, qué certificados han sido emitidos y qué capacitaciones presentan mayor efectividad.

## Objetivo de la solución

Diseñar e implementar una solución de inteligencia de negocios para el área de capacitaciones de Cartularium Notarial Americano, mediante una fuente operacional, un modelo dimensional, un proceso ETL documentado y un dashboard analítico que permita medir indicadores clave relacionados con inscripciones, asistencia, ingresos, satisfacción, rentabilidad y canales de promoción.

## Arquitectura de la solución

La solución está compuesta por los siguientes elementos:

1. **Fuente operacional**
   Base de datos relacional construida en PostgreSQL bajo el esquema `cartularium_ops`. Esta fuente representa la información principal de Cartularium Capacitaciones durante el periodo 2025.

2. **Modelo operacional**
   La base operacional se organiza en ocho tablas principales:

   * `curso`
   * `expositor`
   * `edicion_curso`
   * `cliente`
   * `participante`
   * `factura`
   * `pago`
   * `certificado`

3. **Proceso ETL**
   El proceso ETL fue desarrollado en KNIME. Su propósito es extraer, limpiar, transformar y cargar los datos provenientes de la fuente operacional consolidada. Durante este proceso se aplican reglas de validación, tratamiento de nulos, eliminación de duplicados, estandarización de datos, creación de campos derivados y generación de archivos de salida para el análisis.

4. **Modelo dimensional**
   El modelo dimensional adopta un esquema estrella. La tabla de hechos central es `fact_inscripcion`, con granularidad de una fila por participante por edición de curso.

   Las dimensiones definidas son:

   * `dim_tiempo`
   * `dim_cliente`
   * `dim_curso`
   * `dim_edicion`
   * `dim_expositor`
   * `dim_modalidad`

5. **Solución analítica**
   La solución analítica se representa mediante un dashboard en Power BI, utilizando medidas DAX e indicadores clave para responder las preguntas de negocio del proyecto.

## Preguntas de negocio

El dashboard permite responder preguntas como:

1. ¿Cuáles capacitaciones presentan mayor demanda según la cantidad de personas inscritas?
2. ¿Qué porcentaje de personas inscritas asiste realmente a las capacitaciones?
3. ¿Cuáles capacitaciones generan mayores ingresos para el área?
4. ¿Cuál es el estado de los certificados emitidos para los participantes?
5. ¿Qué capacitaciones presentan mayor efectividad considerando inscripción, asistencia e ingresos?

## Indicadores principales

Algunos de los indicadores clave definidos para el análisis son:

* Total de inscripciones.
* Inscripciones por curso.
* Tasa de asistencia.
* Cantidad de asistentes reales.
* Ingresos facturados.
* Pagos recibidos.
* Porcentaje de recuperación de pagos.
* Promedio de precio aplicado.
* Ocupación del cupo.
* Cursos por modalidad.
* Participantes recurrentes.
* Certificados emitidos.

## Herramientas utilizadas

Las herramientas utilizadas en el proyecto son:

* **PostgreSQL:** para la construcción de la fuente operacional.
* **SQL:** para la creación y consulta de estructuras de datos.
* **KNIME:** para el desarrollo del proceso ETL.
* **CSV:** como formato de entrada y salida dentro del flujo ETL.
* **Power BI:** para la construcción del dashboard analítico.
* **DAX:** para la creación de medidas dentro de Power BI.

## Instrucciones de ejecución

1. Crear o restaurar la base de datos operacional en PostgreSQL.
2. Ejecutar el script SQL correspondiente a la fuente operacional del proyecto.
3. Verificar que el esquema `cartularium_ops` y sus tablas principales estén creadas correctamente.
4. Generar o utilizar el archivo CSV consolidado con los datos transaccionales del área de capacitaciones.
5. Abrir el flujo ETL en KNIME.
6. Ejecutar el flujo ETL para aplicar las reglas de limpieza, transformación y validación de datos.
7. Revisar los archivos CSV de salida generados por el proceso ETL.
8. Abrir el archivo del dashboard en Power BI.
9. Cargar o actualizar los datos provenientes de los archivos generados por KNIME.
10. Validar las medidas, visualizaciones e indicadores del dashboard.
11. Revisar que el dashboard responda las preguntas de negocio definidas.

## Estructura del repositorio

```text
/
├── README.md
├── documentacion/
│   └── informe_final.pdf
├── sql/
│   └── fuente_operacional.sql
├── etl/
│   └── flujo_knime/
├── datos/
│   ├── entrada/
│   │   └── fuente_consolidada.csv
│   └── salida/
│       ├── tabla_limpia_principal.csv
│       ├── resumen_demanda.csv
│       ├── resumen_asistencia.csv
│       ├── resumen_ingresos.csv
│       ├── resumen_certificados.csv
│       └── resumen_efectividad.csv
├── powerbi/
│   └── dashboard_cartularium.pbix
└── imagenes/
    ├── modelo_operacional.png
    ├── diagrama_estrella.png
    └── dashboard.png
```

## Integrantes del grupo

Nicole Víquez Arguedas - 2023153741 

Matthew Meneses Pérez - 2023176229 

Manuel Torres Osorio – 2023215737 

Alejandro Sánchez Solano - 2023113200 

Luis Fernández Bonilla – 2023143848 

## Metodología de trabajo

El proyecto se desarrolló mediante una adaptación de la metodología Scrum, organizada en sprints semanales. Cada semana se definieron actividades específicas relacionadas con el análisis de datos, diseño de la fuente operacional, modelo dimensional, proceso ETL, dashboard y documentación final.

Esta metodología permitió distribuir responsabilidades entre los integrantes del equipo, revisar avances de forma constante y realizar ajustes conforme se desarrollaron los entregables.

## Entrega final

Como entrega final, el proyecto presenta una solución analítica completa para el área de capacitaciones de Cartularium Notarial Americano. Esta solución incluye una fuente operacional documentada, un modelo dimensional con tabla de hechos y dimensiones, un proceso ETL con reglas de transformación y evidencia de ejecución, y un dashboard interactivo que permite analizar el desempeño del área mediante indicadores clave.
