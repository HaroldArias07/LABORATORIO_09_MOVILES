//
//  ArrayPickerController.swift
//  LABORATORIO 09
//
//  Created by mbtec22 on 9/05/21.
//

import UIKit

class ArrayPickerController: UIViewController {

    @IBOutlet weak var animeTextField: UITextField!
    @IBOutlet weak var musicTextField: UITextField!
    @IBOutlet weak var movieTextField: UITextField!
    @IBOutlet weak var gameTextField: UITextField!
    
    let animes = ["Dragon Ball Z", "Naruto", "Your Lie In April", "Re:Zero", "Kaguya-Sama"]
    let musics = ["See You Againg", "We Dont Talk Anymore", "One Call Away", "Attention", "How Long"]
    let movies = ["Fast And Furious", "Attack The White House", "2012", "Chucky", "Freddy vs Jason"]
    let games = ["League of Legends", "Minecraft", "PUBG", "Genshin Impact", "Resident Evil"]
    
    var animePickerView = UIPickerView()
    var musicPickerView = UIPickerView()
    var moviePickerView = UIPickerView()
    var gamePickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animeTextField.inputView = animePickerView
        musicTextField.inputView = musicPickerView
        movieTextField.inputView = moviePickerView
        gameTextField.inputView = gamePickerView
        
        animePickerView.delegate = self
        animePickerView.dataSource = self
        musicPickerView.delegate = self
        musicPickerView.dataSource = self
        moviePickerView.delegate = self
        moviePickerView.dataSource = self
        gamePickerView.delegate = self
        gamePickerView.dataSource = self
        
        animePickerView.tag = 1
        musicPickerView.tag = 2
        moviePickerView.tag = 3
        gamePickerView.tag = 4
    }

}

extension ArrayPickerController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
            case 1:
                return animes.count
            case 2:
                return musics.count
            case 3:
                return movies.count
            case 4:
                return games.count
            default:
                return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
            case 1:
                return animes[row]
            case 2:
                return musics[row]
            case 3:
                return movies[row]
            case 4:
                return games[row]
            default:
                return "Data not Found"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
            case 1:
                animeTextField.text = animes[row]
                animeTextField.resignFirstResponder()
            case 2:
                musicTextField.text = musics[row]
                musicTextField.resignFirstResponder()
            case 3:
                movieTextField.text = movies[row]
                movieTextField.resignFirstResponder()
            case 4:
                gameTextField.text = games[row]
                gameTextField.resignFirstResponder()
            default:
                return
        }
    }
    
}
