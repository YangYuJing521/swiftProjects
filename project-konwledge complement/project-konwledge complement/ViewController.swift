//
//  ViewController.swift
//  project-konwledge complement
//
//  Created by 杨玉京 on 2019/10/10.
//  Copyright © 2019 杨玉京. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // MARK: -1.基本语法
        /*
         let 用于定义常量，定义完后不能修改。
         var 用于定义变量，可以修改。
         swift可以自动识别属性类别。
         */
        
//       var stringM = String()
//       let string: String = "hello world"
//       let subsequesce  = string.split(separator: " ")
//       print(subsequesce)
        
        extensionFunc()
        
    }
}

extension ViewController{
    // MARK: -数组
    fileprivate func shuZu(){
        ///创建数组
        //创建某一类型的含有n个初始元素的数组
        var array1 = [Int](repeating: 5, count: 3)
        //创建某一类型空数组
        var array2 = [Int]()
        //创建某一类型的任意数量数组
        var array3: [Any] = ["1", 2, "3"]
        
        ///替换元素
        array1[2] = 6
        print("array1:\(array1)")
        
        ///拼接元素
        array2.append(1);
        array3.append(4)
        print("array2:\(String(describing: array2))\narray3:\(array3)")
        
        ///拼接数组
        let sumArray = array1+array3
        print("sumArray:\(sumArray)")
        print("sumArray长度：\(sumArray.count)")
    }
    
    // MARK: -字典
    fileprivate func ziDian(){
        ///创建字典
        //创建空字典
        var dic1 = [String: String]()
        //有初始值的字典
        var dic2: [Int: Any] = [1:1, 2:"2", 3:"oldValue"]
        
        ///修改字典
        //通过指定的 key 来修改字典的值
        dic1["key1"] = "value1"
        dic1["key2"] = "value2"
        dic1["key3"] = "value3"
        print("dic1:\(dic1)")
        //使用 updateValue(forKey:) 增加或更新字典的内容。如果 key 不存在，则添加值，如果存在则修改 key 对应的值,  方法返回Optional值
        if let oldValue = dic2.updateValue("3", forKey: 3){
            print("dic2 oldValue: \(oldValue)")
        }
        dic2.updateValue("four", forKey: 4)
        print("dic2:\(dic2)")
        
        print("-----remove------")
        ///移除 Key-Value 对
        //通过制定key
        dic1["key1"] = nil
        print(dic1)
        //使用 removeValueForKey() 方法来移除字典 key-value 对。如果 key 存在该方法返回移除的值，如果不存在返回 nil
        if let removedValue = dic1.removeValue(forKey: "key2") {
            print("dic1 removedValue:\(removedValue)")
        }
        print(dic1)

        
        print("-----遍历------")
        ///遍历字典
        for (key, value) in dic2 {
            print("字典 key \(key) -  字典 value \(value)")
        }
        //使用enumerate()方法来进行字典遍历，返回的是字典的索引及 (key, value)
        for (key, value) in dic2.enumerated() {
                print("字典 index: \(key) -  字典 (key, value) : \(value)")
        }
        
        print("------other------")
        ///字典转数组
        let keys = [Int](dic2.keys)
        print(keys)
        let values = dic2.values
        print(values)
        //打印键值对数量
        print(dic2.count)
        //打印是否为空键值对
        print(dic2.isEmpty)
        
    }
    
    // MARK: -枚举
    fileprivate func meiJu(){
                
        enum weekDays{
            case Monday
            case Tuesday
            case Wensday
            case Thursday
            case Friday
            case Saterday
            case Sunday
        }
        
        enum weekDaysTwo{
            case Monday,Tuesday,Wensday,Thursday,Friday,Saterday,Sunday
        }
        
        var day = weekDays.Monday
        day = .Friday
        var day2: weekDays = .Tuesday
        
        switch day {
        case .Monday:
            print("星期一")
        case .Friday:
            print("星期五")
        default:
            print("其它")
        }
        
        
        ///相关值
        enum Student{
            case Name(String)
            case Mark(Int,Int,Int)
        }
        
        let stu = Student.Name("Jason")
        let marks = Student.Mark(70, 80, 90)
        switch marks {
        case .Name(let stuName):
            print(stuName)
        case .Mark(let mark1, let mark2, let mark3):
            print(mark1,mark2,mark3)
        default:
            print("")
        }
        
        ///原始值
        enum Month: Int{
            case January = 1,February,March,April,May,June,July,Auguset,September,October,November,December
        }
        
        let month = Month.January.rawValue
        print(month)
    }
    
