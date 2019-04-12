class Car {
    var name:String
    
    init(name:String) {
        self.name = name
//        print("Initalize a car instance with name: \(name)")
    }
    
    deinit {
        print("Deinit a car instance with name \(self.name) ")
    }
}

func f1() {
var tesla = Car(name: "Tesla")
//tesla = nil
}

//f1()
//var tesla:Car? = Car(name: "Tesla")
//tesla = nil
//tesla = nil



class Book {
    let title:String
    let author:Author
    var genre:String?
    var pages:Int = 0
    
    init(title:String, author:Author) {
        self.title = title
        self.author = author
    }
    
    deinit {
        print("Deinit a book instance with title \(self.title) ")
    }
}

class Author {
    let name:String
    //трябва да добавим weak пред пропъртито, за да
    //можем да прекъснем цикъла
    weak var book:Book?
    //var book:Book?
    var age:Int
    var isAlive:Bool
    
    init(name:String, age:Int, isAlive:Bool) {
        self.name = name
        self.age = age
        self.isAlive = isAlive
    }
    
    deinit {
        print("Deinit an Auhtor instance with name \(self.name) ")
    }
}


//var author:Author? = Author(name: "Достоевски",age: 73, isAlive: false)
//
//var book:Book? = Book(title: "53",author:author! )
//
//author!.book = book
////не можем да го прекъснем
////author!.book = nil
//book = nil
//author = nil

//class

var myA = Car(name: "Tesla A 1.0")
var myB = Car(name: "Tesla B 1.0")

let f: () -> () = { [weak myA] in
    print("A = \(myA?.name ?? "???")")
    print("B = \(String(describing: myB.name))")
}


myA.name = "Tesla A 2.0"
myB.name = "Tesla B 2.0"

//f()
//print("A = \(myA)")
//print("B = \(myB)")



class Student {
    let name: String
    var age = 19
    var card:StudentCard?
    
    init(name:String, age:Int) {
        self.name = name
        self.age = age
        print("Init a student instance.")
    }
    
    func printStrudent() {
        print("Name: \(name) ")
        print("Age: \(age) ")
    }
    
    deinit {
        print("deInit a student instance")
    }
}

class StudentCard {
    let university: String
    let number: String
    
    
    //    unowned(unsafe) let student:Student
        unowned let student:Student
//    let student:Student
    
    init(uni:String, number:String, student:Student) {
        university = uni
        self.number = number
        self.student = student
    }
    
    deinit {
        print("deInit a student-card instance - \(self.number)")
    }
}


//var student:Student? = Student(name: "Г. Петров", age: 21)
//
//var studentId:StudentCard? = StudentCard(uni: "СУ св. 'Климент Охридски'", number: "35123", student: student!)
//
//student?.card = studentId
//
//
//studentId = nil
//student = nil


class DataType {
    let name:String
    var properties: Array<String> //[String]
    
    let prettyPrint = true
    
    init(name:String) {
        self.name = name
        properties = []
    }
    
    lazy var toSwift: () -> String = {
        //списъка с променливите в клоужъра ни
        //позволява да упражним допълнителен контрол
                [unowned self, name = self.name] in
        
        var swiftCode:String = "class \(self.name) {"
        
        if self.prettyPrint {
            swiftCode += "\n"
        }
        
        for property in self.properties {
            if self.prettyPrint {
                swiftCode += "\t"
            }
            swiftCode += property
        }
        
        if self.prettyPrint {
            swiftCode += "\n"
        }
        
        swiftCode += "}"
        
        return swiftCode
    }
    
    deinit {
        print("Deinit dataType instance \(self.name)")
    }
}

var data:DataType? = DataType(name: "Student")
data?.properties.append("var name:String = \"Без име\"")
print(data!.toSwift())
data = nil
