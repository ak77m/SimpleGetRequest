//
//  ViewController.swift
//  SimpleGetRequest
//
//  Created by ak77m on 18.02.2022.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet weak private var tableView: UITableView!
    
    @IBAction func clearUserDefaults(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "cache")
        
        let alert = UIAlertController(title: "Внимание", message: "Кеш очищен", preferredStyle: .alert)
        let action = UIAlertAction(title: "< Back", style: .default)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        reload()
        
    }
    
    @IBAction func refreshAction(_ sender: Any) {
        RequestManager.shared.standardRequest()
        reload()
    }
   
 
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
        
        RequestManager.shared.standardRequest()
        
    }
    
    func reload() {
        DispatchQueue.main.async { self.tableView.reloadData() }
    }
    
}
extension ViewController:UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! TableViewCell
        cell.picImageView.fetchImage(RequestManager.shared.myData[indexPath.row].url)
        cell.idLabel?.text = String(RequestManager.shared.myData[indexPath.row].id)
        cell.textBodyLabel?.text = RequestManager.shared.myData[indexPath.row].title
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