    // MARK: -闭包
    fileprivate func biBao(){
        /// 闭包的基本语法
//        {(parameters) -> returnType in
//            statements
//        }
        
        //()->() 闭包
        let prin = {print("这是一个闭包")}
//        let prin: () -> () = {print("这是一个闭包")}
        prin()
        
        ///接受并返回参数
        // 第一种写法
        let divide = {(val1: Int, val2: Int) -> Int in
            return val1/val2
        }
        let result = divide(200,10)
        print(result)

        //第二种写法
        var divideJian: (Int, Int) -> Int = {(val1: Int, val2: Int) -> Int in
            return val1/val2
        }
        let result2 = divideJian(200,20)
        print(result2)
        //简化1： 类型自动推导 可以根据参数推断 只有一行可以不写return
        divideJian = {(val1, val2) in
            val1/val2
        }
        let result3 = divideJian(200,20)
        print(result3)
        //简化2： $可以取参数列表中的的参数 $0对应第一个，以此类推
        divideJian = {$0/$1}
        let result4 = divideJian(200,20)
        print(result4)

        ///尾随闭包( 闭包作为函数的参数 )
         func PlusNumbersDescription(num1: Int, num2: Int, description: (Int, Int) -> String) {
            let result = description(num1,num2)
            print("description返回的内容是:\(result)")
        }

        // 以下是不使用尾随闭包进行函数调用
        let 定义好的闭包: (Int, Int) -> String = {
            print("执行定义好的闭包")
            return  "\($0) + \($1) = \($0 + $1)"
        }
        PlusNumbersDescription(num1: 4, num2: 4, description: 定义好的闭包)
        
        // 以下是使用尾随闭包进行函数调用 (敲回车的方式)
        PlusNumbersDescription(num1: 5, num2: 5) { (a, b) -> String in
            print("执行尾随闭包1")
            return  "\(a) + \(b) = \(a + b)"
        }
        //或者
        PlusNumbersDescription(num1: 6, num2: 6) {
            print("执行尾随闭包2")
            return  "\($0) + \($1) = \($0 + $1)"
        }
        
        ///捕获
        /*
        由于闭包定义和变量counter在同一作用域中，
        故闭包可以根据上下文语境捕获并访问变量counter。
        对变量counter做的任何改变，对闭包来说都是透明可见的。
        */
        var count: Int = 0
        
        let increaseCounter = {() -> Int in
            count += 1
            return count
        }
        print(increaseCounter())  //1
        print(increaseCounter())  //2
        print(increaseCounter())  //3
        /*
         函数和闭包都是引用类型
         无论您将函数/闭包赋值给一个常量还是变量，实际上都是将常量/变量的值设置为对应函数/闭包的引用
         上面的例子中，increaseCounter指向闭包的引用是一个常量，而并非闭包内容本身。
         意味着如果您将闭包赋值给了两个不同的常量/变量，两个值都会指向同一个闭包
         */
        func makeIncreasementor(forIncreasement amount: Int) -> () -> Int{
            var counter: Int = 0
            let increase = {() -> Int in
                 counter += amount
                return counter
            }
            return increase
        }
        let counter1 = makeIncreasementor(forIncreasement: 10)
        print(counter1())   //10
        print(counter1())   //20
        print(counter1())   //30
        print(counter1())   //40
        //将一个闭包赋值给了两个不同的常量/变量，两个值都会指向同一个闭包：
        let counter3 = counter1
        print(counter3())   //50
        print(counter1())   //60
        print(counter3())   //70
        //不同的闭包空间（函数实体内）变量各自独立
        let counter2 = makeIncreasementor(forIncreasement: 5)
        print(counter2())   //5
        print(counter2())   //10
        print(counter2())   //15


        
        /// 闭包表达式
        /// sorted
        let mixArray = [3,6,1,6,2,10];
        let mixArray2 = ["BB", "DDD", "A", "CCCC"];
        let sorted1 = mixArray.sorted()    //系统默认排序规则对整数数组排序
        let sorted2 = mixArray2.sorted()   //系统默认排序规则对字符数组排序
        print(sorted1)
        print(sorted2)
        
        let sortedClosure: (String, String) -> Bool = {$0.count > $1.count} //自定义闭包 定义排序规则
        let sorted3 = mixArray2.sorted(by: sortedClosure)   //非尾随闭包的方式
        let sorted4 = mixArray2.sorted { (a, b) -> Bool in  //尾随闭包的方式
            a.count<b.count
        }
//        var sorted4 = names.sorted( by: { $0 > $1 } )
//        var sorted4 = names.sorted(by: >)      //运算符函数的方式
        print(sorted3)
        print(sorted4)
        
        //forEach 快速遍历
        mixArray2.forEach { (str) in
            print(str)
        }
        
        //filter
        let filtedArray = mixArray.filter { (item) -> Bool in
            item>2
        }
        print(filtedArray)
        
        let array = ["mike", "jason", "kit", "luckey"]
        //map flatMap
        let mapdArray = array.map { $0.count }
        print(mapdArray)
        
        }
    
