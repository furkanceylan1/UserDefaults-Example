
import UIKit

class ViewController: UIViewController {

    let (nameTextField, birthTextField, resultLabel, birthLabel) = (UITextField(),UITextField(),UILabel(),UILabel())
    @objc let (saveButton, deleteButton) = (UIButton(),UIButton())
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width = self.view.frame.size.width
        let height = self.view.frame.size.height
        
        view.backgroundColor = UIColor.gray
        
        nameTextField.textColor = UIColor.black
        nameTextField.placeholder = "Please enter your name"
        nameTextField.textAlignment = NSTextAlignment.center
        nameTextField.keyboardAppearance = UIKeyboardAppearance.dark
        nameTextField.keyboardType = UIKeyboardType.alphabet
        nameTextField.backgroundColor = UIColor.white
        nameTextField.frame = CGRect.init(x: width * 0.5 - (width * 0.8 / 2), y: height * 0.1, width: width * 0.8, height: 37)
        nameTextField.layer.cornerRadius = 10.0
        view.addSubview(nameTextField)
        
        birthTextField.textColor = UIColor.black
        birthTextField.placeholder = "Please enter your birth name"
        birthTextField.textAlignment = NSTextAlignment.center
        birthTextField.keyboardAppearance = UIKeyboardAppearance.dark
        birthTextField.keyboardType = UIKeyboardType.alphabet
        birthTextField.backgroundColor = UIColor.white
        birthTextField.frame = CGRect.init(x: width * 0.5 - (width * 0.8 / 2), y: height * 0.1 + 43, width: width * 0.8, height: 37)
        birthTextField.layer.cornerRadius = 10.0
        view.addSubview(birthTextField)
        
        saveButton.setTitle("Save", for: UIControl.State.normal)
        saveButton.setTitleColor(UIColor.black, for: UIControl.State.normal)
        saveButton.frame = CGRect(x: width * 0.1, y: height * 0.25, width: width * 0.2, height: 37)
        saveButton.layer.cornerRadius = 10.0
        saveButton.backgroundColor = UIColor.white
        saveButton.addTarget(self, action: #selector(ViewController.saveClick), for: UIControl.Event.touchUpInside)
        view.addSubview(saveButton)
        
        deleteButton.setTitle("Delete", for: UIControl.State.normal)
        deleteButton.setTitleColor(UIColor.black, for: UIControl.State.normal)
        deleteButton.frame = CGRect(x: width * 0.7, y: height * 0.25, width: width * 0.2, height: 37)
        deleteButton.layer.cornerRadius = 10.0
        deleteButton.backgroundColor = UIColor.white
        deleteButton.addTarget(self, action: #selector(deleteClick), for: UIControl.Event.touchUpInside)
        view.addSubview(deleteButton)
        
        resultLabel.textColor = UIColor.white
        resultLabel.textAlignment = NSTextAlignment.center
        resultLabel.text = "Name : \(nameTextField.text!)"
        resultLabel.frame = CGRect(x: width * 0.5 - (width * 0.9 / 2), y: height * 0.5 - 16, width: width * 0.9, height: 34)
        view.addSubview(resultLabel)
        
        birthLabel.textColor = UIColor.white
        birthLabel.textAlignment = NSTextAlignment.center
        birthLabel.text = "Birth Day : \(birthTextField.text!)"
        birthLabel.frame = CGRect(x: width * 0.5 - (width * 0.9 / 2), y: height * 0.5 - 16 + 40, width: width * 0.9, height: 34)
        view.addSubview(birthLabel)
        
        let saveName = UserDefaults.standard.object(forKey: "userName")
        let saveBirth = UserDefaults.standard.object(forKey: "userBirthDay")
        
        if let getName = saveName as? String {
            resultLabel.text = "Name : \(getName)"
        }
        
        if let getBirth = saveBirth as? String {
            birthLabel.text = "Birth Day : \(getBirth)"
        }
    }
    
    @objc func saveClick(){
        if nameTextField.text! != "" && birthTextField.text! != ""{
            UserDefaults.standard.set(nameTextField.text!, forKey: "userName")
            UserDefaults.standard.set(birthTextField.text!, forKey: "userBirthDay")
            
            resultLabel.text = "Name : \(nameTextField.text!)"
            birthLabel.text = "Birth Day : \(birthTextField.text!)"
            
            alertMessage(title: "Successful", message: "Registration Successful", buttonTitle: "OK")
            
        }else{
            alertMessage(title: "Eror", message: "Please enter data", buttonTitle: "OK")
        }
        
    }
    
    @objc func deleteClick(){
        
        if UserDefaults.standard.object(forKey: "userName") as? String != nil{
            UserDefaults.standard.removeObject(forKey: "userName")
            resultLabel.text = "Name : "
        }else{
            alertMessage(title: "Warning", message: "The object to be deleted was not found.", buttonTitle: "OK")
        }
        
        if UserDefaults.standard.object(forKey: "userBirthDay") as? String != nil{
            UserDefaults.standard.removeObject(forKey: "userBirthDay")
            birthLabel.text = "Birth Day : "
        }else{
            alertMessage(title: "Warning", message: "The object to be deleted was not found.", buttonTitle: "OK")
        }
    }
    
    @objc func alertMessage(title : String, message : String, buttonTitle : String){
        let alertMessage = UIAlertController.init(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction.init(title: buttonTitle, style: UIAlertAction.Style.default)
        alertMessage.addAction(okButton)
        self.present(alertMessage, animated: true, completion: nil)
    }


}

