//
//  main.swift
//  rock-scissor-paper
//
//  Created by 정재근 on 2022/08/16.
//

import Foundation

enum rockScissorsPaper {
 
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
        print("잘못된 입력입니다. 다시 시도해주세요.")
        startGame()
        
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
    if human == computer {
        print("비겼습니다!")
        startGame()
    } else if human == 1 && computer == 2 || human == 2 && computer == 3 || human == 3 && computer == 1 {
        print("졌습니다!")
    } else if human == 1 && computer == 3 || human == 2 && computer == 1 || human == 3 && computer == 2 {
        print("이겼습니다!")
    } else if human == 0 {
        print("게임 종료")
    } else {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        startGame()
    }
}

startGame()
