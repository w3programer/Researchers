
import UIKit

class SampelsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        showNavigationBar()

    }
    
    @IBAction func MorganButton(_ sender: Any) {
        self.performSegue(withIdentifier: "MorganSegue", sender: sender)
    }
    
    @IBAction func OtherSampleSegue(_ sender: Any) {
        self.performSegue(withIdentifier: "WebSegue", sender: sender)
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "WebSegue" {
            let destinationVC = segue.destination as! WebController
            destinationVC.curentUrl = "http://www.macorr.com/sample-size-calculator.htm"
        }
    }
    
}
