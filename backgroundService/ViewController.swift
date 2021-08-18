//
//  ViewController.swift
//  backgroundService
//
//  Created by admin on 8/13/21.
//

import UIKit
import CoreLocation

class ViewController: UIViewController,CounterDelegate {
    
    private lazy var locationManager : CLLocationManager = {
        
        let manager =  CLLocationManager()
        
               manager.delegate = self
        
               manager.requestAlwaysAuthorization()
        
               manager.allowsBackgroundLocationUpdates = true
              
               return manager
        
    }()
    
    var pickerData: [String] = [String]()
    
    @IBOutlet weak var firstNumber: UITextField!
    
    @IBOutlet weak var secondNumber: UITextField!
    
    @IBOutlet weak var delayTime: UITextField!
    
    @IBOutlet weak var operationType: UIButton!
    
    @IBOutlet weak var operationTitle: UIButton!
    
    @IBOutlet weak var result: UILabel!
    
    @IBOutlet weak var queue: UILabel!
    
    @IBOutlet weak var pickerOperation: UIPickerView!
   
    
    @IBAction func operationHandler(_ sender: Any) {
        
        self.pickerOperation.isHidden = false
        
    }
    
    @IBAction func performCalculation(_ sender: Any) {
      
        guard self.firstNumber.text != "" || self.secondNumber.text != "" else {return}
       
        guard self.delayTime.text != ""  else {return}
       
        let number1 = Int(self.firstNumber.text!)!
        
        let number2 =
            Int(self.secondNumber.text!)!
        
        let delaySeconds = Int(self.delayTime.text!)
        
        self.service.operationCounter! += 1
        
        guard let operation = self.operationTitle.titleLabel?.text else{ return }
       
        self.queue.text = "\(self.service.operationCounter!)"
        
        DispatchQueue.global().async{
           
            self.service.DoMathOperation(num1: number1, num2: number2, operation: operation, delayInSeconds: delaySeconds!)

        }
     
    }
    
    let service = BackgroundService()
  
    func fetchData(result: Float) {
        
        print("hhhh")
        
        DispatchQueue.main.async{
            
        self.result.text = "\(result)"
            
        self.queue.text = "\(self.service.operationCounter!)"
             
            
    }
        
}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.service.delegate = self
        
        // Connect data:
             self.pickerOperation.delegate = self
             self.pickerOperation.dataSource = self
             
             // Input the data into the array
        pickerData = [BackgroundService.Operations.Add.rawValue, BackgroundService.Operations.Subtract.rawValue, BackgroundService.Operations.Multiply.rawValue,BackgroundService.Operations.Divide.rawValue]
        
       
        locationManager.startUpdatingLocation()
        
        locationManager.requestLocation()
    
    }
    
    override func didReceiveMemoryWarning() {
         super.didReceiveMemoryWarning()
         // Dispose of any resources that can be recreated.
     }
        
}

/* An extension for UI Picker */
extension ViewController:UIPickerViewDelegate, UIPickerViewDataSource{
 
    
    // Number of columns of data
       func numberOfComponents(in pickerView: UIPickerView) -> Int {
           return 1
       }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        self.operationTitle.setTitle(self.pickerData[row], for: .normal)
        
        self.pickerOperation.isHidden = true
        
    }
       
     // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.pickerData.count
    }
     
  
     // The data to return fopr the row and component (column) that's being passed in
     func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
         return pickerData[row]
        
     }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {

        var label: UILabel
        if let view = view as? UILabel { label = view }
        else { label = UILabel() }

        label.text = self.pickerData[row]
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5

        return label
    }
}

/* An Extension for location */
extension ViewController:CLLocationManagerDelegate {
    
    func locationManager(
        _ manager: CLLocationManager,
        didUpdateLocations locations: [CLLocation]
    ) {
        if let location = locations.last {
            
            let latitude = location.coordinate.latitude
           
            let longitude = location.coordinate.longitude
            // Handle location update
            
            print(latitude)
            
            print(longitude)
            
        }
    }

    func locationManager(
        _ manager: CLLocationManager,
        didFailWithError error: Error
    ) {
        // Handle failure to get a user’s location
    }
}
