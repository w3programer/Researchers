import UIKit
class TraningVc: UIViewController ,UITableViewDelegate ,UITableViewDataSource {
   var courses = [AppCourses]()
    @IBOutlet var CourseTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
       CourseTable.dataSource = self
        CourseTable.delegate = self
        CourseTable.separatorInset = .zero
        CourseTable.contentInset = .zero

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
        cel.CourseDate.text = courses[indexPath.row].course_date
        cel.CourseDate.text = courses[indexPath.row].course_date
        let urlString = BaseUrl.uploads+courses[indexPath.row].course_image
        let url = URL(string: urlString )
        cel.CourseImage.downloadedFrom(url: url!)
       // print(courses[indexPath.row].course_id_pk)

        return cel
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            performSegue(withIdentifier: "CourseDescSegue", sender: self)
        //print(indexPath.row)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 600
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? CourseDescVC {
            destination.resultdata = courses[(CourseTable.indexPathForSelectedRow?.row)!]

        }
    }
  
}
