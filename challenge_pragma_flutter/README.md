# Cat Breeds App

Un aplicación móvil desarrollada en Flutter que muestra información detallada sobre diferentes razas de gatos.

## Descripción

Este proyecto fue desarrollado como parte de un desafío técnico para Pragma. La aplicación permite a los usuarios explorar una lista de razas de gatos, ver detalles específicos de cada raza y filtrar la información según diferentes criterios.

## Características principales

- Lista completa de razas de gatos con imágenes
- Vista detallada con información específica de cada raza
- Búsqueda y filtrado de razas por nombre
- Ordenamiento por diferentes criterios (nombre, inteligencia, país de origen)
- Marcado de razas como favoritas
- Soporte para tema claro y oscuro
- Experiencia de usuario fluida con animaciones sutiles

## Tecnologías utilizadas

- Flutter 3.10.x
- Dart 3.0.x
- Provider para gestión de estado
- GetIt para inyección de dependencias
- HTTP para consumo de APIs
- Arquitectura limpia (Clean Architecture)
- Tests unitarios con Mockito

## Instalación

1. Clona este repositorio:

   git clone https://github.com/tu-usuario/cat-breeds-app.git
   

2. Navega al directorio del proyecto:
   
   cd cat-breeds-app
   

3. Instala las dependencias:
   
   flutter pub get
   

4. Ejecuta la aplicación:
   
   flutter run
   

## Arquitectura

Este proyecto sigue los principios de Clean Architecture, separando el código en tres capas principales:

- **Presentación**: Contiene los Widgets, Screens y ViewModels que manejan la interfaz de usuario.
- **Dominio**: Define las entidades de negocio y los contratos de repositorios.
- **Datos**: Implementa el acceso a datos, tanto remotos como locales.

Esta separación permite un código más mantenible, testeable y escalable.

## Estructura del proyecto

```
lib/
├── config/                    # Configuraciones y constantes
├── core/                      # Utilidades y componentes comunes
│   ├── error/                 # Manejo de errores
│   ├── network/               # Cliente HTTP
│   ├── storage/               # Almacenamiento local
│   └── widgets/               # Widgets reutilizables
├── di/                        # Inyección de dependencias
├── features/                  # Funcionalidades de la aplicación
│   ├── breeds_list/           # Feature de lista de razas
│   │   ├── data/              # Capa de datos
│   │   ├── domain/            # Capa de dominio
│   │   └── presentation/      # Capa de presentación
│   └── breed_details/         # Feature de detalles de raza
│       ├── data/
│       ├── domain/
│       └── presentation/
├── app.dart                   # Configuración de la aplicación
└── main.dart                  # Punto de entrada
```

## Tests

Se han implementado tests unitarios para verificar el correcto funcionamiento de las partes más críticas de la aplicación:

- Tests de repositorios
- Tests de ViewModels
- Tests de componentes UI clave

Para ejecutar los tests:

flutter test


## API

Esta aplicación consume datos de [TheCatAPI](https://thecatapi.com/), un servicio que proporciona información detallada sobre razas de gatos.

## Desafíos y soluciones

Durante el desarrollo de este proyecto, me enfrenté a diversos desafíos técnicos:

1. **Gestión eficiente de imágenes**: Implementé una solución de caché para optimizar la carga de imágenes y reducir el consumo de datos.

2. **Manejo de estados complejos**: Utilicé Provider para mantener un flujo de datos limpio entre los diferentes componentes de la aplicación.

3. **Navegación y paso de parámetros**: Diseñé un sistema de rutas organizado que mantiene la coherencia entre pantallas.

## Posibles mejoras futuras

- Implementación de más pruebas de integración
- Soporte para modo offline
- Implementación de notificaciones para nuevas razas añadidas
- Filtrado avanzado por múltiples criterios

## Desarrollador

Este proyecto fue desarrollado por [Tu Nombre].

## Licencia

Este proyecto está bajo la Licencia MIT.
