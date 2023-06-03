
import Foundation

struct BillBrain {
    var bill: Bill?
    
    mutating func setTip(billTotal: Float, tip: Int, split: Int) {
        let totalPerPerson = (billTotal * (Float(tip) / 100)) / Float(split )
        print(totalPerPerson)
       bill = Bill(billTotal: billTotal, tip: tip, split: split, totalPerPerson: totalPerPerson)
    }
}
