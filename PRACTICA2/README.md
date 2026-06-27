# PRACTICA2 - Modelo Estrella y Data Warehouse Northwind

Repositorio de la Práctica 2 de la asignatura **Extracción de conocimiento en bases de datos**.

## Descripción

El proyecto documenta el análisis y construcción de un **Data Warehouse** basado en la base de datos **Northwind**, utilizando un **modelo estrella** para organizar la información de pedidos.

La tabla de hechos utilizada es:

- `Orders`

Las dimensiones del modelo son:

- `Products`
- `Customers`
- `Employees`
- `Suppliers`
- `Time`

## Herramientas utilizadas

- SQL Server
- SQL Server Management Studio
- Visual Studio 2022
- SQL Server Integration Services Projects
- GitHub

## Estructura del repositorio

```text
PRACTICA2/
├── README.md
├── documentacion/
│   ├── PRACTICA2.pdf
│   ├── PRACTICA2.docx
│   └── README_documentacion.md
└── scripts/
    ├── 01_crear_dw_northwind.sql
    ├── 02_limpiar_dw.sql
    ├── 03_consultas_ole_db_source_ssis.sql
    └── 04_validacion_resultados.sql
```

## Contenido de la documentación

El documento final incluye:

- Portada
- Introducción
- Desarrollo paso a paso del modelo estrella
- Tablas de dimensiones y tabla de hechos
- Proceso ETL
- Resultados de validación
- Liga del repositorio
- Bibliografía en formato APA

## Repositorio

https://github.com/luisfstack-crypto/PRACTICA2
