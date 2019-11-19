import MongoSwift

let client = try MongoClient("mongodb://localhost:27017")
let db = client.db("StoresDB")
let booksStores = db.collection("BooksStores")
let gamesStores = db.collection("GamesStores")

var option = 10
while option != 0 {
    print(" ","Выберите действите","1. Добавить книжный магазин", "2. Добавить магазин видеоигр", "3. Посмотреть все книжные магазины", "4. Посмотреть книжные магазины в конкретном городе", "5. Посмотреть все магазины видеоигр", "6. Посмотреть магазины видеоигр в конкретном городе", "7. Посмотреть все магазины в конкретном городе", "0. Для выхода из программы", separator: "\n")
    option = Int(readLine()!) ?? 15
    switch option {
        
    case 1:
        print("Введите адрес")
        let address = readLine()
        print("Введите город")
        let city = readLine()
        print("Введите статус магазина")
        let status = readLine()
        print("Введите режим работы")
        let workHours = readLine()
        
        let newBookStore: Document = ["Адрес": address!, "Город": city!, "Статус": status!, "Режим работы": workHours!]
        
        try booksStores.insertOne(newBookStore)
        
    case 2:
        print("Введите адрес")
        let address = readLine()
        print("Введите город")
        let city = readLine()
        print("Введите статус магазина")
        let status = readLine()
        print("Введите режим работы")
        let workHours = readLine()
        
        let newGameStore: Document = ["Адрес": address!, "Город": city!, "Статус": status!, "Режим работы": workHours!]
        
        try gamesStores.insertOne(newGameStore)
        
    case 3:
        let stores = try booksStores.find()
        for s in stores {
            print(s)
        }
        
    case 4:
        print("Введите город")
        let neededCity = readLine()
        let city: Document = ["Город": neededCity!]
        let stores = try booksStores.find(city)
        for s in stores {
            print(s)
        }
        
    case 5:
        let stores = try gamesStores.find()
        for s in stores {
            print(s)
        }
        
    case 6:
        print("Введите город")
        let neededCity = readLine()
        let city: Document = ["Город": neededCity!]
        let stores = try gamesStores.find(city)
        for s in stores {
            print(s)
        }
        
    case 7:
        print("Введите город")
        let neededCity = readLine()
        let citi: Document = ["Город": neededCity!]
        let foundBooksStores = try booksStores.find(citi)
        let foundGamesStores = try gamesStores.find(citi)
        print("Книжные магазины:")
        for s in foundBooksStores {
            print(s)
        }
        print("Магазины игр:")
        for s in foundGamesStores {
            print(s)
        }
        
    case 15:
        print("Вы неверно ввели число. Попробуйте еще раз")
        
    default:
        break
    }
}

