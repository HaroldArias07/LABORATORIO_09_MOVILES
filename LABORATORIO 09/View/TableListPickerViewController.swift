//
//  TableListPickerViewController.swift
//  LABORATORIO 09
//
//  Created by mbtec22 on 9/05/21.
//

import UIKit

class TableListPickerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var picker:[Picker] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            try picker = context.fetch(Picker.fetchRequest())
            tableView.reloadData()
        }
        catch {}
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let pick = picker[indexPath.row]
        if (pick.valoracion == "⭐⭐⭐⭐⭐" || pick.valoracion == "⭐⭐⭐⭐") {
            cell.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 0.75)
        } else if (pick.valoracion == "⭐⭐⭐" || pick.valoracion == "⭐⭐") {
            cell.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 0.75)
        } else {
            cell.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 0.75)
        }
        cell.textLabel?.text = pick.game
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return picker.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pick = picker[indexPath.row]
        performSegue(withIdentifier: "pickerSegue", sender: pick)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let siguienteVC = segue.destination as! NewPickerViewController
        siguienteVC.pick = sender as? Picker
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let game = picker[indexPath.row]
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            context.delete(game)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            do {
                picker = try context.fetch(Picker.fetchRequest())
                tableView.reloadData()
            } catch {}
        }
    }

    
}
