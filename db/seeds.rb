# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Borro todo lo que hay"
User.destroy_all
Question.destroy_all
Answer.destroy_all
Tag.destroy_all
University.destroy_all
Permiso.destroy_all


puts "Creo Permisos"
Permiso.find_or_create_by(nombre:"Administrar",tipo:"Necesario")
Permiso.find_or_create_by(nombre:"Votar",tipo:"Necesario")
Permiso.find_or_create_by(nombre:"Votar",tipo:"Ganancia")
Permiso.find_or_create_by(nombre:"Crear Etiqueta",tipo:"Necesario")
Permiso.find_or_create_by(nombre:"Crear Etiqueta",tipo:"Ganancia")
Permiso.find_or_create_by(nombre:"Crear Facultad",tipo:"Necesario")
Permiso.find_or_create_by(nombre:"Crear Facultad",tipo:"Ganancia")
Permiso.find_or_create_by(nombre:"Eliminar Etiqueta",tipo:"Necesario")
Permiso.find_or_create_by(nombre:"Eliminar Etiqueta",tipo:"Ganancia")
Permiso.find_or_create_by(nombre:"Eliminar Etiqueta",tipo:"Necesario")
Permiso.find_or_create_by(nombre:"Eliminar Facultad",tipo:"Ganancia")
Permiso.find_or_create_by(nombre:"Editar Pregunta",tipo:"Necesario")
Permiso.find_or_create_by(nombre:"Editar Respuesta",tipo:"Necesario")
Permiso.find_or_create_by(nombre:"Editar Comentario",tipo:"Necesario")
Permiso.find_or_create_by(nombre:"Comentar",tipo:"Ganancia")
Permiso.find_or_create_by(nombre:"Preguntar",tipo:"Ganancia")
Permiso.find_or_create_by(nombre:"Responder",tipo:"Ganancia")
Permiso.find_or_create_by(nombre:"Mejor Respuesta",tipo:"Ganancia")

