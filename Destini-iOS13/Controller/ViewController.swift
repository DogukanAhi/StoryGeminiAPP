import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    var storyBrain = StoryBrain()
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func choiceMade(_ sender: UIButton) {
        guard let currentTitle = sender.currentTitle else { return }
        storyBrain.nextStory(currentTitle)
        updateUI()
    }
    
    
   private func updateUI() {
       DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
           self.storyLabel.text = self.storyBrain.getTitle()
           self.choice1Button.setTitle(self.storyBrain.getChoice1(), for: .normal)
           self.choice2Button.setTitle(self.storyBrain.getChoice2(), for: .normal)
       }
    }
}

