femi = Owner.create(username: "Obafemi", password: "password", name: "femi")
harry_potter = Book.create(title: "Harry Potter", author: "JK Rowling", genre: "Fantasy", summary: "Magic Stuff")
harry_potter.owner_id = femi.id
harry_potter.save
percy_jackson = Book.create(title: "Percy Jackson", author: "Rick Riordan", genre: "Fantasy", summary: "Greek Stuff")
percy_jackson.owner_id = femi.id
percy_jackson.save

remi = Owner.create(username: "Obaremi", password: "password", name: "remi")
harry_potter_2 = Book.create(title: "Harry Potter_2", author: "JK Rowling", genre: "Fantasy", summary: "Magic Stuff")
percy_jackson_2 = Book.create(title: "Percy Jackson_2", author: "Rick Riordan", genre: "Fantasy", summary: "Greek Stuff")
harry_potter_2.owner_id = remi.id
percy_jackson_2.owner_id = remi.id
harry_potter_2.save
percy_jackson_2.save
