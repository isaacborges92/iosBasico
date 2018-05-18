//
//  ViewControllerCadastro.swift
//  ProjetoApp
//
//  Created by Aluno on 16/05/18.
//  Copyright © 2018 CESAR School. All rights reserved.
//

import UIKit

class ViewControllerCadastro: UIViewController {

    let bancoRepository = Banco.instance
    
    @IBOutlet weak var btnCadastrar: UIButton!
    @IBOutlet var texts: [UITextField] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnCadastrarClick(_ sender: UIButton) {
        
        if(texts[0].text != "" && texts[1].text != "" && texts[2].text != ""){
            let u = Usuario()
            let saldo = texts[2].text!
            let val = Double(saldo)
        
            u.setNome(texts[0].text!)
            u.setSenha(texts[1].text!)
            u.setSaldo(val!)
        
            bancoRepository.insertUsuario(u: u)
            
            let story = UIStoryboard(name: "Main", bundle: nil)
            let vc = story.instantiateViewController(withIdentifier: "tela_login") as? ViewController
            
            navigationController?.pushViewController(vc!, animated: true)
        }else{
            let alert = UIAlertController(title: "Atenção", message: "Preencha todos os campos", preferredStyle: UIAlertControllerStyle.alert)
            
            // add an action (button)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            
            // show the alert
            self.present(alert, animated: true, completion: nil)
        }
    }

}
