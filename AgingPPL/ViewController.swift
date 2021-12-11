//
//  ViewController.swift
//  AgingPPL
//
//  Created by admin on 06/12/2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    // an array holding the Name, ImageName in assets file, Role , Nicnames , Summary for some of the Main characters in the famous TV show FRIENDS !
    var cast = [
        ("Mr.Heckles","Heckles","Retired - Complaining 24/7","Old Man Heckles,The Weird Man","Mr. Heckles lived in the apartment below Monica and Rachel. He often complained about the apparent noise that the two made, either in person or by tapping on his apartment ceiling with a broom ! "),
        ("Janice","Janice","OH MY GOD !","Just Janice","She is known for her obnoxious and nasally voice and her trademark cry of \"OH MY GOD!\""),
        ("Gunther","Gunther","Central Perk's Manager","Gunther Central Perk","Gunther is the manager of Central Perk, where the six main characters spent a great deal of their free time."),
        ("Duck & Chick","DuckandChick","Full-Time Pets","Chick Jr. and Duck Jr/The birds","Chick Jr. and Duck Jr. are a new chick and duckling that Joey bought Chandler as a housewarming gift in the final episode. (Joey named them \"Chick Jr.\" and \"Duck Jr.\" respectively)"),
        ("Huggsy","Huggsy","Bedtime Penguin Pal","Joey's Penguin","Huggsy is Joey's stuffed penguin, as well as his \"bedtime penguin pal\". He was originally mentioned accidentally by Joey, who described him as his \"bedtime penguin pal\" !"),
        ("Phoebe","Phoebe","Songwriter/musician","Regina Phalange","She is best known for her bohemian lifestyle, silly wit and guitar playing in Central Perk."),
        ("Monica","Monica","Chef","Mon, Harmonica","Monica was known as the \"Mother Hen\" of the group and her Greenwich Village apartment was one of the group's main gathering places."),
        ("Rachel","Rachel","Executive at Ralph Lauren","Rach","a naïve runaway bride who reunites with her childhood best friend Monica Geller and relocates to New York City, Rachel gradually evolves from a spoiled, inexperienced \"daddy's girl\" into a successful businesswoman."),
        ("Chandler","Chandler","\" Transponster \"","Bing/The Boy Who Hates Thanksgiving","He is notable for his sarcastic and witty sense of humor & he is the wealthiest friend because he has been saving money from his job for 6 years!"),
        ("Ross","Ross","Paleontologist","Dr. Monkey /Ross the Divorcer","He is Monica's older brother & He's best known for his nerdy personality and very awkward sense of humor."),
        ("Joey","Joey","Semi-Famous Actor","Dr. Drake Ramoray /Ken Adams","He is a food-loving, Italian-American actor who is struggling & constantly looking for work")
    ]

    @IBOutlet weak var myTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        cast.shuffle()//shuffle the array on each run
        myTable.dataSource = self
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cast.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! MyCustomCell
        
        // populate the data from the array into my custom cells :D
        cell.NameLabel?.text = "Name : \(cast[indexPath.row].0)"
        cell.MyImageView.image = UIImage(named:cast[indexPath.row].1)
        cell.RoleLabel?.text = "Role : \(cast[indexPath.row].2)"
        
        cell.AgeLabel.text = "Age : \(Int.random(in: 5...85)) Years Old"// random age changing with every run :)
        
        cell.infoButton.tag = indexPath.row// i was trying to know which cell was clicked using the info button but i coudn't figure it out so i just assigned each info buttom with a tag indicating the (indexPath.row) for that cell carrying that info button :)
        
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        // return cell so that Table View knows what to render in each row
           return cell
    }
    

    
    @IBAction func infoButtonPressed(_ sender: UITableViewCell) {// there is an info button at the top-right corner of the cell which displays more info about the chosen character :)
        
        var currentCast = cast[sender.tag]// making use of the tags i assigned at (line 49) to get the corresponding cast member
        
        let alert = UIAlertController(title: "\(currentCast.0) !", message: "\nNickname:\n\(currentCast.3)\n\nAbout:\n\(currentCast.4)" , preferredStyle: UIAlertController.Style.alert)
        
        var imageView = UIImageView(frame: CGRect(x: 60, y: -150, width: 150, height: 150))//adding image at the top of the alert
        imageView.image = UIImage(named:currentCast.1)
        alert.view.addSubview(imageView)
        // add an action (button)
        alert.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: { action in self}))
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
}

