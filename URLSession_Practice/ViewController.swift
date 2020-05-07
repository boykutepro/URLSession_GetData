//
//  ViewController.swift
//  URLSession_Practice
//
//  Created by Thien Tung on 4/27/20.
//  Copyright © 2020 Thien Tung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var tableView: UITableView = {
        var view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(CustomCell.self, forCellReuseIdentifier: "Cell")
        return view
    } ()

    var arrayData: [Item] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(tableView)
        setupLayout()
        tableView.delegate = self
        tableView.dataSource = self
        
        let url = URL(string: "https://api.stackexchange.com/2.2/questions?order=desc&sort=votes&site=stackoverflow")!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in guard let data = data, let response = response as? HTTPURLResponse
                else { return }
            print(response.statusCode)
            
            if response.statusCode == 200 {
                do {
                    let reciveData = try JSONDecoder().decode(Items.self, from: data)
                    DispatchQueue.main.async {
                        self.arrayData = reciveData.items
                        self.tableView.reloadData()
                    }
                } catch {
                    print("error: \(error)")
                }
            }
        }
        
        dataTask.resume()
        
    }
    func setupLayout() {
      tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
      tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
      tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
      tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayData.count 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomCell
        cell.titleContentLabel.text = arrayData[indexPath.row].title
        cell.tagsContentLabel.text = arrayData[indexPath.row].tags.joined(separator: ", ")
        cell.answerCountContentLabel.text = "\(arrayData[indexPath.row].answer_count )"
        cell.scoreContentLabel.text = "\(arrayData[indexPath.row].score )"
        cell.linkContentTextView.text = arrayData[indexPath.row].link
        return cell
    }
    
    
}
