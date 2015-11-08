//
//  GetMainPageFilms.swift
//  fs
//
//  Created by Mac on 06.11.15.
//  Copyright © 2015 MyApp. All rights reserved.
//

import UIKit
import Foundation
import Kanna

class GetMainPageFilms: NSObject {
    
    let url = NSURL(string: "http://fs.to/video/films/") //Url for parse
    
    var htmlData = NSString() //Html data
    var films = [FilmData]() //Array with films objects
    var i: Int = 0
    
    func getHtmlDataForPopular() {
        
        var filmsCount: Int = 0
        /* Get html content of site by url */
        do {
            htmlData = try NSString(contentsOfURL: url!, encoding: NSUTF8StringEncoding)
        } catch _{
        }
        
        /* Initialize xml parser */
        let doc = Kanna.HTML(html: htmlData as String, encoding: NSUTF8StringEncoding)
        
        /* Get films count */
        for _ in doc!.xpath("//div[@class=\"b-nowviewed__posters\"]/div[@class=\"b-poster-new\"]/a") {
            filmsCount += 1
        }
        
        /* Initialize films objects */
        for _ in 0..<filmsCount {
            films.append(FilmData(filmPageUrl: "", filmPoster: "", filmTitle: ""))
        }
        
        /* Link for film page */
        i = 0
        for node in doc!.xpath("//div[@class=\"b-nowviewed__posters\"]/div[@class=\"b-poster-new\"]/a") { //  <a href = "dsds"> Link </a> <div class = ""> -> <div class "dsad"> -> <a href = "">fdf</a>
            films[i].filmPageUrl = node["href"]
            i = i + 1
        }
        /* Link for poster image */
        i = 0
        for node in doc!.xpath("//div[@class=\"b-nowviewed__posters\"]/div[@class=\"b-poster-new\"]/a/span[@class=\"b-poster-new__image\"]/span[@class=\"b-poster-new__image-poster\"]") {
            let dirtyUrl: String = node["style"]!
            print(dirtyUrl)
            var cleanUrl: String!
            if let match = dirtyUrl.rangeOfString("(?<=')[^']+", options: .RegularExpressionSearch) {
                cleanUrl = dirtyUrl.substringWithRange(match)
                films[i].filmPoster = cleanUrl
            }
            print(i)
            i = i + 1
        }
        /* Link for film title */
        i = 0
        for node in doc!.xpath("//div[@class=\"b-nowviewed__posters\"]/div[@class=\"b-poster-new\"]/a/span[@class=\"b-poster-new__title\"]/span[@class=\"m-poster-new__short_title\"]") {
            print("Title: \(node.text)")
            films[i].filmTitle = node.text
            i = i + 1
        }

        print("1 film: \(films[0].filmPageUrl)")
        print("2 film: \(films[0].filmPoster)")
        print("3 film: \(films[0].filmTitle)")
        print("1 film: \(films[1].filmPageUrl)")
        print("2 film: \(films[1].filmPoster)")
        print("3 film: \(films[1].filmTitle)")
        print("1 film: \(films[2].filmPageUrl)")
        print("2 film: \(films[2].filmPoster)")
        print("3 film: \(films[2].filmTitle)")

    }
}
