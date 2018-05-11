import UIKit

class RegistrationVC: UIViewController ,UIPickerViewDelegate,UIPickerViewDataSource {
    
    let spiclization = ["إختر التخصص","باحث","محلل إحصائي","محكم","مدقق لغوي"]
    let degree = ["إختر الدرجه العلميه","دكتور","معيد","محاضر","أستاذ مساعد","أستاذ مشارك","أستاذ","طالب "]
   @IBOutlet var Spicialization: UIPickerView!
    
    @IBOutlet var Degree: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        Spicialization.dataSource = self
        Spicialization.delegate = self
        Degree.dataSource = self
        Degree.delegate = self

    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == Spicialization{
            return spiclization.count

        }else if pickerView == Degree {
            return degree.count

        }
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView == Spicialization{
            return spiclization[row]

        }else if pickerView == Degree {
            return degree[row]

        }
        return ""
        
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        var title = ""
        if pickerView == Spicialization{
             title = spiclization[row]
        }else if pickerView == Degree {
             title = degree[row]
        }
        
        let myytitle = NSAttributedString(string: title , attributes: [NSAttributedStringKey.font: UIFont(name:"Georgia",size: 30.0) ?? "Georgia",NSAttributedStringKey.foregroundColor : UIColor.white])
        return myytitle
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
      
        if pickerView == Spicialization{
       print(spiclization[row])
        }else if pickerView == Degree {
              print(degree[row])
        }
        
      
    }
    
}
