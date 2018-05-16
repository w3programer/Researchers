import UIKit
class LoginVC: UIViewController {

    
    @IBOutlet var UserName: UITextField!
    @IBOutlet var Password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if Helper.getUserData() == true {
            self.performSegue(withIdentifier: "GoHome", sender: self)
          
        }


    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        hideNavigationBar()
        
        UIApplication.shared.statusBarStyle = .lightContent

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        showNavigationBar()
    }
    
    @IBAction func EscapeBut(_ sender: Any) {
        let VC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Home")
        self.navigationController?.pushViewController(VC, animated: true)

    }
    
    @IBAction func LogIn(_ sender: Any){
     
        
        guard let name = UserName.text,!name.isEmpty else {return}
        guard let pass = Password.text,!pass.isEmpty else{return}
        Api.login(username: name, password: pass) { (error:Error?, success :Bool) in
            if success {
            
                
            }else{
                let title:String = NSLocalizedString("loginmessagehead", comment: "")
                let message:String = NSLocalizedString("connectionbody", comment: "")
                let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "ok", style: .destructive, handler: nil))
                self.present(alert,animated: true)
                
            }
        }   
    }
    
    @IBAction func Register(_ sender: UIButton) {
        self.performSegue(withIdentifier: "RegisterSegue", sender: sender)
       // dismiss(animated: true, completion: nil)
        
    }

  
    
  
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    
}