    // MARK: -函数
    fileprivate func HanShu(){
        
        /// 返回值为元组
        func getMaxAndMinValueFrom(array nums:  [Int]) -> (Max: Int, Min: Int)?{
            var MinValue: Int = nums[0]
            var MaxValue: Int = nums[0]
            for value in nums[0..<nums.count] {
                if MinValue > value {
                    MinValue = value
                }else if MaxValue < value {
                    MaxValue = value
                }
            }
            return (MaxValue, MinValue)
        }
        
        let numsArray = [1,2,3,4,5,6,7,8]
        if let result = getMaxAndMinValueFrom(array: numsArray) {
//            print("maxValue:\(result.Max), minValue:\(result.Min)")
        }
        
        ///可变参数
        func varaableParameters<T>(array: T...){
            for item in array {
                print(item)
            }
        }
        func vareableParas(numbers: Int...){
            var result = 0;
            for item in numbers {
                result += item
            }
            print(result)
        }
//        varaableParameters(array: 3,4,5,6)
//        varaableParameters(array: "hello","world")
//        vareableParas(numbers: 5,5,5,5)
        
        /// IO 控制
        func swapTwoNumbers(_ a: inout Int, _ b: inout Int){
            let temporaryA = a
            a = b
            b = temporaryA
        }
        var x = 5
        var y = 6
        swapTwoNumbers(&x, &y)
//        print("x:\(x)  y:\(y)")

        
        func mergeString(_ string: inout String){
            string += "拼接了一段字符串。"
        }
        var string = "待拼接的字符串,"
        mergeString(&string)
//        print(string)
        
        /// 函数类型
        func SumWithTwoNumber(num1: Int, num2: Int){
            let result = num1 + num2
//            print(result)
        }
        // 函数类型
        let sumFunc: (Int, Int) -> Void = SumWithTwoNumber(num1:num2:)
        sumFunc(10, 20)
            
        func DealWithFuncAndParameter(functon: (Int, Int) -> Void, num1: Int, Num2: Int){
            functon(num1, Num2)
        }
        DealWithFuncAndParameter(functon: sumFunc, num1: 20, Num2: 30)
        
        ///函数嵌套
        func functionReturnFuncton(_ num1: Int, _ num2: Int) -> (Int) -> Int{
            let plus = num1 + num2
            func realPlusNumber(num: Int) -> Int{
                return plus * num1 * num2 * num
            }
            return realPlusNumber(num:)
        }
        let functon1 = functionReturnFuncton(10, 10)
        print(functon1(5))
                
        func FuncReturnBiBao(_ num1: Int, _ num2: Int) -> (Int) -> Int{
            let plus = num1 + num2
            let biBao: (Int) -> Int = {number in
                number * plus * num1 * num2
            }
            return biBao
        }
        let function2 = FuncReturnBiBao(10, 10)
        print(function2(5))

    }
    
