import Foundation

@_functionBuilder
public struct StringBuilder {
    public static func buildBlock(_ components: String...) -> String {
        components.joined(separator: "\n")
    }
}

@_functionBuilder
public struct LearingBuilder {
    public static func buildBlock(_ components: String...) -> String {
        let prefix = "📖 I'm recently learning:\n"
        let items = components.map {
            "\t- \($0)"
        }.joined(separator: "\n")
        return prefix + items
    }
}

enum Language {
    case swift
    case typeScript
    case cpp
    case rust
}

func bigFans(to name: String) -> String {
    "⚡️ I'm big fans of \(name)"
}

func work(in name: String, to reason: String) -> String {
    "💻 I'm currently work in \(name) to \(reason)."
}

func focusing(on name: String) -> String {
    "📒 Focusing on \(name)..."
}

func recently(@StringBuilder _ block: () -> String) -> String {
    block()
}

func learning(@LearingBuilder _ block: () -> String) -> String {
    block()
}


extension String {
    func say() {
        print(self)
    }
    func announce() {
        print(self)
    }
    func happyToSay() {
        print(self)
    }
}

protocol Person {
    var email: String { get }
    func sayHi() -> Void
}


protocol Developer: Person {
    
}

protocol Student: Person {
    
}

protocol Boy: Person {
    
}

func mail(to target: Person) {
    target.sayHi()
}


struct Jctaoo: Boy, Student, Developer {
    var email: String {
        "jctaoo@outlook.com"
    }
    
    static let unique = Jctaoo()
    private init() {}
    
    var mostInterestLangs: [Language] {
        [.swift, .rust]
    }
    
    func sayHi() {
        """
        👋 Hi there, I'm jctaoo.
           A high school student from China with a passion for developing some
           interesting programs and fascinated by everything that's CS related.
        """.announce()
        focusing(on: "Swift Student Challenage").say()
        work(in: "🚀fusée code lab", to: "make fantastic open-source programs").say()
        recently {
            learning {
                "Algorithms"
                "Compilation Principles"
            }
        }.say()
        bigFans(to: "Detective Conan").say()
        "✨ See my pined project below, you may lik these.".happyToSay()
    }
}

mail(to: Jctaoo.unique)
