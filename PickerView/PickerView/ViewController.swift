
import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
   
    @IBOutlet var PickerView: UIPickerView!
    @IBOutlet weak var timeSegueLabel: UILabel!
    
    let minutes = Array(0...9)
    let seconds = Array(0...59)
    
    var recievedString: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        PickerView.delegate = self
        timeSegueLabel.text = recievedString
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        var row = PickerView.selectedRow(inComponent: 0)
        print("this is the pickerView\(row)")
        
        if component == 0 {
            return minutes.count
        }else{
            return seconds.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return String(minutes[row])
        }else{
            return String(seconds[row])
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let fcom = pickerView.selectedRow(inComponent: 0)
        let scom = pickerView.selectedRow(inComponent: 1)
        
        timeSegueLabel.text = "\("Minute is",minutes[fcom]) \n\("Seconds Is",seconds[scom])"
    }
}

