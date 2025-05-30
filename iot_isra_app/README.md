

# 📱 SmartHome Flutter App

Aplicación móvil desarrollada en Flutter para el control de un sistema embebido de domótica inteligente, operando completamente en red Wi-Fi local. Esta app permite al usuario activar alarmas, controlar dispositivos IoT (ventilador, bomba de agua, atomizador, puerta) y visualizar información ambiental y de sueño, todo desde una interfaz intuitiva y responsiva.

# Licencia MIT

## 👨‍💻 Autores
 Mejía Alba Israel Hipólito 

 Ruiz Gaspar José Ángel


## 🧠 Arquitectura

La app está construida bajo el patrón **Clean Architecture**, dividiendo el proyecto en tres capas principales:

- `presentation`: Interfaz de usuario y lógica de interacción.
- `domain`: Casos de uso y entidades del negocio.
- `data`: Fuentes de datos remotos (backend FastAPI).

Se hace uso de **Riverpod** para el manejo de estado y la inyección de dependencias de forma limpia, escalable y desacoplada.

## 🔌 Comunicación con el backend

La app se comunica mediante **peticiones HTTP (GET/POST)** con un servidor local desarrollado con FastAPI. Esta interacción permite:

- Consultar y configurar alarmas.
- Activar o desactivar dispositivos físicos conectados a una ESP32. 
- Ejecutar secuencias físicas como la rutina de alarma (ventilador + buzzer + atomizador).

## 📲 Funcionalidades principales

- 🔔 Activación de alarmas físicas
- 💧 Control de atomizador y bomba de agua
- 💨 Encendido de ventilador
- 🔓 Apertura y cierre de puerta 
- 💤 Visualización de informes de sueño
 