    // MARK: -结构体
    fileprivate func jieGouTi(){
        //
        struct Student{
            //加入static关键字 只能通过Student直接获取
            static let name = "Mike"
            var height = 188
            var score = 88
            private static let habitDescript = "\(name)喜欢" //只能struct 内部使用
            public var habit = "\(Student.habitDescript)排球"
        }
        let stu = Student()
        print(Student.name, stu.height, stu.score, stu.habit)
        
        // clone
        struct Mark{
            var mark: Int
            init(mark: Int) {
                self.mark = mark
            }
        }
        let mark1 = Mark(mark: 90)
        var mark2 = mark1 //克隆一个
        mark2.mark = 100;
        print(mark1.mark, mark2.mark)
        
        //应用
        struct Marks{
            var math: Int
            var english: Int
            var chinese: Int
            init(math: Int, english: Int, chinese: Int) {
                self.math = math
                self.english = english
                self.chinese = chinese
            }
        }
        let stuMark1 = Marks(math: 90, english: 92, chinese: 98)
        let stuMark2 = Marks(math: 80, english: 87, chinese: 90)
        print(stuMark1.math, stuMark1.english, stuMark1.chinese)
        print(stuMark2.math, stuMark2.english, stuMark2.chinese)
        
    }
    
    // MARK: -类
    fileprivate func Lei(){
        let spClass1 = sampleClass(string: "123456")
        let spClass2 = spClass1
        spClass2.myPropority = "hello"
        
        if spClass1 === spClass2 {// false
            print("引用相同的类实例 \(spClass1)")
        }

        if spClass1 !== spClass2 {// true
            print("引用不相同的类实例 \(spClass2)")
        }
    }
    
    // MARK: -lazy
    fileprivate func lazyLoad(){
        let sam = Samber()
        print(sam.des.descript)
    }
    
    // MARK: -calculation trait
    fileprivate func calcultrait(){
        let cal = CalculateP()
        print(cal.middle)
        cal.middle = (100.0, 100.0)
        print(cal.x, cal.y)
    }
    
    // MARK: -只读计算属性
    fileprivate func readOnlyCal(){
        let classC = readOnlyCalTrait()
        classC.name = "Jack"
        classC.height = 180
        print(classC.Description["name"]!, classC.Description["height"]!)
    }

    // MARK: -属性观察器
    fileprivate func traitObseFunc(){
        let obser = TraitObser()
        obser.counter = 100
        obser.counter = 500
    }
    
    // MARK: -修改值类型
    fileprivate func changeValueType(){
        struct areaStr{
            var length = 1
            var breadth = 1
            
            //mutating 关键词的函数才能修改值类型struct/enume 里面的值
            mutating func scaleBy(res: Int){
                length *= res
                breadth *= res
                print(length)
                print(breadth)
            }
        }
        
        var are = areaStr()
        are.scaleBy(res: 3)
    }
    
    // MARK: -类型方法
    fileprivate func leiXingMethod(){
        let abs1 = Math.absNumber(num: -90)
        let abs2 = Math2.absNum(num: -80)
        print(abs1, abs2)
    }

    // MARK: -下标脚本
    fileprivate func xiaBiaoFunc(){
        let p = DaysOfAWeek()
        p[1] = "Mon-Day"
        print(p[0], p[1])
    }
    
    // MARK: -下标脚本选项
    fileprivate func xiaBiaoBenXuanFunc(){
        var mat = Matrix(row: 3, col: 3)  //3行3列
        mat[0,0] = 1.0
        mat[0,1] = 2.0
        mat[1,0] = 3.0
        mat[1,1] = 4.0
        print(mat[0,0])
        print(mat[0,1])
        print(mat[1,0])
        print(mat[1,1])

    }
    
    // MARK: -重修属性
    fileprivate func overRideProportys(){
        let father = Father()
        father.height = 170.0
        father.weight = 70.0
        print(father.bodyDescript)
        
        let son = Son()
        son.height = 190.0
        print(son.bodyDescript)
    }
    
