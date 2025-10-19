# Screen Dimmer PowerShell Script

## (EN)

### What it is
**Screen Dimmer** is a simple PowerShell script that allows you to reduce your screen brightness *below the minimum allowed by Windows 11*, without installing any third-party software.

It creates a **semi-transparent black overlay** that sits on top of your entire screen, giving the effect of a darker display — perfect for working at night or in low-light environments.

---

### Why it was made
Windows limits how low you can set the brightness, which can be uncomfortable for users in dark environments.  
This script was created to provide a lightweight, installation-free alternative that gives **fine control over perceived brightness** without altering hardware settings or system files.

---

### How it was made
The script uses:
- **PowerShell**
- The **.NET PresentationFramework** and **PresentationCore** libraries to render a borderless, transparent window.
- A **semi-transparent black rectangle** as a full-screen overlay.

It includes a simple key listener to allow closing the overlay easily with the **Escape** or **Alt + F4** keys.

---

### How it works
1. When executed, PowerShell creates a full-screen transparent window.
2. A black rectangle with adjustable opacity covers the entire screen.
3. The opacity level determines how dark the screen appears (`0.1` = light, `0.7` = very dark).
4. Press **ESC** or **Alt + F4** to close it.

---

### How to use it
1. Save the script as `oscurecer.ps1`
2. Right-click → **Run with PowerShell**
3. Adjust the line:
   ```powershell
   $overlay.Opacity = 0.3
   ```
   to control the darkness level.
4. To run it by double-click:
   - Create a shortcut:
     ```
     powershell.exe -ExecutionPolicy Bypass -File "C:\path\to\oscurecer.ps1"
     ```
   - Double-click the shortcut whenever you need it.

---

### Notes
- No installation required.
- Works on **Windows 10 and 11**.
- Does **not** modify screen hardware or brightness settings — it’s 100% software-based and reversible.

---

## (ES)

### Qué es
**Screen Dimmer** es un script de PowerShell que permite reducir el brillo de la pantalla *por debajo del mínimo que permite Windows 11*, sin instalar ningún programa adicional.

Crea una **capa negra semitransparente** sobre toda la pantalla, simulando un nivel de brillo menor. Es ideal para trabajar de noche o en entornos con poca luz.

---

### Por qué se hizo
Windows no permite bajar el brillo físico más allá de un límite, lo que puede resultar molesto en lugares oscuros.  
Este script se creó como una alternativa **ligera, portable y sin instalación**, que da control total sobre el brillo percibido sin alterar configuraciones del sistema o del monitor.

---

### Cómo se hizo
El script está desarrollado en:
- **PowerShell**
- Usa las librerías **.NET PresentationFramework** y **PresentationCore** para crear una ventana transparente sin bordes.
- Dibuja un **rectángulo negro semitransparente** que cubre toda la pantalla.

También incluye un manejador de teclas para cerrar fácilmente con **ESC** o **Alt + F4**.

---

### Cómo funciona
1. Al ejecutarse, PowerShell crea una ventana transparente a pantalla completa.  
2. Sobre ella, se dibuja un rectángulo negro con opacidad ajustable.  
3. La opacidad controla qué tan oscuro se verá el efecto (`0.1` = tenue, `0.7` = muy oscuro).  
4. Se puede cerrar presionando **ESC** o **Alt + F4**.

---

### ▶Cómo usarlo
1. Guarda el script como `oscurecer.ps1`
2. Haz clic derecho → **Ejecutar con PowerShell**
3. Modifica esta línea para ajustar el nivel de oscuridad:
   ```powershell
   $overlay.Opacity = 0.3
   ```
4. Para abrirlo con doble clic:
   - Crea un acceso directo con el comando:
     ```
     powershell.exe -ExecutionPolicy Bypass -File "C:\ruta\completa\oscurecer.ps1"
     ```
   - Luego, simplemente haz doble clic sobre el acceso directo cuando lo necesites.

---

### Notas
- No requiere instalación.  
- Funciona en **Windows 10 y 11**.  
- No cambia el brillo real del monitor, solo reduce el brillo percibido.  
- Es completamente reversible y seguro.

---

*Created with simplicity and purpose — for comfortable late-night screen use.*
