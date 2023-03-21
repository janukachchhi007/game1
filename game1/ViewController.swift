//
//  ViewController.swift
//  game1
//
//  Created by R94 on 01/01/18.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var progressbar: UIProgressView!
    @IBOutlet weak var playButton: UIButton!
    var time = Timer()
   // var isrunning = false
    override func viewDidLoad() {
        super.viewDidLoad()
        progressbar.progress = 0.0
    }
    

    @IBAction func playButtonAction(_ sender: UIButton)
    {
        var a : Float = 0.0
        self.progressbar.progress = a
        time = Timer.scheduledTimer(withTimeInterval: 0.03, repeats: true, block: { (time) in
            a += 0.01
            self.progressbar.progress = a
            if self.progressbar.progress == 1.0
            {
                self.naviget()
                self.time.invalidate()

            }
        })
    }
    func naviget()
    {
        let navigation = storyboard?.instantiateViewController(withIdentifier: "playGame")as! playGame; navigationController?.pushViewController(navigation, animated: true)
    }
    
}

