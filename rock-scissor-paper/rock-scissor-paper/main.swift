//
//  main.swift
//  rock-scissor-paper
//
//  Created by 정재근 on 2022/08/16.
//
import Foundation

enum Exitgame {
    static let exitGame = 0
}

enum RockScissorsPaper {
    
    static let scissors = 1
    static let rock = 2
    static let paper = 3
}

enum gameResult: String {
    case win = "이겼습니다!"
    case lose = "졌습니다!"
    case draw = "비겼습니다!"
}

func printMenu() {
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
    printMenu()
    
    let userNumber = userInput()
    let computerNumber: Int = Int.random(in: RockScissorsPaper.scissors...RockScissorsPaper.paper)
    
    dicisionWinOrLose(userNumber, computerNumber)
}

func dicisionWinOrLose(_ human: Int, _ computer: Int) {
    switch human {
    case Exitgame.exitGame:
        print("게임 종료")
    case RockScissorsPaper.scissors:
        switch computer {
        case RockScissorsPaper.scissors:
            print(gameResult.draw.rawValue)
            startGame()
        case RockScissorsPaper.rock:
            print(gameResult.lose.rawValue)
        case RockScissorsPaper.paper:
            print(gameResult.win.rawValue)
        default:
            reactInputError()
        }
    case RockScissorsPaper.rock:
        switch computer {
        case RockScissorsPaper.scissors:
            print(gameResult.win.rawValue)
        case RockScissorsPaper.rock:
            print(gameResult.draw.rawValue)
            startGame()
        case RockScissorsPaper.paper:
            print(gameResult.lose.rawValue)
        default:
            reactInputError()
        }
    case RockScissorsPaper.paper:
        switch computer {
        case RockScissorsPaper.scissors:
            print(gameResult.lose.rawValue)
        case RockScissorsPaper.rock:
            print(gameResult.win.rawValue)
        case RockScissorsPaper.paper:
            print(gameResult.draw.rawValue)
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
