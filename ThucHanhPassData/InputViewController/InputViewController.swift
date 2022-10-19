//
//  InputViewController.swift
//  ThucHanhPassData
//
//  Created by Tung on 18/10/2022.
//

import UIKit

class InputViewController: UIViewController {
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var ageTF: UITextField!
    @IBOutlet weak var countryTF: UITextField!
    @IBOutlet weak var jobTF: UITextField!
    
    var person = Person(name: "", age: 0, country: "", job: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .brown
        nameTF.delegate = self
        ageTF.delegate = self
        countryTF.delegate = self
        jobTF.delegate = self
    }

    @IBAction func actionDetails(_ sender: UIButton?) {
        person.name = nameTF.text ?? ""
        person.age = Int(ageTF.text ?? "") ?? 0
        person.country = countryTF.text ?? ""
        person.job = jobTF.text ?? ""
        
        let detailVC = DetailViewController()
        detailVC.personB = self.person
        // Gán closure màn B
        detailVC.handleBack = {
            self.nameTF.text = ""
            self.ageTF.text = ""
            self.countryTF.text = ""
            self.jobTF.text = ""
        }
        
        // nhận sự uỷ quyền
        detailVC.delegate = self
        
        detailVC.modalPresentationStyle = .fullScreen
        present(detailVC, animated: true)
    }
}

extension InputViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameTF {
            nameTF.resignFirstResponder()
            ageTF.becomeFirstResponder()
        } else if textField == ageTF {
            ageTF.resignFirstResponder()
            countryTF.becomeFirstResponder()
        } else if textField == countryTF {
            countryTF.resignFirstResponder()
            jobTF.becomeFirstResponder()
        } else {
            jobTF.resignFirstResponder()
            actionDetails(nil)
        }
        
        return true
    }
}

extension InputViewController: EditDelegate {
    func updateInfor(name: String, age: Int, country: String, job: String) {
        nameTF.text = name
        ageTF.text = "\(age)"
        countryTF.text = country
        jobTF.text = job
    }
}
