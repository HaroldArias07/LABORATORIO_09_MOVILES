//
//  NewPickerViewController.swift
//  LABORATORIO 09
//
//  Created by mbtec22 on 9/05/21.
//

import UIKit

class NewPickerViewController: UIViewController {

    @IBOutlet weak var gameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var ratingTextField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    
    let games = ["League of Legends", "Minecraft", "Dota 2", "PUBG", "Genshin Impact", "Resident Evil", "CSGO", "Half Life"]
    let valoraciones = ["⭐","⭐⭐","⭐⭐⭐","⭐⭐⭐⭐","⭐⭐⭐⭐⭐"]
    
    var pick : Picker? = nil
    var namePickerView = UIPickerView()
    var ratingPickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.inputView = namePickerView
        ratingTextField.inputView = ratingPickerView
        
        namePickerView.delegate = self
        namePickerView.dataSource = self
        ratingPickerView.delegate = self
        ratingPickerView.dataSource = self
        
        if pick != nil{
            nameTextField.text = pick!.game
            ratingTextField.text = pick!.valoracion
            
            gameLabel.text = "Edit a Game"
            ratingLabel.text = "Edit Rating"
            
            addButton.setTitle("Edit", for: .normal)
            addButton.layer.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        }
        
        namePickerView.tag = 1
        ratingPickerView.tag = 2
    }

    @IBAction func newTapped(_ sender: Any) {
        if pick != nil {
            pick!.game = nameTextField.text
            pick!.valoracion = ratingTextField.text
        }
        else {
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let pick = Picker(context: context)
            pick.game = nameTextField.text
            pick.valoracion = ratingTextField.text
        }
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController!.popViewController(animated: true)
    }
}

extension NewPickerViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
            case 1:
                return games.count
            case 2:
                return valoraciones.count
            default:
                return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
            case 1:
                return games[row]
            case 2:
                return valoraciones[row]
            default:
                return "Data not Found"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
            case 1:
                nameTextField.text = games[row]
                nameTextField.resignFirstResponder()
            case 2:
                ratingTextField.text = valoraciones[row]
                ratingTextField.resignFirstResponder()
            default:
                return
        }
    }
    
}
