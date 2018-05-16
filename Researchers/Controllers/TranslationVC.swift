import UIKit
class TranslationVC: UIViewController {
    var urlstr = ""
    var uploadurl = ""
    var labletitle = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func FreeTranslation(_ sender: UIButton) {
        self.performSegue(withIdentifier: "FreeTranslationSegue", sender: sender )
        //dismiss(animated: true, completion: nil)
    }
    
    @IBAction func AdvancedTranslation(_ sender: UIButton) {
        uploadurl = BaseUrl.translation
        labletitle = NSLocalizedString("Advanced Translation", comment: "title for Advanced Translation")

        self.performSegue(withIdentifier: "UploadSegue", sender: sender )
       // dismiss(animated: true, completion: nil)
        
    }
   
 //////links
    
    @IBAction func babelfish(_ sender: UIButton) {
        urlstr = "https://www.babelfish.com/"
        
        self.performSegue(withIdentifier: "WebViewSegue", sender: sender )
       // dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func wordreference(_ sender: Any) {
        urlstr = "http://www.wordreference.com/"
        
        self.performSegue(withIdentifier: "WebViewSegue", sender: sender )
       // dismiss(animated: true, completion: nil)
    }
    
    @IBAction func freetranslation(_ sender: Any) {
        urlstr = "https://www.freetranslation.com/"
        
        self.performSegue(withIdentifier: "WebViewSegue", sender: sender )
       // dismiss(animated: true, completion: nil)
    }
    @IBAction func PromtOnline(_ sender: UIButton) {
        urlstr = "http://translation2.paralink.com/"
        
        self.performSegue(withIdentifier: "WebViewSegue", sender: sender )
       // dismiss(animated: true, completion: nil)
    }
    @IBAction func doctranslator(_ sender: UIButton) {
        urlstr = "https://www.onlinedoctranslator.com/translationform"
        
        self.performSegue(withIdentifier: "WebViewSegue", sender: sender )
       // dismiss(animated: true, completion: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "WebViewSegue" {
            let destinationVC = segue.destination as! WebController
            destinationVC.curentUrl = urlstr
            
        }
        if segue.identifier == "UploadSegue" {
            let destinationVC = segue.destination as! AnalysisANDArbitration
            destinationVC.Uploadurl = uploadurl
            destinationVC.labletitle = labletitle

        }
    }
 ///// advanced translation
    
    
}
