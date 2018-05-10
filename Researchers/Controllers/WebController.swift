
import UIKit
import WebKit

class WebController: UIViewController {
    @IBOutlet var WebView: WKWebView!
    var curentUrl : String?
    override func viewDidLoad() {
        showNavigationBar()
        super.viewDidLoad()
        let myURL = URL(string: curentUrl!)
        let myRequest = URLRequest(url: myURL!)
        WebView.load(myRequest)
    }
}
