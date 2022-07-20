import UIKit

protocol SettingsViewControllerDelegate {
    func setNewValues(for randomNumber: RandomNumber)
}

class MainViewController: UIViewController {

//MARK: - IB Outlets
    @IBOutlet var minimumValueLabel: UILabel!
    @IBOutlet var maximumValueLabel: UILabel!
    @IBOutlet var randomLabel: UILabel!
    @IBOutlet var getRandomNumberButton: UIButton!
    
    private var randomNumber = RandomNumber(minimumValue: 0, maximumValue: 100)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getRandomNumberButton.layer.cornerRadius = 10
        minimumValueLabel.text = randomNumber.minimumValue.formatted()
        maximumValueLabel.text = randomNumber.maximumValue.formatted()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navigationVC = segue.destination as? UINavigationController else { return }
        guard let settingsVC = navigationVC.topViewController as? SettingsViewController else { return }
        settingsVC.randomNumber = randomNumber
        settingsVC.delegate = self
    }
    
//MARK: - IB Actions
    @IBAction func getRandomNumberButtonTapped() {
        randomLabel.text = randomNumber.getRandom.formatted()
    }
}

//MARK: - SettingsViewControllerDelegate
extension MainViewController: SettingsViewControllerDelegate {
    func setNewValues(for randomNumber: RandomNumber) {
        minimumValueLabel.text = randomNumber.minimumValue.formatted()
        maximumValueLabel.text = randomNumber.maximumValue.formatted()
        self.randomNumber = randomNumber
    }
}
