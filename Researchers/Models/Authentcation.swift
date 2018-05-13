import UIKit
import Alamofire
import  SwiftyJSON
class Api: NSObject {
    ///////  login
    class func login(username:String ,password:String ,completion:@escaping(_ error :Error? ,_ success :Bool)->Void){
        let url = BaseUrl.login
        let parameters = [
            "user":username,
            "user_pass": password
        ]
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            .validate(statusCode:200..<300)
            .responseJSON { response in
                switch response.result
                {
                case .failure( let error):
                    completion(error , false)
                case .success(let value):
                    let data = JSON(value)
                    var user_id : Int = 0
                    var user_name : String = ""
                    var user_phone : Int = 0
                    var user_email :String = ""

                    
                    if  (data["message"].int != 0) {
                        ///////
                         user_id = Int(data["user_id"].string!)!
                        user_name = data["user_name"].string!
                        user_phone = Int(data["user_phone"].string!)!
                        user_email = data["user_email"].string!
                        /////////
                        Helper.setUserData(user_id: user_id, user_email: user_email, user_name: user_name, user_phone: user_phone)
                        completion(nil ,true)
                    }else{
                        completion(nil , false)
                    }
                    
                }
                
        }
        
    }
    ///////  registration
    class func registration(
                            name:String ,
                            username:String ,
                            password:String ,
                            email:String,
                            phone:String,
                            country:String,
                            degree:String,
                            company:String,
                            specialization:String,
                            type:String,
                            completion:@escaping(_ error :Error? ,_ success :Bool)->Void){
        let url = BaseUrl.register
        let parameters = [
            "user_name":name,
            "user_username":username,
            "user_pass": password,
            "user_email":email,
            "user_phone": phone,
            "user_country": country,
            "degree":degree,
            "company": company,
            "specialization":specialization,
            "user_type":type
            ] as [String : Any]
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            .validate(statusCode:200..<300)
            .responseJSON { response in
                switch response.result
                {
                case .failure( let error):
                    completion(error , false)
                case .success(let value):
                    let data = JSON(value)
                    
                    if  (data["message"].int == 1) {
                        
                        ///////
                        let user_id = Int(data["user_id"].string!)!
                        let user_name = data["user_name"].string
                        let user_phone = Int(data["user_phone"].string!)
                        let user_email = data["user_email"].string
                        /////////
                        Helper.setUserData(user_id: user_id, user_email: user_email!, user_name: user_name!, user_phone: user_phone!)
                        completion(nil ,true)
                    }
                }
                
        }
        
    }
}
