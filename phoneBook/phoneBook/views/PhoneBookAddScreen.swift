

import UIKit

class PhoneBookAddScreen: UIViewController {
    
    
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldNo: UITextField!
    
    var viewModel = AddScreenViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveButton(_ sender: UIButton) {
        if let name = textFieldName.text, let no = textFieldNo.text {
            viewModel.saveData(name: name, no: no)
        }
    }
    
    
    

}
