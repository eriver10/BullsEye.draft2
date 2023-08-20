//
//  ViewController.swift
//  BullsEye.draft2
//
//  Created by Grey on 8/14/23.
//

import UIKit

class ViewController: UIViewController {
    //type var as Interger?, varabale name: (why: here?) is set to zero
    //Var is a container and Int is type value inside...
    
    /*
    //Setting variable to 50, default in app will now be 50.
    var currentValue: Int = 50
    */
    
    //NOTE: the swift can infer the type by the value (a number).
    var currentValue = 0
    var targetValue = 0
    //A place to hold the score.
    var score = 0
    var round = 0
    
    //My take is that these are a global variables?
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var targetLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var roundLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
        startNewGame()
        
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")!
        slider.setThumbImage(thumbImageNormal, for: .normal)
        let thumbImageHighlighted = UIImage( named: "SliderThumb-Highlighted")!
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        let insets = UIEdgeInsets(
          top: 0,
          left: 14,
          bottom: 0,
          right: 14)
        let trackLeftImage = UIImage(named: "SliderTrackLeft")!
        let trackLeftResizable = trackLeftImage.resizableImage(
          withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        let trackRightImage = UIImage(named: "SliderTrackRight")!
        let trackRightResizable = trackRightImage.resizableImage(
          withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
        
        
        
        /*
        //This is set to the return from this rounging fuction with parameter
        currentValue = lroundf(slider.value)
        //Interesting, Int dot randome function with a constraint.
        targetValue = Int.random(in: 1...100)
        */
    }

    @IBAction func showAlert() {
        
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
        
        //A way of running total
        //or saying score plus points equals (new)score
        
        //This logic changes the message according to results
         let title: String
         if difference == 0 {
           title = "Perfect!"
           points += 100
        } else if difference < 5 {
           title = "You almost had it!"
            if difference == 1 {
                points += 50
            }
        } else if difference < 10 {
           title = "Pretty good!"
       } else {
           title = "Not even close..."
         }
        score += points
         let message = "You scored \(points) points"
        
        /*
        var difference = currentValue - targetValue
        
         if difference < 0 {
           difference *= -1
         }
        
        //Note: another way of doing the above:
        //   let difference = abs(targetValue - currentValue)
        
        
        let message = "The value of the slider is: \(currentValue)" + "\nThe target value is: \(targetValue)" +
        "\nThe difference is: \(difference)"
        
         */
         
        //call this fuction when showAlert is activated.
        startNewRound()
        
        /*
        //Changed to now, display slider values
        let message = "The value of the slider is: \(currentValue)" + "\nThe target value is: \(targetValue)"
        */
         
        let alert = UIAlertController(
          title: title,
          message: message,
          preferredStyle: .alert)
        let action = UIAlertAction(
          title: "OK",
          style: .default,
          handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
 
    //Slider control: show value of the slider
    @IBAction func sliderMoved(_ slider: UISlider) {
        
        //calling the round function with parmeter and set to variable
        currentValue = lroundf(slider.value)
    }
    
    //New fuction to add rounds(turns) to game.
    func startNewRound() {
      round += 1
        //running tally starting with one then incrementing one each time
      targetValue = Int.random(in: 1...100)
      currentValue = 50
      slider.value = Float(currentValue)
        updateLabels()
        
    }
    
    //This function converts the number value into a string to enable it to be displayed by the label.
    func updateLabels() {
        targetLabel.text = String(targetValue)
        //Note: an alternative way of writing this:
        //targetLabel.text = "\(targetValue)"
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
        
    }
    
    @IBAction func startNewGame() {
      score = 0
      round = 0
      startNewRound()
        
        let transition = CATransition()
          transition.type = CATransitionType.fade
          transition.duration = 1
          transition.timingFunction = CAMediaTimingFunction(
            name: CAMediaTimingFunctionName.easeOut)
          view.layer.add(transition, forKey: nil)
        
    }
    
    
    
    
}

