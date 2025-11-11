# **EXAMEN U1 MODELADO AVANZADO DE BASE DE DATOS**

![MongoDB](https://img.shields.io/badge/Base%20de%20Datos-NoSQL-green)
![VSCode](https://img.shields.io/badge/Herramienta-VSCode-blue)
![Atlas](https://img.shields.io/badge/Entorno-MongoDB%20Atlas-orange)
![Author](https://img.shields.io/badge/Autor-Pepinós%20Arboleda%20Brian-lightgrey)

---

##  **Autor**

**Nombre completo:** TNTE Pepinós Arboleda Brian  
**Asignatura:** Modelado avanzado de Base de Datos  
**Fecha:** 11 de noviembre del 2025  
**Repositorio de github:** 

https://github.com/BRIANPEPINOS/Modelado-Avanzada-de-BDD/tree/main/Examen_Pepinos_Brian

---

**¿Por qué fue una buena decisión de arquitectura usar MongoDB para los platos en lugar de seguir usando SQL? (Justifique basado en los campos alergenos, tamano_ml, etc.).**

Elegí usar MongoDB para los platos porque me permitió trabajar de forma más flexible con los diferentes tipos de información que tiene cada uno. Por ejemplo, una bebida necesita campos como tamano_ml o es_alcoholica, mientras que un plato fuerte requiere alergenos, y no todos los registros usan los mismos datos. En SQL esto sería complicado porque habría que agregar muchas columnas que en la mayoría de casos quedarían vacías, lo que vuelve a la base de datos menos eficiente.

Además, con MongoDB pude establecer un esquema que valida los campos principales pero también me deja incluir otros opcionales sin generar errores. Esto facilita mucho cuando quiero agregar nuevos tipos de platos o cambiar algunos atributos ya que no tengo que modificar toda la estructura de la base, lo que hace que el sistema sea más flexible y fácil de actualizar.






