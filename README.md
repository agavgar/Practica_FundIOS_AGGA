**Práctica para el módulo Fundamentos iOS de Keepcoding.**

En esta práctica desarrollo una app con lenguaje swift bajo el patrón de diseño MVC (Model View Controller). Para su elaboración se consumido la API de Dragon Ball para realizar llamadas de red.

![Simulator Screenshot - iPhone 15 - 2024-01-14 at 17 33](https://github.com/agavgar/Practica_FundIOS_AGGA/assets/98350985/50267459-8f0a-44a1-b32d-c35f1c291af4)
![Simulator Screenshot - iPhone 15 - 2024-01-14 at 17 33-2](https://github.com/agavgar/Practica_FundIOS_AGGA/assets/98350985/ce2f0867-5051-49ba-8682-e8cb3247a4bd)
![Simulator Screenshot - iPhone 15 - 2024-01-14 at 17 33-6](https://github.com/agavgar/Practica_FundIOS_AGGA/assets/98350985/1c6238c8-352b-4ffa-a907-c96a3253d1ce)
![Simulator Screenshot - iPhone 15 - 2024-01-14 at 17 33-4](https://github.com/agavgar/Practica_FundIOS_AGGA/assets/98350985/801cd045-ee37-480d-83ca-15cde52562e4)
![Simulator Screenshot - iPhone 15 - 2024-01-14 at 17 33-3](https://github.com/agavgar/Practica_FundIOS_AGGA/assets/98350985/e98983e1-3f4d-4778-931f-b2e89fd6ac0c)
![Simulator Screenshot - iPhone 15 - 2024-01-14 at 17 33-5](https://github.com/agavgar/Practica_FundIOS_AGGA/assets/98350985/a0457d0c-0f1c-4a1e-9959-cd225a672f1e)

**Breve descripción**

Es una app focalizada en Dragon Ball. Ya que su historia tiene muchos personajes interesantes, esta app nos muestra una lista de muchos personajes y sus numerosas transformaciones. Todo ello haciendo un login en un servidor primero, donde ingresaremos nuestro usuario y contraseña lo que nos da un token de verificacion el cual podremos usar para extraer datos de la API. Seleccionaremos el personaje que queramos y podremos ver su información y en caso de poder transformarse, podremos verlo en una lista.

**Guía de instalación**

Simplemente debemos descargarnos el prouyecto en ZIP o en HTTP y clonar el repositorio. Luego ejecutar el archivo del proyecto de xCode y con pulsar al play tendremos la aplicación funcionando. Solo usuarios con MAC y xCode instalado.

**Experiencia**

El proyecto ha sido el primer reto con más dificultad del curso, nos hemos tenido que pegar por primera vez con el entorno de xCode y moviendonos por medio de Xib, lo que acelera mucho la aplicación y su desarrollo. Creacion del protocolo de APIClient asi como el Network Model cuyo objetivo es hacer las llamadas a la API con lo necesario para poder llamar con una funcion en el momentoi requerido. He tenido la posibilidad de hacer el trabajo solo con UITableViewController pero como reto personal he querido realizarlo usando los dos tipos de tablas que tenemos en mópvil, usando Collections y Tablas. Lo demás es azucar sintáctico y mucho cariño!
