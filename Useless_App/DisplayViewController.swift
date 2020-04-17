//
//  DisplayViewController.swift
//  Useless_App
//
//  Created by Rayane Xavier on 17/04/20.
//  Copyright © 2020 Rayane Xavier. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class DisplayViewController: UIViewController {
    
    @IBOutlet weak var NomeLabel: UILabel!
    @IBOutlet weak var RGLabel: UILabel!
    @IBOutlet weak var CPFLabel: UILabel!
    @IBOutlet weak var DatadeNascLabel: UILabel!
    @IBOutlet weak var PesoLabel: UILabel!
    @IBOutlet weak var EstadoLabel: UILabel!
    @IBOutlet weak var EndereçoLabel: UILabel!
    @IBOutlet weak var NumeroLabel: UILabel!
    @IBOutlet weak var ComplementoLabel: UILabel!
    @IBOutlet weak var CEPLabel: UILabel!
    @IBOutlet weak var CidadeLabel: UILabel!
    @IBOutlet weak var UFLabel: UILabel!
    @IBOutlet weak var NomeMaeLabel: UILabel!
    @IBOutlet weak var NomePaiLabel: UILabel!
    @IBOutlet weak var EmailLabel: UILabel!
    @IBOutlet weak var TelefoneLabel: UILabel!
    @IBOutlet weak var CorFavLabel: UILabel!
    @IBOutlet weak var ComidaFavLabel: UILabel!
    @IBOutlet weak var SobremesaLabel: UILabel!
    @IBOutlet weak var EstiloMusicalLabel: UILabel!
    
    var arrayLabels: [UILabel]!
    var arrayKeys: [String]!
    
    var dataManager = DataManager()
    var data: [NSManagedObject]!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadData()
        loadLabels()
    }
    
    func loadData() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Person")
        let context = dataManager.persistentContainer.viewContext
        do {
            let result = try context.fetch(fetchRequest)
            data = result as? [NSManagedObject]
        } catch {
            fatalError("Error is retriving titles items")
        }
    }
    
    func loadLabels() {
        arrayLabels = [NomeLabel, CPFLabel, RGLabel, DatadeNascLabel, PesoLabel, EstadoLabel, EndereçoLabel, NumeroLabel, ComplementoLabel, CEPLabel, CidadeLabel, UFLabel, NomeMaeLabel, NomePaiLabel, EmailLabel, TelefoneLabel, CorFavLabel, ComidaFavLabel, SobremesaLabel, EstiloMusicalLabel]
        
        arrayKeys = ["nome","cpf","rg","dataNascimento","peso","estadoCivil","endereco","numero","complemento","cep","cidade","uf","nomeMae","nomePai","email","telefone","corFav","comidaFav","sobremesaFav","estiloMusical"]
        
        for i in 0...arrayLabels.count - 1 {
            arrayLabels[i].text = data[i].value(forKey: arrayKeys[i]) as? String
        }
    }
}
