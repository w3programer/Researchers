import UIKit
@IBDesignable
class ViewController: UIViewController {
    var weburl = ""
    var uploadurl = ""
    var labletitle = ""
    ////
    @IBOutlet var RightConstrain: NSLayoutConstraint!
    
    @IBOutlet var LeftConstrain: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        UIView.appearance().semanticContentAttribute = .forceLeftToRight
        LeftConstrain.constant = 375
        RightConstrain.constant = 135

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        hideNavigationBar()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        showNavigationBar()
    }
 
    
    
    @IBOutlet var ContextView: UIView!
    var menuclose = false
    @IBAction func ContextMenu(_ sender: UIButton) {
        if menuclose == false {
            LeftConstrain.constant = 240
            RightConstrain.constant = 0
            menuclose = true
        }else{
            LeftConstrain.constant = 375
            RightConstrain.constant = 135
            menuclose = false

        }
      UIView.animate(withDuration: 0.3, animations: {self.view.layoutIfNeeded()})
    }
    
    @IBAction func Logout(_ sender: UIButton) {
        Helper.logout()
        self.performSegue(withIdentifier: "Logoutsegue", sender: self)
        //dismiss(animated: true, completion: nil)

    }
    
    @IBAction func DatabaseButton(_ sender: Any) {
        self.performSegue(withIdentifier: "DatabAseSegue", sender: sender)
       // dismiss(animated: true, completion: nil)
        
        
    }
    
    @IBAction func SamplesButton(_ sender: Any) {
        self.performSegue(withIdentifier: "SamplesSegue", sender: sender)
       // dismiss(animated: true, completion: nil)
        
        
    }
    
    @IBAction func TraningButton(_ sender: Any) {
        
        self.performSegue(withIdentifier: "TraningSegue", sender: sender)
       // dismiss(animated: true, completion: nil)
        
    }
    @IBAction func TranslationButton(_ sender: Any) {
        //
        self.performSegue(withIdentifier: "TranslationSegue", sender: sender)
        //dismiss(animated: true, completion: nil)
        
        
    }
    
    @IBAction func AuditButton(_ sender: Any) {
        weburl = "https://www.bibme.org/grammar-and-plagiarism/?=bmp_BM.A.300-250&intcid=wt.BibMe.BM.A.300-250&inhousead=BM.A.300-250"
        self.performSegue(withIdentifier: "WebViewSegue", sender: sender)
        //dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func ControleButton(_ sender: Any) {
        uploadurl = BaseUrl.arbitration
        labletitle = NSLocalizedString("Arbitration", comment: "title for Arbitration")

        self.performSegue(withIdentifier: "UploadSegue", sender: sender)
        // dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func DocumentationButton(_ sender: Any) {
        weburl = "http://www.bibme.org/items/new"
        self.performSegue(withIdentifier: "WebViewSegue", sender: sender)
       // dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func AnalysisButton(_ sender: Any) {
        uploadurl = BaseUrl.analyses
        labletitle = NSLocalizedString("Analysis", comment: "title for Analysis")

        self.performSegue(withIdentifier: "UploadSegue", sender: sender)
      // dismiss(animated: true, completion: nil)

    }
    @IBAction func Tracker(_ sender: Any) {
//        weburl = "https://www.bibme.org/grammar-and-plagiarism/?=bmp_BM.C.300-250&intcid=wt.BibMe.BM.C.300-250&inhousead=BM.C.300-250"
//        self.performSegue(withIdentifier: "WebViewSegue", sender: sender)
//       // dismiss(animated: true, completion: nil)
        uploadurl = BaseUrl.citation
        labletitle = NSLocalizedString("Citation", comment: "title for citation")
        self.performSegue(withIdentifier: "UploadSegue", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "WebViewSegue" {
            let destinationVC = segue.destination as! WebController
            destinationVC.curentUrl = weburl
            
        }
        if segue.identifier == "UploadSegue" {
            let destinationVC = segue.destination as! AnalysisANDArbitration
            destinationVC.Uploadurl = uploadurl
            destinationVC.labletitle = labletitle 
        }
       //
    }
  
    }



