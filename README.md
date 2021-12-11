# Aging F.R.I.E.N.D.S

 ### :musical_note: *So no one told you how old they are ?* :clap: :clap: :clap: :clap:
 
 #
 ### Ever wondered how old the [FRIENDS](https://github.com/ReemALHamed/F.R.I.E.N.D.S) cast are ? Let's find out !
 

https://user-images.githubusercontent.com/85634099/145675580-4d94d869-0843-4215-b7fe-5d06f61e6068.mp4

 
 ## App Interface
 The app starts with a group of cards each representing a character of the series along with a random age assigned to each character because they are :star2: AGELESS :star2: , and it shows:
 
 ### 1) Character Card
 The characters related info are stored in a dictionary named (cast) in the following order :
 * Character Name
 * Character Image
 * Character Role
 * Character Nickname
 * Character Summary
 Note : age is randomly generated we don't need to store it in the dictionary
 ```
  var cast = [
        ("Mr.Heckles","Heckles","Retired - Complaining 24/7","Old Man Heckles,The Weird Man","Mr. Heckles lived in the apartment below Monica and Rachel. He often complained about the apparent noise that the two made, either in person or by tapping on his apartment ceiling with a broom ! "),
        
        ("Janice","Janice","OH MY GOD !","Just Janice","She is known for her obnoxious and nasally voice and her trademark cry of \"OH MY GOD!\"")]
 ```

Each card will only display 4 details which are (Name , Image , Role , Age), and for the age, it will be a random number between 5 to 85 which will be displayed using (AgeLabel)
 * Note : that the age will change each time the app runs because it is random
```
cell.AgeLabel.text = "Age : \(Int.random(in: 5...85)) Years Old"// random age changing with every run :)
```
![image](https://user-images.githubusercontent.com/85634099/145675910-87dc17c2-4903-4248-ab39-cb488775f4d2.png)



 ### 2) Character Info Dialog
On the right-top corner of the card there is an info button which will display an alert dialog viewing more info about the character, which are :
 * Character Image
 * Character Nickname
 * Character Summary
 ```
 @IBAction func infoButtonPressed(_ sender: UITableViewCell) {
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
 ```
 
![image](https://user-images.githubusercontent.com/85634099/145676309-3f3063a3-2c37-4898-aabe-a65b7bbec0bd.png)
