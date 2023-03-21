//
//  playGame.swift
//  game1
//
//  Created by R94 on 28/02/23.
//

import UIKit

class playGame: UIViewController {
    @IBOutlet weak var selectModeLabel: UILabel!
    @IBOutlet weak var lineLabel: UILabel!
    @IBOutlet weak var easyButton: UIButton!
    @IBOutlet weak var mediumButton: UIButton!
    @IBOutlet weak var highButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func easyButtonAction(_ sender: UIButton)
    {
        naviget()
    }
    @IBAction func mediumButtonAction(_ sender: UIButton) {
        naviget1()
    }
    
    @IBAction func highButtonAction(_ sender: UIButton)
    {
        naviget2()
    }
    
    func naviget()
    {
        let storybord: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let navigation: gameleval = storybord.instantiateViewController(withIdentifier: "gameleval") as! gameleval
        navigation.fenq = 0.09
        UserDefaults.standard.set(10, forKey: "second")

        self.navigationController?.pushViewController(navigation, animated: true)
    }
    
    func naviget1()
    {
        let storybord: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let navigation: gameleval = storybord.instantiateViewController(withIdentifier: "gameleval") as! gameleval
        navigation.fenq = 0.05
        UserDefaults.standard.set(7, forKey: "second")
        self.navigationController?.pushViewController(navigation, animated: true)
    }
    
    func naviget2()
    {
        let storybord: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let navigation: gameleval = storybord.instantiateViewController(withIdentifier: "gameleval") as! gameleval
        navigation.fenq = 0.03
        UserDefaults.standard.set(5, forKey: "second")

        self.navigationController?.pushViewController(navigation, animated: true)
    }
    

}
