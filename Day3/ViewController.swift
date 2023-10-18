//
//  ViewController.swift
//  Day3
//
//  Created by ITBCA on 18/10/23.
//

import UIKit
import Alamofire

private let profileCell = "Cell"

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var cellRow = 2
    var employeesData: [Employees] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData()
        
        tableView.register(
            UINib(
                nibName: "Cell",
                bundle: nil),
            forCellReuseIdentifier: profileCell)
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 216
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: profileCell, for: indexPath) as! Cell
        
        cell.setValue(employee: employeesData[indexPath.row])
        
        return cell
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employeesData.count
    }
}

// MARK: Alamofire
extension ViewController {
    func getData(){
        let urlString = "https://dummy.restapiexample.com/api/v1/employees"
        AF.request(urlString).responseDecodable(of: EmployeesDetails.self) { [self] response in
            switch response.result {
            case .success(let employees):
                print(employees.data)

                employeesData = employees.data
                print(employeesData)

                tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
        
//        guard let url = URL(string: urlString) else { return }
//        let urlConvertible: URLConvertible = url
//        AF.request(
//            urlConvertible,
//            method: .get
//        ).response { response in
//            if let responseData = response.data {
//                do {
//                    print(responseData)
//                    let data = try JSONDecoder().decode(EmployeesDetails.self, from: responseData)
//
//                    DispatchQueue.main.async { [weak self] in
//                        self?.employeesData = data.data
//                        self?.tableView.reloadData()
//                    }
//                } catch let err {
//                    print("Error: \(err)")
//                }
//            }
//        }
        
    }
}
