//
//  backgroundServiceTests.swift
//  backgroundServiceTests
//
//  Created by admin on 8/13/21.
//

import XCTest
@testable import backgroundService

class backgroundServiceTests: XCTestCase {

    func testAdd(){
        
        let service = BackgroundService()
        
        /* Enter the background mode */
        DispatchQueue.global().async {
        
        /* Call the DoMathOperation method to perform an add Operation */
        service.DoMathOperation(num1: 1, num2: 1, operation:
                                    BackgroundService.Operations.Add.rawValue, delayInSeconds: 5)
            
            /* Exit the background mode and return to the main thread */
            DispatchQueue.main.async{
                
            XCTAssertEqual(service.result!, 2.0)
                
            }
            
        }
        
      
        
    }
    
    func testSubtraction(){
        
        let service = BackgroundService()
        
        /* Enter the background mode */
        DispatchQueue.global().async {
        
        /* Call the DoMathOperation method to perform a subtract operation */
        service.DoMathOperation(num1: 1, num2: 1, operation:
                                    BackgroundService.Operations.Subtract.rawValue, delayInSeconds: 5)
            
            /* Exit the background mode and return to the main thread */
            DispatchQueue.main.async{
                
            XCTAssertEqual(service.result!, 0.0)
                
            }
            
            
        }
        
       
        
    }
    
    func testMultiplication(){
        
        let service = BackgroundService()
        
        /* Enter the background mode */
        DispatchQueue.global().async {
            
        /* Call the DoMathOperation method to perform a multiply operation */
        service.DoMathOperation(num1: 1, num2: 1, operation:
                                    BackgroundService.Operations.Multiply.rawValue, delayInSeconds: 5)
            
        /* Exit the background mode and return to the main thread */
        DispatchQueue.main.async{
            
        XCTAssertEqual(service.result!, 1.0)
            
        }
            
    }
        
 }
    
    func testDivision(){
        
        let service = BackgroundService()
        
        /* Enter the background mode */
        DispatchQueue.global().async {
            
        /* Call the DoMathOperation method to perform a divide operation */
        service.DoMathOperation(num1: 1, num2: 1, operation:
                                    BackgroundService.Operations.Divide.rawValue, delayInSeconds: 5)
            
        /* Exit the background mode and return to the main thread */
        DispatchQueue.main.async{
            
        XCTAssertEqual(service.result!, 1.0)
            
        }
            
    }
        
 }

}
