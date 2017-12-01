puts "Borro todo lo que hay"
User.destroy_all
Question.destroy_all
Answer.destroy_all
Tag.destroy_all
University.destroy_all
Permiso.destroy_all


puts "Creo Permisos"
Permiso.find_or_create_by(nombre:"Administrar",tipo:"Necesario", cantidad: 5)
Permiso.find_or_create_by(nombre:"Votar",tipo:"Necesario")
Permiso.find_or_create_by(nombre:"Votar",tipo:"Ganancia")
Permiso.find_or_create_by(nombre:"Crear Etiqueta",tipo:"Necesario")
Permiso.find_or_create_by(nombre:"Crear Etiqueta",tipo:"Ganancia")
Permiso.find_or_create_by(nombre:"Crear Facultad",tipo:"Necesario")
Permiso.find_or_create_by(nombre:"Crear Facultad",tipo:"Ganancia")
Permiso.find_or_create_by(nombre:"Eliminar Etiqueta",tipo:"Necesario")
Permiso.find_or_create_by(nombre:"Eliminar Etiqueta",tipo:"Ganancia")
Permiso.find_or_create_by(nombre:"Eliminar Facultad",tipo:"Necesario")
Permiso.find_or_create_by(nombre:"Eliminar Facultad",tipo:"Ganancia")
Permiso.find_or_create_by(nombre:"Editar Pregunta",tipo:"Necesario")
Permiso.find_or_create_by(nombre:"Editar Respuesta",tipo:"Necesario")
Permiso.find_or_create_by(nombre:"Editar Comentario",tipo:"Necesario")
Permiso.find_or_create_by(nombre:"Comentar",tipo:"Ganancia")
Permiso.find_or_create_by(nombre:"Preguntar",tipo:"Ganancia")
Permiso.find_or_create_by(nombre:"Responder",tipo:"Ganancia")
Permiso.find_or_create_by(nombre:"Mejor Respuesta",tipo:"Ganancia")

puts "Creo Universidades"
University.find_or_create_by(nombre: "Ninguna")
University.find_or_create_by(nombre: "Facultad de Ingeniería")
University.find_or_create_by(nombre: "Facultad de Cs. Jurídicas y Sociales")
University.find_or_create_by(nombre: "Facultad de Cs. Médicas")
University.find_or_create_by(nombre: "Facultad de Arquitectura y Urbanismo")
University.find_or_create_by(nombre: "Facultad de Bellas Artes")
University.find_or_create_by(nombre: "Facultad de Cs. Astronómicas y Geofísicas")
University.find_or_create_by(nombre: "Facultad de Cs. Veterinarias")
University.find_or_create_by(nombre: "Facultad de Humanidades y Cs. de la Educación")
University.find_or_create_by(nombre: "Facultad de Informática")
University.find_or_create_by(nombre: "Otra")








puts "Creo etiquetas"
Tag.find_or_create_by(nombre: "Informatica")
Tag.find_or_create_by(nombre: "Ingenieria")
Tag.find_or_create_by(nombre: "Veterinaria")
Tag.find_or_create_by(nombre: "Deporte")
Tag.find_or_create_by(nombre: "Odontologia")
Tag.find_or_create_by(nombre: "Abogacia")
Tag.find_or_create_by(nombre: "Medicina")
Tag.find_or_create_by(nombre: "Psicologia")
Tag.find_or_create_by(nombre: "Matematica")
Tag.find_or_create_by(nombre: "Lengua")
Tag.find_or_create_by(nombre: "Historia")
Tag.find_or_create_by(nombre: "Geografia")
Tag.find_or_create_by(nombre: "Quimica")
Tag.find_or_create_by(nombre: "Biologia")
Tag.find_or_create_by(nombre: "Robotica")

puts "Creo usuarios"
User.create(nombre: "Martin", apellido: "Galan", university_id: 10, email: "martin@mail.com", password: "qweasd", descripcion:"Todo vale la pena si hace reir -LVP", votos: 100000)
User.create(nombre: "Pedro", apellido: "Abba", university_id: 10, email: "abbo@mail.com", password: "qweasd", descripcion:"Madreselva hasta la muerte, Lobos manda La Plata OBDC", votos: 100000)
User.create(nombre: "Charo", apellido: "Ares", university_id: 10, email: "chari@mail.com", password: "qweasd", descripcion:"Pole, comer, dormir, repetir", votos: 100000)

