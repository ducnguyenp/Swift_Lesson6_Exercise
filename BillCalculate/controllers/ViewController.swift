import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var TenButton: UIButton!
    @IBOutlet weak var FifthteenButton: UIButton!
    @IBOutlet weak var BillTotalText: UITextField!
    @IBOutlet weak var TwentyButton: UIButton!
    @IBOutlet weak var splitTextField: UITextField!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var calculateButton: UIButton!
    var currentTip = ""
    var billBrain = BillBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        splitTextField.text = String(stepper.value)
        TenButton.layer.cornerRadius = 10.0
        FifthteenButton.layer.cornerRadius = 10.0
        TwentyButton.layer.cornerRadius = 10.0
        calculateButton.layer.cornerRadius = 10.0
        
        
    }
    
    @IBAction func selectTip(_ sender: UIButton) {
        currentTip = sender.titleLabel?.text ?? ""
        
        TenButton.backgroundColor = UIColor.clear
        FifthteenButton.backgroundColor = UIColor.clear
        TwentyButton.backgroundColor = UIColor.clear
 
        
        switch currentTip {
        case "10%":
            TenButton.backgroundColor = UIColor.white
        case "15%":
            FifthteenButton.backgroundColor = UIColor.white
        default:
            TwentyButton.backgroundColor = UIColor.white
        }
        
    }
    
    @IBAction func stepperAction(_ sender: UIStepper) {
        splitTextField.text = String(sender.value)
    }
    
    @IBAction func calcualtedAction(_ sender: UIButton) {
        let billTotal = Float(BillTotalText.text ?? "") ?? 0
        let tip = Int(currentTip.dropLast()  ) ?? 0
        let split = Int(Float(splitTextField.text ?? "") ?? 00)
        billBrain.setTip(billTotal: billTotal, tip: tip, split: split)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let view = segue.destination as! SecondViewController
            view.totalPerperson = billBrain.bill?.totalPerPerson ?? 0.0
        }
    }
}