    // MARK: -构造函数
    fileprivate func gouZaoFunc(){
        let color1 = Color(red: 0.8, green: 0.8, blue: 0.8)
        print(color1.red)
        let color2 = Color(RGBPercentage: 0.5)
        print(color2.red)
        let color3 = Color(0.7, 0.7, 0.7)
        print(color3.red)
        ///逐一成员构造器
        let zhuYi = zhuYiStruct(length: 24.0, width: 40.0)
        print(zhuYi.width)
        ///指定、便利构造器
        let mainC = MainClass(no1: 10)
        print(mainC.no1)
        let subC = SubClass(no1: 20, no2: 30)
        print(subC.no1, subC.no2)
        let subC2 = SubClass(no1: 40)//便利
        print(subC2.no1, subC2.no2)
        ///结构体可失败构造器
        let animal = Animal(animal: "大熊猫")
        if let jieBangAnimal = animal {
            print(jieBangAnimal.fauna)
        }
        ///枚举类型的可失败构造器
        let dateE = DateEnume(character: "S")
        if let JieBangE = dateE {
            print(JieBangE)
        }else{
            print("初始化失败")
        }
        ///类的可失败构造器
        let GouFail = GouFailClass(failR: "不小心")
        if let jieDongFail = GouFail {
            print(jieDongFail.failReason)
        }else{
            print("类初始化失败")
        }
    }
    
    // MARK: -析构函数
    fileprivate func xiGouFunc(){
        var xiGou: BaseClass? = BaseClass()
        print(counter)
        // 当 xiGou = nil 语句执行后，计算器减去 1，show 占用的内存就会释放。
        xiGou = nil
        print(counter)
    }
    
    // MARK: -可选链
    fileprivate func keXuanChain(){
        let john = Person()
        let johnsHouse = Residence()
        johnsHouse.roms.append(Room(name: "客厅"))
        johnsHouse.roms.append(Room(name: "厨房"))
        john.residence = johnsHouse

        let johnsAddress = Address()
        johnsAddress.buildingName = "The Larches"
        johnsAddress.street = "Laurel Street"
        john.residence!.address = johnsAddress

        //可选链访问属性
        if let johnsStreet = john.residence?.address?.street {
            print("John 所在的街道是 \(johnsStreet)。")
        } else {
            print("无法检索到地址。 ")
        }
        //访问方法
        john.residence?.printNumberOfRooms()

        //访问下标脚本
        //        let rom = Room(name: "haha")
        //        john.residence?[0] = rom  //只读报错
        if let room = john.residence?[0] {
            print(room.name)
        }
        //通过可选链接调用，我们可以用下标来对可选值进行读取或写入
        john.residence?[0].name = "健身房"
        if let roomName = john.residence?[0].name {
            print(roomName)
        }

        /// 访问可选类型的下标
        var testResources = ["Jason":[80,90,90], "Mike":[60,80,70]]
        testResources["Jason"]?[0] = 88
        testResources["Mike"]?[0] += 1
        testResources["Rose"]?[0] += 1
        print(testResources)
    }
    
    // MARK: -弱引用、无主引用
    fileprivate func weakAndUnownFunc(){
//        var module: Module? = Module(name: "Module")
//        var subModule: SubModule? = SubModule(number: 8)
//        module!.subModule = subModule
//        subModule!.module = module
//        module = nil
//        subModule = nil
        //无主引用
//        var module2: ModuleTwo? = ModuleTwo(name: "ModuleTwo")
//        module2?.subModuleTwo = SubModuleTwo(name: "SubModuleTwo", module: module2!)
//        module2 = nil;
        //闭包循环
        var hemlC: HtmlElement? = HtmlElement(name: "div", text: "hello world")
        print(hemlC!.OutPutClosure())
        print(hemlC!.OutPutClosure())

        hemlC = nil
    }
    
    // MARK: -类型转换
    fileprivate func dataTypeConversion(){
        //AnyObject 数组存放class类型实例，不能存int double string等类型
        let array: [AnyObject] = [ManKind(gender: "Female", name: "lily"),
                    ManKind(gender: "Male", name: "Jack"),
                    Creature(fauna: "Dog", name: "haha"),
                    Creature(fauna: "Fish", name: "jinjin"),
                    Creature(fauna: "Tree", name: "apple")]
        var manKindCount = 0
        var creatureCount = 0
        for item in array {
            if item is ManKind {manKindCount += 1}
            else if item is Creature {creatureCount += 1}
        }
        print("数组中共有\(manKindCount)个人类,\(creatureCount)个动植物")
        
        //向下转型
        for item in array {
            if let people = item as? ManKind {
                print("\(people.name) is \(people.gender)")
            }else if let creature = item as? Creature {
                print("\(creature.name) is \(creature.fauna)")
            }
        }
        
        //Any可以表示任何类型，包括方法类型（function types）。
        var arrayM = [Any]()
        arrayM.append(80)
        arrayM.append(3.1415)
        arrayM.append("字符串")
        arrayM.append(ManKind(gender: "Male", name: "Jason"))
        arrayM.append(Creature(fauna: "Pest", name: "蚊子"))
        
        for item in arrayM {
            switch item {
            case let people as ManKind:
                print("\(people.name) is \(people.gender)")
            case let creature as Creature:
                print("\(creature.name) is \(creature.fauna)")
            case let number as Int:
                print(number)
            case let string as String:
                print(string)
            case let pai as Double:
                print(pai)
            default:
                print("None")
            }
        }
    }
    
