//
//  ViewController.swift
//  customCell_by_xib
//
//  Created by Masato Yasuda on 2022/02/19.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.register(UINib(nibName: CustomCell.className, bundle: nil), forCellReuseIdentifier: CustomCell.className)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.className, for: indexPath) as! CustomCell
        return cell
    }
}
