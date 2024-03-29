//
//  gameleval.swift
//  game1
//
//  Created by R94 on 01/03/23.
//

import UIKit

class gameleval: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    
    var time = Timer()
    var timecount :Double = UserDefaults.standard.double(forKey: "second")
    var point : Int = 0
    var score = 0
    var highscore = UserDefaults.standard.integer(forKey: "high score")
    var rendomColour = UIColor()
    var fenq = 0.1
    var life = 1
    var colour  = [UIColor.yellow,UIColor.brown,UIColor.cyan,UIColor.red,UIColor.gray,UIColor.green,UIColor.purple,UIColor.orange,UIColor.white]
    
    @IBOutlet weak var guessWrongColour: UILabel!
    @IBOutlet weak var lineLabel: UILabel!
    @IBOutlet weak var scolerbarlabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var lifeline1: UIImageView!
    @IBOutlet weak var lifeline2: UIImageView!
    @IBOutlet weak var lifeline3: UIImageView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        scolerbarlabel.layer.cornerRadius = 10
        scolerbarlabel.layer.masksToBounds = true
        progressBar.progress = 0.0
        progress()
        highscore = UserDefaults.standard.integer(forKey: "highscore")
        colour = colour.shuffled()
        rendomColour = colour.randomElement()!
        collectionView.reloadData()
        score = point
        updatehighscore()
    }
    func updatehighscore()
    {
        if score > highscore
        {
            highscore = score
        UserDefaults.standard.set(score, forKey: "highscore")
        }
    }
    
    func progress()
    {
            var a : Float = 1.0
            self.progressBar.progress = a
            time.invalidate()
            time = Timer.scheduledTimer(withTimeInterval: fenq, repeats: true, block: { (time) in
            a -= 0.01
            self.progressBar.progress = a
            if self.progressBar.progress == 0.0
            {
                self.time.invalidate()
                self.updatehighscore()
                self.showalert(tital: "Restart")
            }
        })
    }
    func showalert(tital:String)
       {
           self.updatehighscore()
           let alert: UIAlertController = UIAlertController(title: "Game Over\n", message: "Score \(point)\n High score:\(highscore)", preferredStyle: .alert)
           alert.addAction(UIAlertAction.init(title: "Restart", style: .default, handler: { [self] _ in
           self.scolerbarlabel.text = "\(self.point -= self.point)"
               self.point = 0
               self.life = 1
               self.scolerbarlabel.text = "\(self.point)"
               self.progress()
               self.lifeline1.image = UIImage(systemName: "heart.fill")
               self.lifeline2.image = UIImage(systemName: "heart.fill")

               self.lifeline3.image = UIImage(systemName: "heart.fill")
               self.rendomColour = self.colour.randomElement()!
               colour = colour.shuffled()
               collectionView.reloadData()
               progress()
               self.collectionView.reloadData()
              
        }))
            alert.addAction(UIAlertAction.init(title: "Home", style: .destructive,handler: { _ in
            let navigation = self.storyboard?.instantiateViewController(withIdentifier: "playGame") as! playGame; self.navigationController?.pushViewController(navigation, animated: true)
          }))
            present(alert, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           return colour.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        if colour[indexPath.row].nameColour == rendomColour.nameColour{
            point += 1
            score = point
            scolerbarlabel.text = "\(point)"
            colour = colour.shuffled()
            rendomColour = colour.randomElement()!
            collectionView.reloadData()
            progress()
            timecount = UserDefaults.standard.double(forKey: "second")
            
        }
        else
        {
            if life == 1
            {
                lifeline1.image = UIImage(systemName: "heart")
                life+=1
                rendomColour = colour.randomElement()!
                colour = colour.shuffled()
                collectionView.reloadData()
                progress()
            }
            else if life == 2
            {
                lifeline2.image = UIImage(systemName: "heart")
                life+=1
                rendomColour = colour.randomElement()!
                colour = colour.shuffled()
                collectionView.reloadData()
                progress()
            }
            else if life == 3
            {
                lifeline3.image = UIImage(systemName: "heart")
                life+=1
                rendomColour = colour.randomElement()!
                colour = colour.shuffled()
                collectionView.reloadData()
                progress()
                showalert(tital: "")
            }
            else
            {
                showalert(tital: "")
                self.time.invalidate()
                if point != 0
                {
                    score = point
                    UserDefaults.standard.set(highscore, forKey: "score")
                }
                scolerbarlabel.text = "\(point)"
            }
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MyCollectionViewCell
        cell.backgroundColor = .blue
        cell.layer.cornerRadius = 20
        cell.layer.masksToBounds = true
        
        if rendomColour == colour[indexPath.row]
        {
            cell.nameLabel.text = colour.randomElement()?.nameColour
            cell.layer.backgroundColor = colour[indexPath.row].cgColor
        }
        else
        {
            cell.layer.backgroundColor = colour[indexPath.row].cgColor
            cell.nameLabel.text = colour[indexPath.row].nameColour
        }
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize (width: 110, height: 110)    }
    
}

extension UIColor {
    var nameColour : String{
        switch self{
            
        case UIColor.yellow : return "yellow"
        case UIColor.brown : return"Brown"
        case UIColor.cyan : return "Cyan"
        case UIColor.red : return "red"
        case UIColor.gray : return "Gray"
        case UIColor.green : return "Green"
        case UIColor.purple : return "Purple"
        case UIColor.orange : return "Orange"
        case UIColor.white : return "white"
        default:
        break
        }
        return ""
    }
}


