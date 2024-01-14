#Práctica para el módulo Fundamentos iOS de Keepcoding.

En esta práctica desarrollo una app con lenguaje swift bajo el patrón de diseño MVC (Model View Controller). Para su elaboración se consumido la API de Dragon Ball para realizar llamadas de red.

![Simulator Screenshot - iPhone 15 - 2024-01-14 at 17 33 14](https://github.com/agavgar/Practica_FundIOS_AGGA/assets/98350985/373894a8-9589-4f01-8451-da41266570b9)
![Simulator Screenshot - iPhone 15 - 2024-01-14 at 17 33 31](https://github.com/agavgar/Practica_FundIOS_AGGA/assets/98350985/eee10345-a86a-4bac-945f-6d5b59c9200c)
![Simulator Screenshot - iPhone 15 - 2024-01-14 at 17 33 38](https://github.com/agavgar/Practica_FundIOS_AGGA/assets/98350985/83a49db2-a970-4f5b-8c7d-25fa7de409fd)
![Simulator Screenshot - iPhone 15 - 2024-01-14 at 17 33 48](https://github.com/agavgar/Practica_FundIOS_AGGA/assets/98350985/223c2668-7e0c-4de0-8b75-4469de96d61d)
![Simulator Screenshot - iPhone 15 - 2024-01-14 at 17 33 52](https://github.com/agavgar/Practica_FundIOS_AGGA/assets/98350985/4f6a2550-d3a7-410a-8027-c1ffd17d8fa9)
![Simulator Screenshot - iPhone 15 - 2024-01-14 at 17 33 58](https://github.com/agavgar/Practica_FundIOS_AGGA/assets/98350985/55398e18-0edc-4e50-834a-517f2b840a90)


Breve descripción

Es una app focalizada en Dragon Ball. Ya que su historia tiene muchos personajes interesantes, esta app nos muestra una lista de muchos personajes y sus numerosas transformaciones. Todo ello haciendo un login en un servidor primero, donde ingresaremos nuestro usuario y contraseña lo que nos da un token de verificacion el cual podremos usar para extraer datos de la API. Seleccionaremos el personaje que queramos y podremos ver su información y en caso de poder transformarse, podremos verlo en una lista.

Guía de instalación

Simplemente debemos descargarnos el prouyecto en ZIP o en HTTP y clonar el repositorio. Luego ejecutar el archivo del proyecto de xCode y con pulsar al play tendremos la aplicación funcionando. Solo usuarios con MAC y xCode instalado.

Experiencia

El proyecto ha sido el primer reto con más dificultad del curso, nos hemos tenido que pegar por primera vez con el entorno de xCode y moviendonos por medio de Xib, lo que acelera mucho la aplicación y su desarrollo. Creacion del protocolo de APIClient asi como el Network Model cuyo objetivo es hacer las llamadas a la API con lo necesario para poder llamar con una funcion en el momentoi requerido. He tenido la posibilidad de hacer el trabajo solo con UITableViewController pero como reto personal he querido realizarlo usando los dos tipos de tablas que tenemos en mópvil, usando Collections y Tablas. Lo demás es azucar sintáctico y mucho cariño!

Autor

El proyecto solo ha sido realizado por mi, Alejandro Gavira García. Siguiendo las pautas establecidas en cada una de las clases impartidas a lo largo del módulo, además, por mi cuenta, he buscado información en diversos lugares y plataformas.
