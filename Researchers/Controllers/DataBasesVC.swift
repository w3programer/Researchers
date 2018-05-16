import UIKit
class DataBasesVC: UIViewController {
    var weburl = ""
    override func viewDidLoad() {
        super.viewDidLoad()
       showNavigationBar()

    }
    
    @IBAction func KingFahedButton(_ sender: UIButton) {
        weburl = "http://ecat.kfnl.gov.sa:88/hipmain/"
        self.performSegue(withIdentifier: "WebViewSegue", sender: sender)
      //  dismiss(animated: true, completion: nil)
    }
    
    @IBAction func KsaDigtalLibrary(_ sender: UIButton) {
        weburl = "https://sdl.edu.sa/SDLPortal/Publishers.aspx"
        self.performSegue(withIdentifier: "WebViewSegue", sender: sender)
       // dismiss(animated: true, completion: nil)
    }
    
    @IBAction func KingAbdulaDigtalLibrary(_ sender: UIButton) {
        weburl = "http://libsierra.uqu.edu.sa/"
        self.performSegue(withIdentifier: "WebViewSegue", sender: sender)
       // dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "WebViewSegue" {
            let destinationVC = segue.destination as! WebController
            destinationVC.curentUrl = weburl
            
        }
    }
    


}
