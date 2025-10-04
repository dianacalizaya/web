# Portafolio de Personaje - Steve

Este proyecto es una página estática creada solo con HTML y CSS que funciona como portafolio para presentar a un personaje de videojuego: Steve (Minecraft).

Características:
- Hero con SVG que representa al personaje y aura animada (solo CSS).
- Sección "Sobre" con narrativa breve.
- Habilidades representadas como tarjetas que giran al pasar el cursor (flip) usando solo CSS.
- Estadísticas con barras animadas controladas por atributos `data-value`.
- Galería con imágenes (enlaces a Unsplash) y efecto hover.
- Formulario de contacto ficticio (no envía datos, `onsubmit` evita la acción).

Cómo usar:
1. Abrir `index.html` en un navegador moderno (Chrome, Edge, Firefox).
2. No requiere servidor ni dependencias.

Agregar imagen del personaje:
- Coloca una imagen llamada `steve.png` en la carpeta `img/` dentro del proyecto: `img/steve.png`.
- También puedes añadir `steve.webp` para mejor compresión.
- Si ya tienes `steve.png` en la raíz del proyecto, muévelo con PowerShell:

```powershell
Move-Item .\steve.png .\img\steve.png
```

La galería usa `img/a.svg`, `img/b.svg`, `img/c.svg` por defecto; reemplázalas por imágenes reales si lo deseas.

Nota: el diseño ahora usa un contenedor más estrecho por defecto (800px) para una apariencia centrada en pantallas grandes.

Alineación y diseño:
- He mejorado el layout del hero para centrar la imagen y el texto, evitando que todo quede hacia un costado. Si quieres otro comportamiento (imagen a la izquierda y texto a la derecha) lo cambio fácilmente.

Ideas futuras (opcionales):
- Añadir pequeñas transiciones adicionales con CSS3.
- Incluir un archivo de variables para temas (claro/oscuro).
- Convertir el formulario en funcional usando JS y un servicio de backend.

Creado automáticamente como ejemplo.

---

Publicar en GitHub

Instrucciones rápidas para crear un repositorio remoto y subir este proyecto desde PowerShell.

Opción A — Usando Git (comandos para PowerShell):

1. Abre PowerShell en la carpeta del proyecto:

```powershell
cd "c:\Users\DIANA\OneDrive\Escritorio\Camino tu futuro"
```

2. Inicializa git, añade archivos y haz el primer commit:

```powershell
git init
git add .
git commit -m "Initial commit: Portafolio Steve"
```

3. Crea un repositorio en GitHub (manualmente en github.com) y copia la URL remota. Luego:

```powershell
git remote add origin https://github.com/<tu-usuario>/<tu-repo>.git
git branch -M main
git push -u origin main
```

Opción B — Usando GitHub CLI (más simple si la tienes instalada):

```powershell
cd "c:\Users\DIANA\OneDrive\Escritorio\Camino tu futuro"
gh repo create <tu-usuario>/<tu-repo> --public --source=. --remote=origin --push
```

Notas:
- Reemplaza `<tu-usuario>` y `<tu-repo>` por tu usuario de GitHub y el nombre deseado.
- Si necesitas que lo publique yo en un repositorio público, necesitaría acceso a una cuenta o un token (no puedo usar tus credenciales). Te puedo guiar paso a paso.

