//
//  ViewController.swift
//  Useless_App
//
//  Created by Rayane Xavier on 15/04/20.
//  Copyright © 2020 Rayane Xavier. All rights reserved.
//

import CoreData
import UIKit

class ViewController: UIViewController {
    
    var dataManager = DataManager()

    @IBOutlet weak var NomeTextField: UITextField!
    
    @IBOutlet weak var CPFTextField: UITextField!
    
    @IBOutlet weak var RGTextField: UITextField!
    
    @IBOutlet weak var DataNascTextField: UITextField!
    
    @IBOutlet weak var PesoTextField: UITextField!
    
    @IBOutlet weak var EstadoCivilTextField: UITextField!
    
    @IBOutlet weak var EndereçoTextField: UITextField!
    
    @IBOutlet weak var NumeroTextField: UITextField!
    
    @IBOutlet weak var ComplementoTextField: UITextField!
    
    @IBOutlet weak var CEPTextField: UITextField!
    
    @IBOutlet weak var CidadeTextField: UITextField!
    
    @IBOutlet weak var UFTextField: UITextField!
    
    @IBOutlet weak var NomeMaeTextField: UITextField!
    
    @IBOutlet weak var NomePaiTextField: UITextField!
    
    @IBOutlet weak var EmailTextField: UITextField!
    
    @IBOutlet weak var TelefoneTextField: UITextField!
    
    @IBOutlet weak var CorFavTextField: UITextField!
    
    @IBOutlet weak var ComidaFavTextField: UITextField!
    
    @IBOutlet weak var SobremesaFavTextField: UITextField!
    
    @IBOutlet weak var EstiloMusicalTextField: UITextField!
    
    @IBOutlet weak var SaveButton: UIButton!
    
    var arrayTextField: [UITextField]!
    var arrayKeys: [String]!
        
    @IBAction func SaveButton(_ sender: Any) {
        percorrer()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func save(data: String, key: String) {
        let managedContext = dataManager.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Person", in: managedContext)!
        let inf = NSManagedObject(entity: entity, insertInto: managedContext)
        inf.setValue(data, forKey: key)
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func isEmpity(text: UITextField, key: String) {
        if text.text != nil || text.text != ""{
            save(data: text.text!, key: key)
        }
    }
    
    func percorrer() {
        arrayTextField = [NomeTextField, CPFTextField, RGTextField, DataNascTextField, PesoTextField, EstadoCivilTextField, EndereçoTextField, NumeroTextField, ComplementoTextField, CEPTextField, CidadeTextField, UFTextField, NomeMaeTextField, NomePaiTextField, EmailTextField, TelefoneTextField, CorFavTextField, ComidaFavTextField, SobremesaFavTextField, EstiloMusicalTextField]
        arrayKeys = ["nome","cpf","rg","dataNascimento","peso","estadoCivil","endereco","numero","complemento","cep","cidade","uf","nomeMae","nomePai","email","telefone","corFav","comidaFav","sobremesaFav","estiloMusical"]
        
        for i in 0...arrayTextField.count - 1 {
            isEmpity(text: arrayTextField[i], key: arrayKeys[i])
        }
    }
}
