//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct FitnessCenterKiosk {
    
    func receiveEnglishName() -> String {
        var isCorrectData = false
        var englishName = ""
        while !isCorrectData {
            print(newLineString)
            print("회원님의 이름을 입력해 주세요. * 이름은 영어만 입력해주세요.(공백, 특수문자 사용금지)")
            print("입력란(강제종료:q!) : ", terminator: "")
            let enterResult = enterEnglishName()
            switch enterResult {
            case .success(let data):
                englishName = data
                isCorrectData = true
            case .failure(let error):
                printKioskErrorMessage(about: error)
            }
        }
        return englishName
    }
    
    func enterEnglishName() -> Result<String, KioskError> {
        if let name = readLine() {
            if name == "q!" {
                return .failure(.forcedTermination)
            }
            if checkIsEnglish(target: name) {
                return .success(name)
            } else {
                return .failure(.notEnglish)
            }
        } else {
            return .failure(.emptyData)
        }
    }
    
    func checkIsEnglish(target: String) -> Bool {
        let upperTarget = target.uppercased()
        for character in upperTarget.unicodeScalars {
            if !(character.value >= 65 && character.value <= 90) {
                return false
            }
        }
        return true
    }
    
    func receiveNaturalNumber() -> Int {
        var isCorrectData = false
        var NaturalNumber = 0
        while !isCorrectData {
            print("입력란 (자연수만 입력)(강제종료:q!) : ", terminator: "")
            let enterResult = enterNaturalNumber()
            switch enterResult {
            case .success(let data):
                NaturalNumber = data
                isCorrectData = true
            case .failure(let error):
                printKioskErrorMessage(about: error)
            }
        }
        return NaturalNumber
    }
    
    func enterNaturalNumber() -> Result<Int, KioskError> {
        if let inputString = readLine() {
            if inputString == "q!" {
                return .failure(.forcedTermination)
            }
            if let naturalNumber = Int(inputString) {
                if naturalNumber > 0 {
                    return .success(naturalNumber)
                } else {
                    return .failure(.notNaturalNumber)
                }
            } else {
                return .failure(.notNumber)
            }
        } else {
            return .failure(.emptyData)
        }
    }
}