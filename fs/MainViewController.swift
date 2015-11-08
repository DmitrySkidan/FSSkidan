//
//  ViewController.swift
//  fs
//
//  Created by Mac on 06.11.15.
//  Copyright © 2015 MyApp. All rights reserved.
//

import UIKit
import Kanna

class MainViewController: UIViewController {

    @IBOutlet weak var posterButton01: UIButton!
    @IBOutlet weak var posterLabel01: UILabel!
    
    @IBOutlet weak var posterButton02: UIButton!
    @IBOutlet weak var posterLabel02: UILabel!

    @IBOutlet weak var posterButton03: UIButton!
    @IBOutlet weak var posterLabel03: UILabel!
    
    @IBOutlet weak var posterButton04: UIButton!
    @IBOutlet weak var posterLabel04: UILabel!
    
    @IBOutlet weak var posterButton05: UIButton!
    @IBOutlet weak var posterLabel05: UILabel!
    
    @IBOutlet weak var posterButton06: UIButton!
    @IBOutlet weak var posterLabel06: UILabel!
    
    var posterLabels = [UILabel]()
    var posterButtons = [UIButton]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.appendLabels()
        self.appendButtons()
        
        let mainPageFilms = GetMainPageFilms()
        mainPageFilms.getHtmlDataForPopular()
        
        for i in 0..<3 {
            let popularFilms: FilmData = mainPageFilms.films[i]
            posterLabels[i].text = popularFilms.filmTitle
            
            let dataFromUrl = NSData(contentsOfURL: NSURL(string: popularFilms.filmPoster)!)
            posterButtons[i].setImage(UIImage(data: dataFromUrl!), forState: UIControlState.Normal)
        }
    }
    
    func appendLabels() {
        posterLabels.append(posterLabel01)
        posterLabels.append(posterLabel02)
        posterLabels.append(posterLabel03)
        posterLabels.append(posterLabel04)
        posterLabels.append(posterLabel05)
        posterLabels.append(posterLabel06)
    }
    
    func appendButtons() {
        posterButtons.append(posterButton01)
        posterButtons.append(posterButton02)
        posterButtons.append(posterButton03)
        posterButtons.append(posterButton04)
        posterButtons.append(posterButton05)
        posterButtons.append(posterButton06)
    }

}

