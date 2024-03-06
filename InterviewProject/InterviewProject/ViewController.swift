import UIKit

 


class ViewController: UIViewController, UITableViewDataSource {
    private var houseArray: [house] = []
    @IBOutlet weak var houseTable: UITableView?
    private var mockObje:MockAPI = MockAPI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mockObje.getHouseInfo { [weak self] result in
            self?.houseArray = result
            DispatchQueue.main.async {
            self?.houseTable?.reloadData()
            }
        }
    }
    
    

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return houseArray.count
    }

     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "houseCell", for: indexPath) as! houseCell
         let houseVar: house = houseArray[indexPath.row]
         cell.house = houseVar
        return cell
    }
}





