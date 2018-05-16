import UIKit
import MobileCoreServices
class AnalysisANDArbitration: UIViewController {
    
    @IBOutlet var HeaderTitle: UILabel!
    var Uploadurl = ""
    var labletitle = ""
    @IBOutlet var FileTitle: UILabel!
    var uploadedfile = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        //print(Uploadurl)
        HeaderTitle.text = labletitle
    }
    
    @IBAction func SelectFile(_ sender: UIButton) {
      
        
        if Helper.getUserData() == true {
            let documentpiker = UIDocumentPickerViewController(documentTypes:   [kUTTypeContent as String], in: .import)
            documentpiker.delegate = self
            documentpiker.allowsMultipleSelection = false
            documentpiker.modalPresentationStyle = .formSheet
            present(documentpiker,animated: true,completion: nil)

        }else{
            let title:String = NSLocalizedString("message title", comment: "")
            let message:String = NSLocalizedString("you should register first", comment: "")
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok", style: .destructive, handler: nil))
            self.present(alert,animated: true)

        }
        
    
    
    
    }
    @IBAction func UploadButton(_ sender: UIButton) {
        if FileTitle.text=="" {
            let title:String = NSLocalizedString("message title", comment: "")
            let message:String = NSLocalizedString("you should select file first", comment: "")
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
            self.present(alert,animated: true)

        }else{
            let alert = UIAlertController(title: nil, message: NSLocalizedString("Please wait...", comment: "spinner"), preferredStyle: .alert)
            
            let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
            loadingIndicator.hidesWhenStopped = true
            loadingIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
            loadingIndicator.startAnimating();
            
            alert.view.addSubview(loadingIndicator)
            present(alert, animated: true, completion: nil)
            
            
            Api.uploadfiletoserver(url: Uploadurl, requestedfile: uploadedfile, useridfk: Helper.userid()) { (error:Error?, success :Bool) in
                if success {
                }else{
                    //print(error as Any)
                }
                self.dismiss(animated: false, completion: nil)
                
                let title:String = NSLocalizedString("message title", comment: "")
                let message:String = NSLocalizedString("message body", comment: "")
                let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
                self.present(alert,animated: true)
                
            }
        }
       
    }
}
extension AnalysisANDArbitration :UIDocumentPickerDelegate{
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        guard let selectedfileurl  = urls.first else {
            return
        }
        let fileext = selectedfileurl.pathExtension
        let filename = selectedfileurl.deletingPathExtension().lastPathComponent
         //print("\(filename+"."+fileext)")
        self.FileTitle.text = filename+"."+fileext
       // let encodedfile = selectedfileurl.absoluteString
       // self.uploadedfile = encodedfile.base64Encoded()!
        
        do{
            let filepath = selectedfileurl
            let filedata = try Data.init(contentsOf: filepath)
            let filestreem:String = filedata.base64EncodedString(options: NSData.Base64EncodingOptions.init(rawValue: 0))
           self.uploadedfile = filestreem
            //print(self.uploadedfile)
        }catch{
            print(error)
        }
    }
    
    
}

