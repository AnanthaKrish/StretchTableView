//
//  ViewController.swift
//  StretchTableView
//
//  Created by Anantha Krishnan K G on 12/04/19.
//  Copyright © 2019 Ananth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    let imageView:UIImageView = {

        let imv = UIImageView(image: #imageLiteral(resourceName: "img1"))
        imv.frame = CGRect(x: 0, y: -20, width: UIScreen.main.bounds.width, height: 300)
        imv.contentMode = UIView.ContentMode.scaleToFill
        imv.translatesAutoresizingMaskIntoConstraints = false
        return imv
    }()
    @IBOutlet weak var strechyTableView: UITableView!
//    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        strechyTableView.delegate = self
        strechyTableView.dataSource = self
        strechyTableView.backgroundColor = .white
        
        strechyTableView.contentInset = UIEdgeInsets(top: -20, left: 0, bottom: 0, right: 0)
        strechyTableView.tableHeaderView = nil
        strechyTableView.tableHeaderView = imageView
        
    }


    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        print(scrollView.contentOffset.y)
        if scrollView.contentOffset.y < 0 {
            strechyTableView.contentInset = UIEdgeInsets(top: -20 - scrollView.contentOffset.y, left: 0, bottom: 0, right: 0)

        }
    }
}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "StretchyTableViewCell", for: indexPath) as! StretchyTableViewCell
        cell.indentationLevel = 2;
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100
    }

}

extension ViewController: UITableViewDelegate {
    
}
