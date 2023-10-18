//
//  Cell.swift
//  Day3
//
//  Created by ITBCA on 18/10/23.
//

import UIKit

class Cell: UITableViewCell {
    
    @IBOutlet weak var namaLabel: UILabel!
    @IBOutlet weak var gajiLabel: UILabel!
    @IBOutlet weak var umurLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setValue(employee: Employees) {
        namaLabel.text = employee.employee_name
        gajiLabel.text = "Rp. \(String(employee.employee_salary))"
        umurLabel.text = String(employee.employee_age)
    }
    
}
