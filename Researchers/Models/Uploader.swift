 import Foundation
 import  Alamofire
 import  SwiftyJSON
 extension Api{
 class func uploadfiletoserver(url:String,requestedfile:String ,useridfk:Int ,completion:@escaping(_ error :Error? ,_ success :Bool)->Void){
    let url = url
    let parameters = [
        "requested_file":requestedfile,
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
                let data = JSON(value)
                if  (data["message"].int != 0) {
                    print("success uploading file")
                    completion(nil ,true)
                }else{
                    print("error while uploade")
                    completion(nil , false)
                }
                
            }
            
    }
    
    }
    
 }
