
import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var totalLabel: UILabel!
    var totalPerperson: Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = String(format: "%.2f", totalPerperson)

    }

    @IBAction func gobackButton(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
