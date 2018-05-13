import UIKit

class RegistrationVC: UIViewController ,UIPickerViewDelegate,UIPickerViewDataSource {
    var type = ""
    var degreevar = ""
    @IBOutlet var Name: UITextField!
    @IBOutlet var Email: UITextField!
    @IBOutlet var Phone: UITextField!
    @IBOutlet var Country: UITextField!
    @IBOutlet var Organization: UITextField!
    @IBOutlet var Specialization: UITextField!
    @IBOutlet var username: UITextField!
    @IBOutlet var password: UITextField!

    let typearr = ["إختر التخصص","باحث","محلل إحصائي","محكم","مدقق لغوي"]
    let degree = ["إختر الدرجه العلميه","دكتور","معيد","محاضر","أستاذ مساعد","أستاذ مشارك","أستاذ","طالب "]
   @IBOutlet var TypeOfUser: UIPickerView!
    
    @IBOutlet var Degree: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        TypeOfUser.dataSource = self
        TypeOfUser.delegate = self
        Degree.dataSource = self
        Degree.delegate = self
    self.hideKeyboardWhenTappedAround()

    }
    
  /*  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }*/
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == TypeOfUser{
            return typearr.count

        }else if pickerView == Degree {
            return degree.count

        }
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView == TypeOfUser{
            return typearr[row]

        }else if pickerView == Degree {
            return degree[row]

        }
        return ""
        
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        var title = ""
        if pickerView == TypeOfUser{
             title = typearr[row]
        }else if pickerView == Degree {
             title = degree[row]
        }
        
        let myytitle = NSAttributedString(string: title , attributes: [NSAttributedStringKey.font: UIFont(name:"Georgia",size: 30.0) ?? "Georgia",NSAttributedStringKey.foregroundColor : UIColor.white])
        return myytitle
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
      
        if pickerView == TypeOfUser{
          type = typearr[row]

        }else if pickerView == Degree {
           degreevar = degree[row]
        }
        
      
    }
    
    @IBAction func Register(_ sender: UIButton) {

        guard let name = Name.text,!name.isEmpty else {return}
        guard let username = username.text,!username.isEmpty else{return}
        guard let password = password.text?.trimmed else{return}
        guard let email = Email.text?.trimmed else{return}
        guard let phone = Phone.text?.trimmed else{return}
        
        Api.registration(name: name, username: username, password: password, email: email, phone: phone, country: Country.text!, degree: degreevar, company: Organization.text!, specialization: Specialization.text!, type: TypeOfUser.selectedRow(inComponent: 0).description, completion: { (error:Error?, success :Bool) in
           
            
            if success {
                
                
            }else{
                let title:String = NSLocalizedString("loginmessagehead", comment: "")
                let message:String = NSLocalizedString("connectionbody", comment: "")
                let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "ok", style: .destructive, handler: nil))
                self.present(alert,animated: true)
                
            }
        })
   
    }
    
    @IBAction func LogIn(_ sender: UIButton) {
        self.performSegue(withIdentifier: "LoginSegue", sender: self)
        
    }
   
    
}