puts "Creo Preguntas"
Question.find_or_create_by(titulo: "¿Para ser genio hay que estar loco?", cuerpo: "Me entro la duda, siempre veo algun genio que esta pirado y quiero saber si voy por buen camino", user_id: 2, university_id: 10, fecha: Time.now )
Question.find_or_create_by(titulo: "¿Como hacer un buen programa?", cuerpo: "Quisiera saber como hacer un buen programa de preguntas y respuestas", user_id: 1, university_id: 7, fecha: Time.now )
Question.find_or_create_by(titulo: "¿Por qué el agua solo arruga pies y manos? ", cuerpo: "Siempre que me baño o voy a una pileta mis dedos se arrguan cual viejo, pero no se a que se debe ese efecto, alguno sabe?", user_id: 3, university_id: 9, fecha: Time.now  )
Question.find_or_create_by(titulo: "¿Cuánto debe durar una buena siesta?", cuerpo: "Siempre duermo banda, pero quiero saber si puedo optimizar ese tiempo y dormir menos sin quitar que sea una buena siesta", user_id: 3, university_id: 8, fecha: Time.now )

puts "Creo Respuestas"
Answer.find_or_create_by(texto: "Primero tenes que saber programar, despues hablamos", question_id: 2, user_id: 2 )
Answer.find_or_create_by(texto: "Es facil, instalate java, mirate unos tutoriales y ya esta", question_id: 2, user_id: 3)
Answer.find_or_create_by(texto: "Pues sí. La evidencia científica vincula a los maniaco-depresivos y bipolares con la creatividad y un alto coeficiente intelectual. Un estudio realizado por expertos del Instituto de Psiquiatría de King`s College de Londres y el Instituto Karolinska en Estocolmo concluye que los estudiantes con calificaciones excelentes mostraron cuatro veces más riesgo de demostrar trastorno bipolar.", question_id: 1 ,user_id: 1, fecha: Time.now )
Answer.find_or_create_by(texto: "Mmmm para mi que tenes que estar medio chifaldo, sino como se te ocurren las tremendas cosas que hacer algunos????", question_id: 1, user_id: 3 , fecha: Time.now )
Answer.find_or_create_by(texto: "Porque allí la dermis y epidermis son más gruesas (están pensadas para apoyar) y absorben más agua. Ambas capas de piel están casi pegadas en estas zonas, y no cabe mucho líquido entre las dos, así que la epidermis se hincha. ", question_id: 3, user_id: 1 , fecha: Time.now )
Answer.find_or_create_by(texto: "Los dedos son como una esponja, absorben y se ponen asi porque tiene mucha agua", question_id: 3, user_id: 2 )

puts "Asocio preguntas y etiquetas"
QuestionTag.find_or_create_by(question_id: 1,tag_id: 14)
QuestionTag.find_or_create_by(question_id: 1,tag_id: 9)
QuestionTag.find_or_create_by(question_id: 2,tag_id: 1)
QuestionTag.find_or_create_by(question_id: 2,tag_id: 2)
QuestionTag.find_or_create_by(question_id: 3,tag_id: 4)
QuestionTag.find_or_create_by(question_id: 3,tag_id: 15)
QuestionTag.find_or_create_by(question_id: 4,tag_id: 14)
QuestionTag.find_or_create_by(question_id: 4,tag_id: 15)

puts "Asocio usuario y etiquetas "
UserTag.find_or_create_by(user_id:1,tag_id:1)
UserTag.find_or_create_by(user_id:1,tag_id:15)
UserTag.find_or_create_by(user_id:2,tag_id:2)
UserTag.find_or_create_by(user_id:2,tag_id:9)
UserTag.find_or_create_by(user_id:3,tag_id:4)
UserTag.find_or_create_by(user_id:3,tag_id:14)