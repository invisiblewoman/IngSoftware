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

puts "Creo Universidades"
University.find_or_create_by(nombre: "UNLP",ubicacion: "La Plata")
University.find_or_create_by(nombre: "UBA",ubicacion: "Buenos Aires")

puts "Creo usuarios"
User.create(nombre: "Martin", apellido: "Galan", university_id: 1, email: "martin@mail.com", password: "qweasd")
User.create(nombre: "Luna", apellido: "Galan", university_id: 1, email: "luna@mail.com", password: "qweasd")

puts "Creo Preguntas"
Question.find_or_create_by(titulo: "Como hacer un buen programa", cuerpo: "Quisiera saber como hacer un buen programa de preguntas y respuestas", user_id: 1)
Question.find_or_create_by(titulo: "Comer bien", cuerpo: "Quisiera saber como hacer para comer bien y rico", user_id: 2 )

puts "Creo Respuestas"
Answer.find_or_create_by(texto: "Primero tenes que saber programar, despues hablamos", question_id: 1, user_id: 2 )
Answer.find_or_create_by(texto: "Es facil, instalate java, mirate unos tutoriales y ya esta", question_id: 1, user_id: 2)
Answer.find_or_create_by(texto: "Mira, tenes que ponerte al lado de la mesa y poner cara de cachorrito mojado, les das pena y te dan alto bife", question_id: 2 ,user_id: 1)

puts "Creo etiquetas"
Tag.find_or_create_by(nombre: "Informatica")
Tag.find_or_create_by(nombre: "Ingenieria")
Tag.find_or_create_by(nombre: "Veterinaria")


