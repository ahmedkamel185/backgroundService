//
//  backgroundServiceUITests.swift
//  backgroundServiceUITests
//
//  Created by admin on 8/13/21.
//

import XCTest

class backgroundServiceUITests: XCTestCase {

     func setup(){
        
        continueAfterFailure = false
    }
    
    func test_case(){
        
        let app = XCUIApplication()
        app.launch()
   
        let num1 =  app.textFields["number1"]
        
        num1.tap()
        
        num1.typeText("2")
        
        let num2 =  app.textFields["number2"]
       
        num2.tap()
        
        num2.typeText("1")

        let delaySeconds =  app.textFields["delaySeconds"]
        
        delaySeconds.tap()
        
        delaySeconds.typeText("5")
        
        let calculateBtn = app.buttons["calculate"]
        
        calculateBtn.tap()
       
        let resultLabel =  app.staticTexts["result"]
            
        XCTAssertEqual("3.0",resultLabel.label)
       
    }
     
}
