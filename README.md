# Laboratorio de Análisis de Tráfico con PcapXray (Docker)

## Objetivo

En este laboratorio analizarás tráfico de red a partir de archivos `.pcap` utilizando la herramienta **PcapXray**, ejecutada en un entorno Docker listo para usar.

---

# Requisitos

Antes de comenzar, asegúrate de tener instalado:

* Docker
* Docker Compose

Verifica con:

```bash
docker --version
docker compose version
```

---

# Estructura del proyecto

```
pcapxray-docker/
├── Dockerfile
├── docker-compose.yml
├── start.sh
├── pcaps/
│   ├── (aquí van tus archivos .pcap)
└── README.md
```

---

# Ejecución del laboratorio

## 1. Clonar el repositorio

```bash
git clone <URL_DEL_REPO>
cd pcapxray-docker
```

---

## 2. Colocar archivos PCAP

Copia tus archivos `.pcap` dentro de la carpeta:

```bash
pcaps/
```

Ejemplo:

```
pcaps/
├── laboratorio1.pcap
├── laboratorio2.pcap
```

---

## 3. Levantar el entorno

Ejecuta:

```bash
docker compose up
```

> ⏳ La primera vez puede tardar unos minutos (descarga e instalación)

---

#  Acceso a la herramienta

Una vez iniciado el contenedor, abre tu navegador en:

- http://localhost:6080/vnc.html

---

##  Credenciales

* **Password:** `kali`

---

#  Entorno de trabajo

Al ingresar verás:

* Escritorio Linux (XFCE)
* PcapXray ejecutándose automáticamente

---

#  Ubicación de los archivos PCAP

Dentro del entorno, tus archivos estarán en:

```
/pcaps
```

---

#  Cómo analizar un PCAP

## 1. En PcapXray

* Click en **"Select PCAP File"**
* Navega hasta:

```
/pcaps
```

---

## 2. Selecciona el archivo

Ejemplo:

```
laboratorio1.pcap
```

---

## 3. Ejecuta el análisis

La herramienta generará:

* Gráficos de comunicación
* Relación entre hosts
* Actividad de red

---

# Solución de problemas

## No carga la interfaz

Verifica que Docker esté corriendo:

```bash
docker ps
```

---

## No aparecen archivos PCAP

Asegúrate de que estén en:

```
pcaps/
```

Luego reinicia:

```bash
docker compose down
docker compose up
```

---

## No conecta el navegador

Usa directamente:

- http://localhost:6080/vnc.html

---

# Detener el laboratorio

Presiona:

```bash
Ctrl + C
```

Y ejecuta:

```bash
docker compose down
```

---

# Recomendaciones

* Observa patrones antes de sacar conclusiones
* Relaciona IPs con dominios
* Identifica posibles indicadores de compromiso (IoC)

---

# Resultado esperado

Al finalizar el laboratorio deberás ser capaz de:

* Interpretar tráfico de red
* Identificar actividad sospechosa
* Analizar relaciones entre hosts
* Explicar el comportamiento observado


