//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 01.06.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var animalNameLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    // MARK: - Public Property
    var answersChoosen: [Answer]!
    
    // MARK: - Private Property
    private var choosenAnimal: AnimalType!

    //MARK: - Live Cycles View Controller
    override func viewDidLoad() {
        super.viewDidLoad()
        sortAnswer()
        setupLabels()
    }
    
    // MARK: - Private Methods
    private func setupLabels() {
        animalNameLabel.text = "Вы - \(choosenAnimal.rawValue)"
        descriptionLabel.text = "\(choosenAnimal.definition)"
        setupnavigationItem()
    }
    
    private func setupnavigationItem() {
        navigationItem.hidesBackButton = true
    }
    
    private func sortAnswer() {
        var animalsDictionary = [AnimalType:Int]()
        let animalTypes = answersChoosen.map{$0.type}
        animalTypes.forEach { (animal) in
            switch animal {
            case .dog:
                updateDictionary(dictionary: &animalsDictionary, for: .dog)
            case .cat:
                updateDictionary(dictionary: &animalsDictionary, for: .cat)
            case .turtle:
               updateDictionary(dictionary: &animalsDictionary, for: .turtle)
            case .rabbit:
                updateDictionary(dictionary: &animalsDictionary, for: .rabbit)
            }
        }
        let sortedAnimalDictionary = animalsDictionary.sorted{$0.value > $1.value}
        let choosenAnimals = Array(sortedAnimalDictionary.map({$0.key}))
        choosenAnimal = choosenAnimals.first
}
    
    private func updateDictionary( dictionary: inout [AnimalType:Int] ,for key: AnimalType) {
        if let countAnimal = dictionary[key] {
            dictionary[key] = countAnimal + 1
        } else {
            dictionary[key] = 1
        }
    }
}
