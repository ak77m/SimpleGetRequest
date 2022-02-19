//
//  ViewController.swift
//  SimpleGetRequest
//
//  Created by ak77m on 18.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func clearUserDefaults(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "cache")
        
    }
    
    @IBAction func refreshAction(_ sender: Any) {
        RequestManager.shared.standardRequest()
        reload()
    }
   
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        RequestManager.shared.standardRequest()
        tableView.delegate = self
        tableView.dataSource = self
        
        
        
    }
    
    func reload() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
}
extension ViewController:UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath)
        cell.imageView?.fetchImage(RequestManager.shared.myData[indexPath.row].url)
        cell.textLabel?.text = RequestManager.shared.myData[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        RequestManager.shared.myData.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showPicture", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ImageViewController {
            destination.info =  RequestManager.shared.myData[tableView.indexPathForSelectedRow?.row ?? 0]
        }
    }
}

