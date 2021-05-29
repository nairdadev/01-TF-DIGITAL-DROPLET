 **Creación de droplet en Digital Ocean con terraform**

**Primer paso:** Descargar/instalar Terraform desde la  [Web de Terraform](https://www.terraform.io/)

**Segundo paso:** Genera Api key de Digital Ocean esto se encuentra en: account -> api, ahí presionar el botón que dice "Generate new Token" 

**Tercer paso:** Crear carpeta de Terraform en donde estarán los archivos.

**Cuarto paso:** Generar el archivo main.tf

**Estructura de archivo main.tf**
__________________
    #Provider - Digital Ocean
    terraform {
    required_providers {
		    digitalocean = {
			    source = "digitalocean/digitalocean"
			    version = "2.9.0"
						    }
						}
			    }

En este archivo está indicando que el provider que vamos a usar es Digital Ocean, se puede hacer con AWS, Azure (ver documentación de terraform)
__________________
    #Variable 
    variable token_do {
    type = string
    description = "Token de Digital Ocean"
    }

Si queremos usar una variable de entorno en nuestra pc en consola tipear:

    export TF_VAR_token_do=""
__________________
En esta parte le estamos diciendo que vamos a utilizar una variable que va a ser el token que se generó en el paso 2 (es para 'securizar' y no exponer apis)

    #Pass provider
    provider "digitalocean" {
    token = var.token_do
    }

Se está pasando el token para genera autenticación
__________________
    #Droplet
    resource "digitalocean_droplet" "web" {
    image = "ubuntu-20-04-x64"
    name = "NOMBREDROPLET"
    region = "nyc1"
    size = "s-1vcpu-1gb"
    }

acá se crea el droplet, se asigna una imagen, un nombre, la región en donde se va a crear y el tamaño

Para ver tamaños disponibles de droplet: [listado de tamaños y regiones](https://developers.digitalocean.com/documentation/v2/#list-all-regions)
__________________
**Comandos Terraform:**

**terraform init:** descarga el provider que configuramos. 

**terraform plan:** nos muestra que se va a crear

**terraform apply:** Ejecuta proceso de creación 

**terraform destroy:** Borra el droplet creado
