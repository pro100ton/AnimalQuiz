//
//  Questions.swift
//  PersonalityQuiz
//
//  Created by Антон Шалимов on 28.01.2023.
//

import Foundation

struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
}
                 
enum ResponseType {
    case single, multiple, ranged
}

struct Answer {
    var text: String
    var type: AnimalType
}

enum AnimalType: Character {
    case dog = "🐶", cat="🐱", rat="🐀", penguin="🐧"
    
    var definition: String {
        switch self {
        case .dog:
            return "Well, you are a filthy dog. Conrats i guess"
        case .cat:
            return "Congrats, you are a majestic cat! Meow!"
        case .rat:
            return "You are a fucking rat! Go snuggle in basement you fuck"
        case .penguin:
            return "You are a most beatiful and lovely creature on earth!"
        }
    }
}
