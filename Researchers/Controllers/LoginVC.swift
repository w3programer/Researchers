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
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func LogIn(_ sender: Any){
        
        
    }
    
    @IBAction func Register(_ sender: UIButton) {
        self.performSegue(withIdentifier: "RegisterSegue", sender: sender)
        dismiss(animated: true, completion: nil)
        
    }

    //////////////
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Show the Navigation Bar
        //self.navigationController?.setNavigationBarHidden(true, animated: true)
        UIApplication.shared.statusBarStyle = .lightContent
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        // Hide the Navigation Bar
        //self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
}