    // MARK: -扩展
    fileprivate func extensionFunc(){
        let number = 10.ADD.Minus.Plus.Devid
        print(number)
        
        let subject = Subject(name2: "hahaha")
        print(subject.name)
        
        let sum = Sum(num1: 50, num2: 100)
        let diff = Diff(NO1: 60, NO2: 80)
//        let getMult = Mult(a: <#T##Sum#>, b: <#T##Diff#>, PlusSum: <#T##Int#>, PlusDiff: <#T##Int#>)
        let getMultExt = Mult(x: sum, y: diff)
        print("getMultExt sum\(getMultExt.a.num1),\( getMultExt.a.num2) PlusSum:\(getMultExt.PlusSum)")
        print("getMultExt diff\(getMultExt.b.NO1),\(getMultExt.b.NO2) PlusDiff:\(getMultExt.PlusDiff)")
        
        3.DoItSeveralTimes {
            print("打印了一段代码")
        }
        2.DoItSeveralTimes(doIt: {
            print("又打印了一段代码")
        })
        
        var area = 7.0
        area.square()
        print(String(format: "圆的面积为%.2f", area))
        
        let animals = AnimalsInZoo()
        animals[1] = "horse"
        print(animals[2])
        print(animals[1])
        
        result(numb: [-2,-1,0,1,2,3,4])
    }
}



// MARK: -类
class sampleClass: Equatable {
    //遵守Equatable协议,必须实现此方法
    static func == (lhs: sampleClass, rhs: sampleClass) -> Bool {
        
        //判定两个常量或者变量是否引用同一个类实例
        return lhs.myPropority == rhs.myPropority
    }
    
    var myPropority: String
    init(string: String) {
        self.myPropority = string
    }
}

// MARK: -lazy 延迟存储
class Samber {
    //lazy 后面必须跟var
    lazy var des = Descript()
}

class Descript{
    let descript = "hello world"
}

// MARK: -计算属性
class CalculateP {
    var x = 0.0, y = 0.0
    var width = 100.0, height = 200.0
    var middle: (Double, Double){
        get{
            return (width*0.5, height*0.5)
        }
        //如果计算属性的 setter 没有定义表示新值的参数名，则可以使用默认名称 newValue。
        set(series){
            x = series.0 - width * 0.5
            y = series.1 - height * 0.5
        }
        
    }
}

// MARK: -只读计算熟属性
class readOnlyCalTrait {
    var name: String = ""
    var height: Int = 0
    var Description: [String: String]{
        return ["name": self.name,
                "height": "\(self.height)"]
    }
}

// MARK: -属性观察器
class TraitObser {
    var counter: Int = 0{
        willSet{
            print("newValue:\(newValue)")
        }
        didSet{
            if self.counter > oldValue{
                print("增加值:\(self.counter-oldValue)")
            }
        }
    }
}

// MARK: -类型方法
class Math {
    //类方法， 用类名称调用
    class func absNumber(num: Int) -> Int {
        if num > 0  {
            return num
        }else{
            return -num
        }
    }
}

struct Math2 {
    static func absNum(num: Int) -> Int{
        if num > 0  {
            return num
        }else{
            return -num
        }
    }
}

// MARK: -下标脚本
class DaysOfAWeek {
    private var days = ["Sunday", "Monday", "Tuesday", "Wednesday",
    "Thursday", "Friday", "saturday"]
    subscript (index: Int) -> String{
        get{
            return days[index]   // 声明下标脚本的值
        }
        set{
            days[index] = newValue // 执行赋值操作
        }
    }
}

