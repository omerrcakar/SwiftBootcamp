

import UIKit

class PhoneBookAddScreen: UIViewController {
    
    
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldNo: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveButton(_ sender: UIButton) {
        if let name = textFieldName.text, let no = textFieldNo.text {
            saveData(name: name, no: no)
        }
    }
    
    
    func saveData(name: String, no: String) {
        print("Name : \(name) - No : \(no)")
    }

}
