import UIKit
class TraningVc: UIViewController ,UITableViewDelegate ,UITableViewDataSource {
   var courses = [AppCourses]()
    @IBOutlet var CourseTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(courses)
       CourseTable.dataSource = self
        CourseTable.delegate = self
        Api.CoursesEXT{(error :Error?, Courses: [AppCourses]?) in
            self.courses = Courses!
            self.CourseTable.reloadData()
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cel = CourseTable.dequeueReusableCell(withIdentifier: "Course") as! TraningViewCell
        cel.CourseTitle.text = courses[indexPath.row].course_name
        cel.CourseDetailes.text = courses[indexPath.row].course_desc
        cel.CourseDate.text = courses[indexPath.row].course_date
        cel.CourseAttendce.text = String(courses[indexPath.row].course_capacity)

        cel.CourseCost.text = courses[indexPath.row].course_funds
        cel.CourseDetailes.text = courses[indexPath.row].course_desc
        cel.CourseDate.text = courses[indexPath.row].course_date

        let urlString = BaseUrl.uploads+courses[indexPath.row].course_image
        let url = URL(string: urlString )
        print(courses[indexPath.row].course_image)
        cel.CourseImage.downloadedFrom(url: url!)
        return cel
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 600
    }

  
}
