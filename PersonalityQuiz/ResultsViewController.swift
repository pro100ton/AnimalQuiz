//
//  ResultsViewController.swift
//  PersonalityQuiz
//
//  Created by Антон Шалимов on 28.01.2023.
//

import UIKit

class ResultsViewController: UIViewController {

    // Hold user responses
    var responses: [Answer]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatePersonalityResult()
        navigationItem.hidesBackButton = true
    }
    
    func calculatePersonalityResult() {
        let frequencyOfAnswers = responses.reduce(into: [:], {(counts, answer) in counts[answer.type, default: 0] += 1})
        let frequencyAnswersSorted = frequencyOfAnswers.sorted(by: {(pair1, pair2) in
            return pair1.value > pair2.value
        })
        let mostCommonAnswer = frequencyAnswersSorted.first!.key
        resultAnswerLabel.text = "You are a \(mostCommonAnswer.rawValue)"
        resulDefinitionLabel.text = mostCommonAnswer.definition
    }
    
    // View outlets
    @IBOutlet var resultAnswerLabel: UILabel!
    @IBOutlet var resulDefinitionLabel: UILabel!
    
    
    /*
    Custom initializer to prevent compilation error due to the fact, that responses does not
     have an initial value nor is it eve assigned a value in an initializer
    */
    init?(coder: NSCoder, responses: [Answer]){
        /*
         This initializer takes two parameters:
            coder - will be provided and is used by UIKit to initialize view controller from the information defined
                in storyboard
            responses - will be supplied by user, when calling an initializer and assigned to self.responses
         */
        self.responses = responses
        super.init(coder: coder)
    }
    
    /*
     This initializer will be called, if ViewController is initialized without custom initializer above
     and will crash this app
     */
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
