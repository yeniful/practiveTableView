//
//  ViewController.swift
//  tableView1
//
//  Created by Yeni Hwang on 2021/07/15.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let cellIdentifier: String = "cell"
    
    let korean: [String] = ["가", "나", "다", "라", "마", "바", "사", "아", "자", "차", "카", "타", "파", "하"]
    let english: [String] = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "U", "V", "W", "X", "Y", "Z"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
}


extension ViewController: UITableViewDataSource {
    
    
    
    
    
    // 섹션의 개수
    func numberOfSections(in tableView: UITableView) -> Int {
            // korean section과 english section! 총 두 개이니까
            return 2
    }

    
    
    
    // korean 섹션, english 섹션마다 row 개수 다르게(각 배열의 원소 개수만큼) return할거야
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
    
    
    
    
    
    // section마다 title 붙여주기
    func tableView(_ tabelView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "한글" : "알파벳"
    }
    
    
    
    
    
    // cell 채워 넣기
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath ) -> UITableViewCell {
                // 셀의 재사용을 위해 dequeue한 것을 사용할거야
                let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
            
                // text는 indexPath의 section이 0일 때 korean section의 row를 가져올 거고, 아니면 english section의 row를 가져올거야
                let text: String = indexPath.section == 0 ? korean[indexPath.row] : english[indexPath.row]

                // 셀에 표현될 데이터
                cell.textLabel?.text = text

                return cell
    } // row마다 해당되는 cell을 돌려조

    
}

extension ViewController: UITableViewDelegate {
    
}