// MARK: -下标脚本选项
struct Matrix {
    let rows: Int
    let columes: Int
    var two_dimensionalArray: [Double]
    init(row: Int, col: Int) {
        self.rows = row
        self.columes = col
        self.two_dimensionalArray = Array(repeating: 0.0, count: row*col)
    }
    subscript(rowIndex: Int, colIndex: Int)-> Double{
        set{
            two_dimensionalArray[(rowIndex * columes)+colIndex] = newValue
        }
        get{
            return two_dimensionalArray[(rowIndex * columes)+colIndex]
        }
    }
}

// MARK: -继承
class GrandFather {
    var height = 0.0
    //final 防止重写
    final var habit = "喝酒"
    var bodyDescript: String{//只读计算类型
        return "身高是\(height)cm"
    }
}

class Father: GrandFather {
    var weight = 0.0
    //重写属性
//Cannot override mutable property with read-only property 'habit'
//    override var habit: String{
//        return "抽烟"
//    }
    override var bodyDescript: String{
        let classString = (NSStringFromClass(type(of: self)))
        let splits = classString.split(separator: ".")
        return "\(splits[1])"+super.bodyDescript+"体重是\(weight)kg"
    }
}

class Son: Father {
    override var height: Double{
        //重写属性观察器
        didSet{//被重写不能为常亮或者只读计算类型
            weight = self.height*0.45
        }
    }
}

// MARK: -构造函数
struct Color {
    /*
    构造过程中修改常量属性
    只要在构造过程结束前常量的值能确定，你可以在构造过程中的任意时间点修改常量属性的值。
    对某个类实例来说，它的常量属性只能在定义它的类的构造过程中修改；不能在子类中修改。*/
    let red, green, blue: Double
    //如果你在定义构造器时没有提供参数的外部名字，Swift 会为每个构造器的参数自动生成一个跟内部名字相同的外部名
    init(red: Double, green: Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }
    
    //提供外部参数
    init(RGBPercentage percentage: Double) {
        red = percentage
        green = percentage
        blue = percentage
    }
    
    //隐藏外部参数
    init(_ r: Double, _ g: Double, _ b: Double) {
        red = r;
        green = g
        blue = b
    }
}

///结构体的逐一构造器
struct zhuYiStruct {
    var length = 200.0;
    var width = 100.0
}

///指定、便利构造器
class MainClass {
    var no1: Int
    init(no1:Int) {
        self.no1 = no1
    }
}
class SubClass: MainClass {
    var no2: Int
    
    //指定构造器
    init(no1: Int, no2: Int) {
        self.no2 = no2
        super.init(no1: no1)
    }
    /*便利构造器
    可以定义便利构造器来调用同一个类中的指定构造器，并为其参数提供默认值。
    你也可以定义便利构造器来创建一个特殊用途或特定输入的实例。*/
    override convenience init(no1: Int) {
        self.init(no1:no1, no2:50)
    }
}

///结构体可失败构造器
struct Animal {
    let fauna: String
    init?(animal: String) {
        if animal.isEmpty {
            return nil
        }
        fauna = animal
    }
}
///枚举类型的可失败构造器
enum DateEnume {
    case Monday,Tuesday,WensDay
    init?(character: String) {
        switch character {
        case "M":
            self = .Monday
        case "T":
            self = .Tuesday
        case "W":
            self = .WensDay
        default:
            return nil
        }
    }
}
///类的可失败构造器
/*值类型（如结构体或枚举类型）的可失败构造器，对何时何地触发构造失败这个行为没有任何的限制。
但是，类的可失败构造器只能在所有的类属性被初始化后和所有类之间的构造器之间的代理调用发生完后触发失败行为。*/
class GouFailClass {
    let failReason: String
    init?(failR: String) {
        self.failReason = failR
        if failR == "不小心" {
            return nil
        }
    }
}

// MARK: -析构函数
var counter = 0
class BaseClass {
    init() {
        counter += 1
    }
    deinit {
        counter -= 1
    }
}

// MARK: -可选链
class Person {
    var residence: Residence?
}

class Residence {
    var roms = [Room]()
    var numberOfRooms: Int{
        return self.roms.count
    }
    subscript(index: Int) -> Room{
        return roms[index]
    }
    func printNumberOfRooms() {
        print("房间号为\(numberOfRooms)")
    }
    var address: Address?
}

class Room {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    func buildingIdentifier() -> String? {
        if buildingName != nil {
            return buildingName
        }else if buildingNumber != nil{
            return buildingNumber
        }else{
            return nil
        }
        
    }
}

