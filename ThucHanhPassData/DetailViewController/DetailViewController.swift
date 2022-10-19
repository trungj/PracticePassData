//
//  DetailViewController.swift
//  ThucHanhPassData
//
//  Created by Tung on 18/10/2022.
//

import UIKit

protocol EditDelegate {
    func updateInfor(name: String, age: Int, country: String, job: String)
}

class DetailViewController: UIViewController {

    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var ageTF: UITextField!
    @IBOutlet weak var countryTF: UITextField!
    @IBOutlet weak var jobTF: UITextField!
    
    var personB: Person!
    
    // Closure
    var handleBack: (() -> Void)?
    
    // KHai báo protocol
    var delegate: EditDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupData()
    }
    
    func setupData() {
        nameTF.text = personB.name
        ageTF.text = "\(personB.age)"
        countryTF.text = personB.country
        jobTF.text = personB.job
    }
    
    @IBAction func actionBack(_ sender: UIButton) {
        handleBack?() // Gọi closure
        dismiss(animated: true)
    }
    
    @IBAction func actionEdit(_ sender: UIButton) {
        dismiss(animated: true) {
            self.delegate?.updateInfor(name: self.nameTF.text ?? "",
                                       age: Int(self.ageTF.text ?? "") ?? 0,
                                       country: self.countryTF.text ?? "",
                                       job: self.jobTF.text ?? "")
        }
    }
    

}
