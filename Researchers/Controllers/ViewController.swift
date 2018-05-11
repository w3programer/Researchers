import UIKit

class ViewController: UIViewController {
    var weburl = ""
    ////
    @IBOutlet var Database: UIButton!
    @IBOutlet var Samples: UIButton!
    @IBOutlet var translation: UIButton!
    
    @IBOutlet var Traning: UIButton!
    
    @IBOutlet var arbitration: UIButton!
    @IBOutlet var audit: UIButton!
    
    @IBOutlet var documentation: UIButton!
    
    @IBOutlet var spss: UIButton!
    @IBOutlet var services: UIButton!
    
    @IBOutlet var citation: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIView.appearance().semanticContentAttribute = .forceLeftToRight
        translationstring()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        hideNavigationBar()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        showNavigationBar()
    }
    @IBAction func DatabaseButton(_ sender: Any) {
        self.performSegue(withIdentifier: "DatabAseSegue", sender: sender)
        dismiss(animated: true, completion: nil)
        
        
    }
    
    @IBAction func SamplesButton(_ sender: Any) {
        self.performSegue(withIdentifier: "SamplesSegue", sender: sender)
        dismiss(animated: true, completion: nil)
        
        
    }
    
    @IBAction func TraningButton(_ sender: Any) {
        
        self.performSegue(withIdentifier: "CourcesSegue", sender: sender)
        dismiss(animated: true, completion: nil)
        
    }
    @IBAction func TranslationButton(_ sender: Any) {
        //
        self.performSegue(withIdentifier: "TranslationSegue", sender: sender)
        dismiss(animated: true, completion: nil)
        
        
    }
    
    @IBAction func AuditButton(_ sender: Any) {
        weburl = "https://www.bibme.org/grammar-and-plagiarism/?=bmp_BM.A.300-250&intcid=wt.BibMe.BM.A.300-250&inhousead=BM.A.300-250"
        self.performSegue(withIdentifier: "WebViewSegue", sender: sender)
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func ControleButton(_ sender: Any) {
        self.performSegue(withIdentifier: "ArbitrationSegue", sender: sender)
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func DocumentationButton(_ sender: Any) {
        weburl = "http://www.bibme.org/items/new"
        self.performSegue(withIdentifier: "WebViewSegue", sender: sender)
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func AnalysisButton(_ sender: Any) {
        
        self.performSegue(withIdentifier: "AnalysisSegue", sender: sender)
        dismiss(animated: true, completion: nil)

    }
    
    
    @IBAction func Tracker(_ sender: Any) {
        weburl = "https://www.bibme.org/grammar-and-plagiarism/?=bmp_BM.C.300-250&intcid=wt.BibMe.BM.C.300-250&inhousead=BM.C.300-250"
        self.performSegue(withIdentifier: "WebViewSegue", sender: sender)
        dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "WebViewSegue" {
            let destinationVC = segue.destination as! WebController
            destinationVC.curentUrl = weburl
            
        }
        
    }
    
    func translationstring()  {
  /*
         Database.titleLabel?.text = NSLocalizedString("Databases", comment: "")
         Samples.titleLabel?.text = NSLocalizedString("Samples", comment: "")
         Traning.titleLabel?.text = NSLocalizedString("Traning", comment: "")
         
         translation.titleLabel?.text = NSLocalizedString("Translation", comment: "")
         audit.titleLabel?.text = NSLocalizedString("Audit", comment: "")
         arbitration.titleLabel?.text = NSLocalizedString("Arbitration", comment: "")
         spss.titleLabel?.text = NSLocalizedString("analysis", comment: "")
         
         documentation.titleLabel?.text = NSLocalizedString("documentation", comment: "")
         citation.titleLabel?.text = NSLocalizedString("citation", comment: "")
         
         services.titleLabel?.text = NSLocalizedString("services", comment: "")
         */
    }
}


