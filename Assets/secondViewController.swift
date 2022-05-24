//
//  secondViewController.swift
//  Assets
//
//  Created by Muneera Y on 21/10/1443 AH.
//

import UIKit
extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}

class secondViewController: UIViewController {
    
  
    @IBOutlet weak var Role: UILabel!
    @IBOutlet weak var company: UILabel!
    @IBOutlet weak var label: UILabel!
    var info: Jsoninfo?
    @IBOutlet weak var Addresses: UILabel!
    
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var country: UILabel!
    @IBOutlet weak var birthDate: UILabel!
    @IBOutlet weak var Education: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var imgprofile: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let fullname = "\(info!.first_name) \(info!.last_name)"
        label.text = fullname
//        lastname.text = info?.last_name
        company.text = info?.job?.company
        email.text = info?.contact?.email
        phone.text = info?.contact?.phone_number
        birthDate.text = info?.birth_day
        Addresses.text = info?.contact?.address
        Education.text = info?.education
        country.text = info?.country
        Role.text = info?.job?.role
        
//        imgprofile.image = image
        let url = (info?.avatar) ?? "https://robohash.org/fugitreprehenderitcommodi.png"
        imgprofile.downloaded(from: url)
//        let data = try? Data(contentsOf: u!)

        // Do any additional setup after loading the view.
    }
    


}
