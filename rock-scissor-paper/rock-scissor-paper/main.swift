//
//  main.swift
//  rock-scissor-paper
//
//  Created by 정재근 on 2022/08/16.
//

import Foundation

enum rockScissorsPaper {
    static let exitGame = 0
    static let scissors = 1
    static let rock = 2
    static let paper = 3
}

enum result: String {
    case win = "이겼습니다!"
    case lose = "졌습니다!"
    case draw = "비겼습니다!"
}

func menu() {
    print("가위(1), 바위(2), 보(3)!<종료 : 0>:", terminator: " ")
}

func userInput() -> Int {
    
    guard let stringValue = readLine(), let userNumber = Int(stringValue) else {
        reactInputError()
        
        return 0
    }
    
    return userNumber
}
func startGame(){
    menu()
    
    let userNumber = userInput()
    let computerNumber: Int = Int.random(in: rockScissorsPaper.scissors...rockScissorsPaper.paper)
    
    dicisionWinOrLose(userNumber, computerNumber)
}

func dicisionWinOrLose(_ human: Int, _ computer: Int) {
    switch human {
    case rockScissorsPaper.exitGame:
        print("게임 종료")
    case rockScissorsPaper.scissors:
        switch computer {
        case rockScissorsPaper.scissors:
            print(result.draw.rawValue)
            startGame()
        case rockScissorsPaper.rock:
            print(result.lose.rawValue)
        case rockScissorsPaper.paper:
            print(result.win.rawValue)
        default:
            reactInputError()
        }
    case rockScissorsPaper.rock:
        switch computer {
        case rockScissorsPaper.scissors:
            print(result.win.rawValue)
        case rockScissorsPaper.rock:
            print(result.draw.rawValue)
            startGame()
        case rockScissorsPaper.paper:
            print(result.lose.rawValue)
        default:
            reactInputError()
        }
    case rockScissorsPaper.paper:
        switch computer {
        case rockScissorsPaper.scissors:
            print(result.lose.rawValue)
        case rockScissorsPaper.rock:
            print(result.win.rawValue)
        case rockScissorsPaper.paper:
            print(result.draw.rawValue)
            startGame()
        default:
            reactInputError()
        }
    default:
        reactInputError()
    }
}

func reactInputError() {
    print("잘못된 입력입니다. 다시 시도해주세요.")
    startGame()
}

startGame()
