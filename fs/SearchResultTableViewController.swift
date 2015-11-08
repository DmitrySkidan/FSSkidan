//
//  SearchResultTableViewController.swift
//  fs
//
//  Created by Mac on 08.11.15.
//  Copyright © 2015 MyApp. All rights reserved.
//

import UIKit
import Kanna

class SearchResultTableViewController: UITableViewController {
    
    var htmlData = NSString() //Html data
    var films = [FilmData]() //Array with films objects
    var i: Int = 0
    var receivedSearchValue: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(receivedSearchValue)
        
        let url = NSURL(string: "http://fs.to/video/films/search.aspx?search=" + receivedSearchValue) //Url for parse
        
            var filmsCount: Int = 0
            /* Get html content of site by url */
            do {
                htmlData = try NSString(contentsOfURL: url!, encoding: NSUTF8StringEncoding)
            } catch _{
            }
            
            /* Initialize xml parser */
            let doc = Kanna.HTML(html: htmlData as String, encoding: NSUTF8StringEncoding)
            
            /* Get films count */
            for node in doc!.xpath("//div[@class=\"b-search-page__results\"]/a") {
                print(node["data-subsection"])
                if (node["data-subsection"] == "films") {
                    print(node["href"])
                    for title in doc!.xpath("//div[@class=\"b-search-page__results\"]/a/span[@class=\"b-search-page__results-item-image\"]") {
                        print(title["title"])
                        for poster in doc!.xpath("//div[@class=\"b-search-page__results\"]/a/span[@class=\"b-search-page__results-item-image\"]/img") {
                            print(poster["src"])
                            filmsCount += 1
                            break
                        }
                    }

                }
                if (filmsCount < 20) {
                    break
                }
            }
            print(filmsCount)
            /* Initialize films objects
            for _ in 0..<filmsCount {
                films.append(FilmData(filmPageUrl: "", filmPoster: "", filmTitle: ""))
            }
            */
        

        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
