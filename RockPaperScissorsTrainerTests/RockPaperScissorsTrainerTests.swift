//
//  RockPaperScissorsTrainerTests.swift
//  RockPaperScissorsTrainerTests
//
//  Created by Andrew Obusek on 7/27/20.
//

import XCTest
@testable import RockPaperScissorsTrainer

class RockPaperScissorsTrainerTests: XCTestCase {

    func testIsCorrectAnswer_Paper() {
        let toTest = ContentView()

        XCTAssertTrue(toTest.isCorrectAnswer(usersMove: "Paper", computerChoice: "Rock", shouldWin: true))
        XCTAssertFalse(toTest.isCorrectAnswer(usersMove: "Paper", computerChoice: "Rock", shouldWin: false))
        XCTAssertTrue(toTest.isCorrectAnswer(usersMove: "Paper", computerChoice: "Scissors", shouldWin: false))
        XCTAssertFalse(toTest.isCorrectAnswer(usersMove: "Paper", computerChoice: "Scissors", shouldWin: true))
    }

    func testIsCorrectAnswer_Rock() {
        let toTest = ContentView()

        XCTAssertTrue(toTest.isCorrectAnswer(usersMove: "Rock", computerChoice: "Scissors", shouldWin: true))
        XCTAssertFalse(toTest.isCorrectAnswer(usersMove: "Rock", computerChoice: "Scissors", shouldWin: false))
        XCTAssertTrue(toTest.isCorrectAnswer(usersMove: "Rock", computerChoice: "Paper", shouldWin: false))
        XCTAssertFalse(toTest.isCorrectAnswer(usersMove: "Rock", computerChoice: "Paper", shouldWin: true))

    }

    func testIsCorrectAnswer_Scissors() {
        let toTest = ContentView()

        XCTAssertTrue(toTest.isCorrectAnswer(usersMove: "Scissors", computerChoice: "Paper", shouldWin: true))
        XCTAssertFalse(toTest.isCorrectAnswer(usersMove: "Scissors", computerChoice: "Paper", shouldWin: false))
        XCTAssertTrue(toTest.isCorrectAnswer(usersMove: "Scissors", computerChoice: "Rock", shouldWin: false))
        XCTAssertFalse(toTest.isCorrectAnswer(usersMove: "Scissors", computerChoice: "Rock", shouldWin: true))
    }


}
