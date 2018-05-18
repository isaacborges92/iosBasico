//
//  ViewController.swift
//  ProjetoApp
//
//  Created by Aluno on 12/05/18.
//  Copyright © 2018 CESAR School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let bancoRepository = Banco.instance
    
    @IBOutlet weak var btnEntrar: UIButton!
    @IBOutlet var texts: [UITextField] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnEntrar(_ sender: UIButton) {
        
        if(texts[0].text != ""){
            let usuario = bancoRepository.getUsuario(texts[0].text!)
            
            if(usuario != nil && usuario.getSenha() == texts[1].text){
                
                bancoRepository.setNomeUsuario(texts[0].text!)
                
                let story = UIStoryboard(name: "Main", bundle: nil)
                let vc = story.instantiateViewController(withIdentifier: "tela_operacoes") as? ViewControllerTable
                
                navigationController?.pushViewController(vc!, animated: true)
            }else{
                let alert = UIAlertController(title: "Atenção", message: "Usuário ou senha incorretos", preferredStyle: UIAlertControllerStyle.alert)
                // add an action (button)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                // show the alert
                self.present(alert, animated: true, completion: nil)
            }
        }else{
            let alert = UIAlertController(title: "Atenção", message: "Preencha todos os campos", preferredStyle: UIAlertControllerStyle.alert)
            // add an action (button)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            // show the alert
            self.present(alert, animated: true, completion: nil)
        }
    }


}

