femi = Owner.create(username: "Obafemi", password: "password", name: "femi")
harry_potter = Book.create(title: "Harry Potter", author: "JK Rowling", genre: "Fantasy", summary: "Magic Stuff")
harry_potter.owner_id = femi.id
harry_potter.save
percy_jackson = Book.create(title: "Percy Jackson", author: "Rick Riordan", genre: "Fantasy", summary: "Greek Stuff")
percy_jackson.owner_id = femi.id
percy_jackson.save

engst = Owner.create(username: "Clara Engst", password: "password", name: "engst")
white_teeth = Book.create(title: "White Teeth", author: "Zadie Smith", genre: "Fiction", summary: "Random Chance")
middlesex = Book.create(title: "Middlesex", author: "Jeffrey Eugenides", genre: "Fantasy", summary: "Generational Swag")
white_teeth.owner_id = engst.id
middlesex.owner_id = engst.id
white_teeth.save
middlesex.save
