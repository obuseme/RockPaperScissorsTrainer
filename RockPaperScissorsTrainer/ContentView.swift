//
//  ContentView.swift
//  RockPaperScissorsTrainer
//
//  Created by Andrew Obusek on 7/27/20.
//

import SwiftUI

struct ContentView: View {
    let possibleMoves = ["Rock", "Paper", "Scissors"]
    @State var currentComputerChoice = ""
    @State var shouldWin = false
    @State var progress = 0
    @State var score = 0

    func nextMove() {
        currentComputerChoice = possibleMoves[Int.random(in: 0..<possibleMoves.count)]
        shouldWin = Bool.random()
        progress += 1
    }

    func recordMove(move: String) {
        defer {
            nextMove()
        }
        guard move != currentComputerChoice else { return }
        if isCorrectAnswer(usersMove: move, computerChoice: currentComputerChoice, shouldWin: shouldWin) {
            score += 1
        } else {
            print("a")
        }
    }

    func isCorrectAnswer(usersMove: String, computerChoice: String, shouldWin: Bool) -> Bool {
        if shouldWin {
            return (usersMove == "Rock" && computerChoice == "Scissors"
                || usersMove == "Scissors" && computerChoice == "Paper"
                || usersMove == "Paper" && computerChoice == "Rock")
        } else {
            return (usersMove == "Rock" && computerChoice == "Paper"
                || usersMove == "Scissors" && computerChoice == "Rock"
                || usersMove == "Paper" && computerChoice == "Scissors")
        }
    }

    var body: some View {
        VStack {
            if progress == 0 {
                Button("Start the game!") {
                    nextMove()
                }
            } else if progress < 11 {
                Text("Computer Choice: \(currentComputerChoice)").padding()
                if shouldWin {
                    Text("Your job: Win the game").padding()
                } else {
                    Text("Your job: Lose the game").padding()
                }
                Text("Progress: \(progress) of 10").padding()
                HStack {
                    Button("Rock") {
                        recordMove(move: "Rock")
                    }.padding().frame(minWidth: 0, maxWidth: .infinity).border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                    Button("Paper") {
                        recordMove(move: "Paper")
                    }.padding().frame(minWidth: 0, maxWidth: .infinity).background(Color.gray).border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                    Button("Scissors") {
                        recordMove(move: "Scissors")
                    }.padding().frame(minWidth: 0, maxWidth: .infinity).background(Color.red).border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                }.padding().foregroundColor(.black)
            } else {
                VStack {
                    Text("Results!")
                    Text("Score: \(score)").padding()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(currentComputerChoice: "Rock", shouldWin: true, progress: 1, score: 1)
    }
}
