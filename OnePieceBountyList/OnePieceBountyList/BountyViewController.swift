//
//  BountyViewController.swift
//  OnePieceBountyList
//
//  Created by Yeni Hwang on 2021/07/19.
//

import UIKit

class BountyViewController: UIViewController {

    let nameList: [String] = ["Brook", "Chopper", "Franky", "Luffy", "Nami", "Robin", "Sanji", "Zoro"]
    let bountyList: [Int] = [33000000, 50, 4400000, 300000000, 160000000, 800000000, 77000000, 1200000000]
  
    // DetailViewController에게 Data 전달
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "showDetail" {
        let vc = segue.destination as? DetailViewController
            if let index = sender as? Int {
                vc?.name = nameList[index]
                vc?.bounty = bountyList[index]
            }
        
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

// DataSource
extension BountyViewController: UITableViewDataSource {
    
    // 섹션당 행의 수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bountyList.count
    }
    
    // 셀 채워넣기
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell else {
            return UITableViewCell()
        }
        let photo = UIImage(named: "\(nameList[indexPath.row]).jpg")
        cell.imageView?.image = photo
        cell.nameLabel.text = nameList[indexPath.row]
        cell.bountyLabel.text = "\(bountyList[indexPath.row])"
        
        return cell
    }
}

// Delegate
extension BountyViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("--> \(indexPath.row)")
        performSegue(withIdentifier: "showDetail", sender: indexPath.row)
    }
}


// Custrom Cell
class ListCell: UITableViewCell {
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
}
