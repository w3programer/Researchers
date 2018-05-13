
import UIKit

class TraningViewCell: UITableViewCell {

    @IBOutlet var CourseTitle: UILabel!
    
    @IBOutlet var CourseDate: UILabel!
    
    @IBOutlet var CourseImage: UIImageView!
    
    @IBOutlet var CourseCost: UILabel!
    
    @IBOutlet var CourseAttendce: UILabel!
    
    @IBOutlet var CourseDetailes: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
