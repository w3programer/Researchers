import  UIKit
extension String{
    
    /// to delete withe space
    var trimmed: String{
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
}

extension UIViewController {
    func hideNavigationBar(){
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
    }
    
    func showNavigationBar() {
        // Show the navigation bar on other view controllers
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
}




