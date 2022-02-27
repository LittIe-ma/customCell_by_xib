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
    
    var dataArray = [TestData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    
    func getData() {
        let urlString = "https://jsonplaceholder.typicode.com/posts"
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data else { return }
            let decoder = JSONDecoder()
            let tempArray = try? decoder.decode([TestData].self, from: data)
            guard let unwrappedArray = tempArray else { return }
            self?.dataArray = unwrappedArray
            
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        task.resume()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.className, for: indexPath) as! CustomCell
        cell.dynamicLabel?.text = dataArray[indexPath.row].title
        return cell
    }
}


class TestData: Decodable {
    var id: Int?
    var title: String?
    var body: String?
    
    init(id: Int, title: String, body: String) {
        self.id = id
        self.title = title
        self.body = body
    }
}
