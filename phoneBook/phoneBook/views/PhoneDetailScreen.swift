
import UIKit

class PhoneDetailScreen: UIViewController {

    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldNo: UITextField!
    
    
    var person: Phone?
    
    var viewModel = DetailScreenViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let person = person {
            textFieldName.text = person.kisi_ad
            textFieldNo.text = person.kisi_tel
        }
    }
    

    @IBAction func updateButton(_ sender: UIButton) {
        if let name = textFieldName.text , let no = textFieldNo.text {
            viewModel.updatePerson(person_id: person?.kisi_id ?? 0, person_name: name, person_no: no)
        }
        
    }
    
    
    

}
