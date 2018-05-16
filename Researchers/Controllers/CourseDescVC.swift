import UIKit
class CourseDescVC: UIViewController {
    
    var resultdata:AppCourses?

    @IBOutlet var CourseCouvre: UIImageView!
    @IBOutlet var Coursetitle: UILabel!
    
    @IBOutlet var CourseDate: UILabel!
    
    @IBOutlet var Attendance: UILabel!
    
    @IBOutlet var Funds: UILabel!
    
    @IBOutlet var Desc: UILabel!
    var courseid = ""
     override func viewDidLoad() {
        super.viewDidLoad()
        courseid = (resultdata?.course_id_pk)!
        Desc.text = resultdata?.course_desc
        Coursetitle.text = resultdata?.course_name
        CourseDate.text = resultdata?.course_date
        Funds.text = (resultdata?.course_funds)!+" SR"
        Attendance.text = resultdata?.course_capacity
        let urlstr = BaseUrl.uploads+(resultdata?.course_image)!
        
        let url = URL(string: urlstr)
                CourseCouvre.downloadedFrom(url: url!)
    }

    
    
    @IBAction func BookNow(_ sender: UIButton) {
        Api.bookcourse(courseid:Int(courseid)!, useridfk: Helper.userid()) { (error:Error?, success :Bool) in
            if success  {

                self.dismiss(animated: false, completion: nil)
                let title:String = NSLocalizedString("message title", comment: "")
                let message:String = NSLocalizedString("message body", comment: "")
                let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
                self.present(alert,animated: true)
            }else{
                self.dismiss(animated: false, completion: nil)
                let title:String = NSLocalizedString("error", comment: "")
                let message:String = NSLocalizedString("error mwssage", comment: "")
                let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "ok", style: .destructive, handler: nil))
                self.present(alert,animated: true)
            }
            
        }
    }
    
}
