//
//  DetailViewController.swift
//  OnePieceBountyList
//
//  Created by Yeni Hwang on 2021/07/19.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    
    var name: String?
    var bounty: Int?
    
    // 닫기 버튼
    @IBAction func closeButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func updateUI() {
        if let name = self.name, let bounty = self.bounty{
            let photo = UIImage(named: "\(name).jpg")
            photoView.image = photo
            nameLabel.text = name
            bountyLabel.text = "\(bounty)"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
}

