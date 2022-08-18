//
//  main.swift
//  rock-scissor-paper
//
//  Created by 정재근 on 2022/08/16.
//

import Foundation

enum player: String {
    case user = "사용자"
    case computer = "컴퓨터"
}

enum Hand {
    static let exitGame = 0
    static let scissors = 1
    static let rock = 2
    static let paper = 3
}

class rockScissorPaper {
    
    

    enum result: String {
        case win = "이겼습니다!"
        case lose = "졌습니다!"
        case draw = "비겼습니다!"
        case error = "ERROR"
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
        let computerNumber: Int = Int.random(in: Hand.scissors...Hand.paper)
        
        let rockSicissorPaperResult = dicisionWinOrLose(userNumber, computerNumber)
        print(rockSicissorPaperResult.rawValue)
    }

    func dicisionWinOrLose(_ human: Int, _ computer: Int) -> result{
        switch (human, computer) {
        case (Hand.scissors, Hand.scissors), (Hand.rock, Hand.rock), (Hand.paper, Hand.paper) :
            return result.draw
        case (Hand.scissors, Hand.paper), (Hand.rock, Hand.scissors), (Hand.paper, Hand.rock):
                return result.win
        case (Hand.scissors, Hand.rock), (Hand.rock, Hand.paper), (Hand.paper, Hand.scissors):
            return result.lose
        case (_, _):
            break
        }
        return result.error
    }
    
    func reactInputError() {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        startGame()
    }
}


class mukjjibbaGame {
    func gameResult(_ human: Int, _ computer: Int) -> Bool {
        switch(human, computer) {
        case (Hand.scissors, Hand.scissors), (Hand.rock, Hand.rock), (Hand.paper, Hand.paper) :
            return true
        case (Hand.scissors, Hand.paper), (Hand.rock, Hand.scissors), (Hand.paper, Hand.rock):
            return false
        case (Hand.scissors, Hand.rock), (Hand.rock, Hand.paper), (Hand.paper, Hand.scissors):
            return false
        case (_, _):
            break
        }
        return false
    }
}


//func mukjiibbaGame(_ winner: player) {
//    print("[\(winner.rawValue) 턴] 묵(1), 찌(2), 뻐(3)! <종료: 0> :", terminator: " ")
//    let computerNumber = Int.random(in: Hand.scissors...Hand.paper)
//    let userNumber = userInput()
//    let mukgiibbaResult = dicisionWinOrLose(userNumber, computerNumber)
//    if mukgiibbaResult == result.draw {
//        print("\(winner.rawValue)의 승리!")
//    } else if mukgiibbaResult == result.win {
//
//    } else if mukgiibbaResult == result.lose {
//
//    } else if mukgiibbaResult == result.error {
//        if winner == player.user {
//            mukjiibbaGame(player.computer)
//        } else {
//            mukjiibbaGame(player.user)
//        }
//    }
//}


rockScissorPaper().startGame()
