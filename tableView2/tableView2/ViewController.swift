//
//  ViewController.swift
//  tableView2
//
//  Created by Yeni Hwang on 2021/07/15.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var cellIdentifier: String = "cell"
    
    let korean: [String] = ["가", "나", "다", "라", "마", "바", "사", "아", "자", "차", "카", "타", "파", "하"]
    let english: [String] = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "U", "V", "W", "X", "Y", "Z"]
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
}

extension ViewController: UITableViewDataSource {
    
    // 섹션 수
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    // 섹션별 줄 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return korean.count
        case 1:
            return english.count
        default:
            return 0
        }
    }
    
    // 섹션별 제목
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int ) -> String? {
        return section == 0 ? "한글" : "알파벳"
    }

    // 셀 체우기
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Fetch a cell of the appropriate type.
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
       
        let text: String = indexPath.section == 0 ? korean[indexPath.row] : english [indexPath.row]
        
        // Configure the cell’s contents.
        cell.textLabel?.text = text
           
       return cell
    }
    
}

extension ViewController: UITableViewDelegate {}