// MARK: -弱引用和无主引用
class Module {
    let name: String
    init(name: String) {
        self.name = name
    }
    var subModule: SubModule?
    deinit {
        print("\(name)模块deinit")
    }
    
}
class SubModule {
    let number: Int
    init(number: Int) {
        self.number = number
    }
    //对于生命周期中会变为nil的实例使用弱引用(有问号)
    weak var module: Module?
    deinit {
        print("SubModule number\(number) deinit")
    }
}
///无主引用
class ModuleTwo {
    let name: String
    init(name: String) {
        self.name = name
    }
    var subModuleTwo: SubModuleTwo?
    deinit {
        print("\(name)模块deinit")
    }
    
}
class SubModuleTwo {
    let name: String
    //对于初始化赋值后再也不会被赋值为nil的实例(没有问号)，使用无主引用
    unowned var module: ModuleTwo
    init(name: String, module: ModuleTwo) {
        self.name = name
        self.module = module
    }
    deinit {
        print("\(name)模块 deinit")
    }
}
//闭包循环引用
class HtmlElement {
    let name: String
    let text: String
    init(name: String, text: String) {
        self.name = name
        self.text = text
    }
    lazy var OutPutClosure: () -> String = {
        [unowned self] in
        return "<\(self.name)>\(self.text)</\(self.name)>"
    }
    deinit {
        print("HtmlElement deinit")
    }
}

// MARK: -类型转换
class Subject {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class ManKind: Subject {
    var gender: String
    init(gender: String, name: String) {
        self.gender = gender
        super.init(name: name)
    }
}

class Creature: Subject {
    var fauna: String
    init(fauna: String, name: String) {
        self.fauna = fauna
        super.init(name: name)
    }
}

// MARK: -swift 扩展
//扩展可以向已有类型添加计算型实例属性和计算型类型属性
extension Int {
    var ADD: Int {return self + 10}
    var Minus: Int {return self - 10}
    var Plus: Int {return self * 10}
    var Devid: Int {return self / 10}
}
//类中添加新的便利构造器
extension Subject {
    
    convenience init(name2: String) {
        self.init(name: name2)
        self.name = "----"
    }
    
}
//扩展可以向已有类型添加新的构造器
struct Sum {
    var num1 = 10, num2 = 10
}
struct Diff {
    var NO1 = 20, NO2 = 20
}
struct Mult {
    var a = Sum()
    var b = Diff()
    var PlusSum: Int
    var PlusDiff: Int
}
extension Mult {
    init(x: Sum, y: Diff) {
        a = x
        b = y
        PlusSum = x.num1 + x.num2
        PlusDiff = y.NO1 + y.NO2
    }
}

//方法
extension Int {
    func DoItSeveralTimes(doIt: () -> ()) {
        for _ in 0..<self {
            doIt()
        }
    }
}
//可变实例方法
extension Double {
    mutating func square() {
        let pi = 3.141592654
        self = self * self * pi
    }
}
//下标
class AnimalsInZoo {
    var animals = ["dog","lion","cat","leopard","crocodile","walf","monkey"]
}
extension AnimalsInZoo {
    subscript (index: Int) -> String{
        set{
            animals[index] = newValue
        }
        get{
            return "第\(index)个动物是\(animals[index])"
        }
    }
}
//嵌套类型extension
extension Int {
   enum calc
   {
      case add
      case sub
      case mult
      case div
      case anything
   }
    
    struct ssss {
        var num1: String
        init(num: String) {
            self.num1 = num
        }
    }

    var print: calc {
      switch self
      {
         case 0:
            return .add
         case 1:
            return .sub
         case 2:
            return .mult
         case 3:
            return .div
         default:
            return .anything
       }
   }
    
    var print2: ssss{
        if self>=0 {
            return ssss(num: "大于等于0")
        }else{
            return ssss(num: "小于0")
        }
    }
    
}

//定义方法
func result(numb: [Int]) {
   for i in numb {
      switch i.print {
         case .add:
            print(" add ")
          case .sub:
            print(" sub ")
         case .mult:
         print(" mult ")
         case .div:
         print(" div ")
         default:
         print(" 未知 ")
      }
    
    print(i.print2.num1)
   }
}
