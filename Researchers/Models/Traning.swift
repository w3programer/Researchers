
import Foundation
import  Alamofire
import  SwiftyJSON
extension Api{
    class var isconnectedtotheinternet:Bool{
        return NetworkReachabilityManager()!.isReachable
    }
    class func CoursesEXT(completion: @escaping (_ error : Error? , _ Courses: [AppCourses]?)->Void){
        let url = BaseUrl.courses
 
            Alamofire.request(url).responseJSON{response in
                
                switch response.result
                {
                case .failure(let error):
                    completion(error ,nil)
                    print( error)
                    
                    
                case .success(let value):
                    guard  let DataArr =  JSON(value).array else{
                        completion(nil, nil)
                        return
                    }
                    var courses = [AppCourses]()
                    for data in DataArr{
                        guard let data = data.dictionary  else {return}
                        let Datacourse = AppCourses()
                        Datacourse.course_id_pk = data["course_id_pk"]?.string ?? ""
                        Datacourse.course_name = data["course_name"]?.string ??  ""
                        Datacourse.course_date = data["course_date"]?.string ??  ""
                        Datacourse.course_days = data["course_days"]?.string ??  ""
                        Datacourse.course_capacity = data["course_capacity"]?.string ??  ""
                        Datacourse.course_funds = data["course_funds"]?.string ??  ""
                        Datacourse.course_desc = data["course_desc"]?.string ??  ""
                        Datacourse.course_image = data["course_image"]?.string ??  ""
                        
                        courses.append(Datacourse)
                    }
                    completion(nil, courses)
                    
                    
                }
                
            }
        
      
        
        
    }
}
