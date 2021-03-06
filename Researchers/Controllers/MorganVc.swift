import UIKit
class MorganVc: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
       navigationController?.title = NSLocalizedString("morgan sample", comment: "morgan sample")
    }
    @IBOutlet weak var SampleNumber: UITextField!
    @IBOutlet weak var SampleResult: UILabel!
    @IBAction func Calc(_ sender: UIButton) {
        guard let samplevalue = SampleNumber.text?.trimmed, !samplevalue.isEmpty
            else {
                return
        }
        let numberformat = NumberFormatter()
        numberformat.locale = Locale(identifier: "EN")
        let final = numberformat.number(from:samplevalue )
        let population = Double(truncating: final!)
        let secoundvalue = population-1
        let formla = (population*0.25)/((secoundvalue*0.00065)+0.25)
        let result = formla.rounded()
        SampleResult.text = String(Int(result))
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }

}
