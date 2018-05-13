import UIKit
class LoginVC: UIViewController {

    
    @IBOutlet var EscapBut: UIButton!
    @IBOutlet var LogIn: UIButton!
    @IBOutlet var Register: UIButton!
    @IBOutlet var UserName: UITextField!
    @IBOutlet var Password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideNavigationBar()
    }
    @IBAction func EscapeBut(_ sender: Any) {
        self.performSegue(withIdentifier: "HomeSegue", sender: sender)
       // dismiss(animated: true, completion: nil)
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

    //////////////
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.shared.statusBarStyle = .lightContent
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    
}
