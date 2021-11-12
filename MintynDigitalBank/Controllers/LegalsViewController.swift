

import UIKit


class LegalsViewController: UIViewController {
    
    @IBOutlet weak var legalsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        legalsTableView.delegate = self
        legalsTableView.dataSource = self
    }
}

extension LegalsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return legalContentData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "legalCell", for: indexPath)
        cell.textLabel?.text = legalContentData[indexPath.row].title
        return cell
    }
    
    
}
