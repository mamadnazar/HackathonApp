import UIKit

class FeedbackViewController: UIViewController {
    
    @IBOutlet weak var feedbackTextView: UITextView! {
        
        didSet {
            feedbackTextView.layer.borderColor = UIColor.lightGray.cgColor
            feedbackTextView.layer.cornerRadius = 5
            feedbackTextView.layer.borderWidth = 1
        }
    }
    @IBOutlet weak var contactTextField: UITextField!
    @IBOutlet weak var addFeedbackButton: UIButton!
    @IBAction func addFeedBackButtonAction(_ sender: Any) {
        
        let feedback = Feedback(feedback_text: feedbackTextView.text!, contact: contactTextField.text!, time_added: "")
        ServerManager.shared.addFeedbacks(feedback: feedback, feedbackAdded, error: showErrorAlert)
    }

    func feedbackAdded() {
        alertAppear(title: "Отзыв отправлен" , message: "")
    }
    
    override func viewDidLoad() {
       
        setNavigationBar()
        super.viewDidLoad()
        
        self.setNavigationBar()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = Constants.feedback
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func alertAppear(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
}

