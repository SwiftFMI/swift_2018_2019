func sum(a: Int, b:Int) -> Int {
    
    func t(x: Int) {
        print("T = \(a)")
    }
    
    let fn17: (Int) -> Int = {
        $0 * 2
    }
    fn17(17)
    
//    t(x: 17)
    
    return a + b
}

//t(a:17)
func myPrint(v:String) {
    
}

let fn: (Int, Int) -> Int = sum

let fn2: (String) -> Void = myPrint
let fn21: (String) -> () = myPrint


print(fn(3, 5))


func op(op: String) -> (Int, Int) -> Int {
   return sum
}


//print(op(op:"dljsalkdsajl")(3, 5))




//////////////

func trailingClosure(i:Int, predicate: (Int)->Bool) {
    print("Проверка за \(i)")
    if predicate(i) {
        print("Предикатът е удволетворен.")
    }
}

//(Int, (Int) -> Bool) -> ()

//func even(_ x:Int) -> Bool {
//    return x % 2 == 0
//}
//
//trailingClosure(i: 1, predicate: even)
//
//trailingClosure(i: 1, predicate: { (a) -> Bool in
//    return a % 2 == 0
//})
//
//trailingClosure(i: 2) { (a) -> Bool in
//    return a % 2 == 0
//}
//
////клоужърът е последен параметър, затова се подава като блок код след извикване на функцията
//trailingClosure(i: 4) { (a) in
//    return a % 2 == 0
//}
//
////съкратен вид
//trailingClosure(i: 4) { (a) in
//    //без return понеже имаме само един ред
//    a % 2 == 0
//}
//
////подразбиращи се имена на параметрите
////кодът е къс, но трудно разбираем за всички
//trailingClosure(i: 8) {
//    //използваме автоматичното име, за да достъпим първия аргумент на клоужъра
//    $0 % 2 == 0
//}
//
//
//let names = ["aaa", "ccc", "bbb"]
////сортиране
//print(names.sorted(by: { $0 > $1 }))
//print(names.sorted() { $0 > $1 })
////сортираме, като подаваме функция от тип (String, String) -> Bool ( т.е. оператор за сравнение)
//print(names.sorted(by: <))


//////////


//func createGen(start: Int, modify: @escaping (Int) -> Int ) -> ()->(Int) {
//
//    var myStart = start
//
//    return {
//        myStart = modify(myStart)
//        return myStart
//    }
//
//}
//
//var next = createGen(start: 0) {
//    $0 + 1
//}
//
//print(next()) //2
//print(next()) //4
//print(next()) //6
//print(next()) //8


//var handlers:[()->Void] = []
////трябва да добавим атрибута @escaping иначе няма да се компилира
//func escapingClosure(f: @escaping ()->Void) {
//    print("Parent function start")
//    handlers.append(f)
//    print("Parent function end")
//}
//
//handlers.append {
//    print("test")
//}
//print("line 128")
//escapingClosure {
//    print("test 2")
//}
//
////активираме всички функции
//for f in handlers {
//    f()
//}


func funcAutoclosure(pred: @autoclosure () -> Bool) {
    print("before")
    if pred() {
        print("It's true")
    } else {
        print("It's NОТ true")
    }
}


let x:Bool = { () -> Bool in
    print("X in the closure")
    return 2 > 1}()


funcAutoclosure(pred: 11 > 12)

funcAutoclosure(pred: { () -> Bool in
    print("in the closure")
    return 2 > 1}())

//допълнителен пример
func funcAutoclosureComplex(pred: @autoclosure () -> ()) {
    print("body of \(#function)")
}
