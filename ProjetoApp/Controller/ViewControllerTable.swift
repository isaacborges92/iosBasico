//
//  ViewControllerTable.swift
//  ProjetoApp
//
//  Created by Aluno on 12/05/18.
//  Copyright © 2018 CESAR School. All rights reserved.
//

import UIKit

class ViewControllerTable: UIViewController, UITableViewDelegate,UITableViewDataSource {

    let bancoRepository = Banco.instance
    var usuario = Usuario()
    
    @IBOutlet weak internal var myTable: UITableView!
    @IBOutlet weak var lblSaldo: UILabel!
    @IBOutlet weak var btnDepositar: UIButton!
    @IBOutlet weak var btnSacar: UIButton!
    
    func showInputDialog(operacao: String, mensagem: String) {
        //Creating UIAlertController and
        //Setting title and message for the alert dialog
        let alertController = UIAlertController(title: operacao, message: mensagem, preferredStyle: .alert)
        
        //the confirm action taking the inputs
        let confirmAction = UIAlertAction(title: "Confirmar", style: .default) { (_) in
            
            //getting the input values from user
            let vl = (alertController.textFields?[0].text as! NSString).doubleValue
            
            if vl > 0{
                if !self.usuario.insert(op: operacao, value: vl) { //Se não efetou a operação
                    let alert = UIAlertController(title: "Atenção", message: "Saldo insuficiente", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            }
            
            self.myTable.reloadData()
            self.lblSaldo.text = "Saldo: R$  " + String(self.usuario.getSaldo())
        }
        
        //the cancel action doing nothing
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel) { (_) in }
        
        //adding textfields to our dialog box
        alertController.addTextField { (textField) in
            textField.placeholder = "Digite o valor"
        }
        
        //adding the action to dialogbox
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        
        //finally presenting the dialog box
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func btnDepositarClick(_ sender: UIButton) {
        showInputDialog(operacao: "Depósito", mensagem: "Digite o valor a ser depositado:")
    }
    
    @IBAction func btnSacarClick(_ sender: UIButton) {
        showInputDialog(operacao: "Saque", mensagem: "Digite o valor a ser sacado:")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Histórico"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usuario.size()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "my_cell", for: indexPath)
        
        let stringValue = usuario.getOperacao(at: indexPath.row) + ": R$ " +  String(usuario.getValor(at: indexPath.row))
        
        cell.textLabel?.text = stringValue
        
        if(usuario.getOperacao(at: indexPath.row) == "Depósito"){
            cell.textLabel?.textColor = UIColor.green
        }else if (usuario.getOperacao(at: indexPath.row) == "Saque"){
            cell.textLabel?.textColor = UIColor.red
        }else{
            cell.textLabel?.textColor = UIColor.blue
        }
        
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usuario = bancoRepository.getUsuario(bancoRepository.getNomeUsuario())
        
        myTable.delegate = self
        myTable.dataSource = self
        lblSaldo.text = "Saldo: R$  " + String(usuario.getSaldo())
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
