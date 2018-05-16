 import Foundation
 import  Alamofire
 import  SwiftyJSON
 extension Api{
    class func bookcourse(courseid:Int ,useridfk:Int ,completion:@escaping(_ error :Error? ,_ success :Bool)->Void){
        let url = BaseUrl.bookcourse
        let parameters = [
            "course_id_fk":courseid,
            "user_id_fk": useridfk
            ] as [String : Any]
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            .validate(statusCode:200..<300)
            .responseJSON { response in
                switch response.result
                {
                case .failure( let error):
                    completion(error , false)
                case .success(let value):
                    var data = JSON(value)
                    if  (data["message"].int == 1) {
                        completion(nil ,true)
                    }else{
                        
                        completion(nil , false)
                    }
                    
                }
                
        }
        
    }
    
 }
