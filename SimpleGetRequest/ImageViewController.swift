//
//  ImageViewController.swift
//  SimpleGetRequest
//
//  Created by ak77m on 18.02.2022.
//

import UIKit

final class ImageViewController: UIViewController {

    @IBOutlet weak private var dateTimeLabel: UILabel!
    @IBOutlet weak private var imageView: UIImageView!
    
    var info:JsonStruct?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy hh:mm:ss"
        dateTimeLabel.text = info?.date?.formattedString()
        imageView.fetchImage(info?.url ?? "")
    }

}
