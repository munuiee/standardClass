import UIKit

/* 
 250826 화요일
 
 Person 이라는 이름의 클래스 만들기

 프로퍼티: name (String), age (Int)
 이니셜라이저: name, age를 초기화
 메서드: talk라는 이름으로 안녕하세요, name, age를 print하는 기능

 플레이그라운드로 작성하기!
 인스턴스 여러개 생성하고 여러가지 테스트 다뤄보기.
 */

class Person {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func talk() {
        print("안녕하세요", name, age)
    }
    
}

let person = Person(name: "지혜", age: 26)
person.talk()

let ganadi = Person(name: "가나디", age: 1)
ganadi.talk()

let damgom = Person(name: "담곰", age: 2)
damgom.talk()

let gonyani = Person(name: "고냐니", age: 3)
gonyani.talk()
