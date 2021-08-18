//
//  MyService.swift
//  backgroundService
//
//  Created by admin on 8/13/21.

import Foundation

protocol CounterDelegate {
    
func fetchData(result: Float)
    
}


protocol SomeEnum {
    
    var rawValue : String {get}
    
}

public class BackgroundService {
    
var delegate : CounterDelegate?
    
    
   public enum Operations: SomeEnum {
        
        case Add
        
        case Subtract
        
        case Divide
        
        case Multiply
       
      public var rawValue: String {
            
            switch self {
            
            case .Add:
                
            return "+"
            
            case .Subtract:
                
            return "-"
                
            case .Multiply:
            
            return "*"
                
            case .Divide:
            
            return "/"
                
            }
        }
    }

var operationCounter : Int?
 
var result : Float?
    
    
    init(){
        
    self.operationCounter = 0
        
    self.result = 0.0
        
    }
    
    deinit {
        
        print("Class released from memory!")
    }
    
    func DoMathOperation(num1:Int, num2:Int, operation: String, delayInSeconds: Int){
    
        let seconds = DispatchTimeInterval.seconds(delayInSeconds)
       
        DispatchQueue.global().asyncAfter(deadline: DispatchTime.now() + seconds){
         
            switch operation{
            
            case Operations.Subtract.rawValue:
             
                self.result = Float(num1) - Float(num2)
                
            case Operations.Multiply.rawValue:
             
                self.result = Float(num1) * Float(num2)
                
            case Operations.Divide.rawValue:
             
                self.result = Float(num1) / Float(num2)
                
            default:
                
                self.result = Float(num1) + Float(num2)
                
            }
         
            self.operationCounter! -= 1
            
            self.delegate?.fetchData(result:self.result!)
    
            print("welcome")
            
           
        }
       
    }
    
}
