//
//  ViewController.swift
//  Assets
//
//  Created by Muneera Y on 21/10/1443 AH.
//

import UIKit



class ViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tablecontent: UITableView!

  
    var JsoninfoList:[Jsoninfo]=[Jsoninfo]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tablecontent.estimatedRowHeight = 100
        
        tablecontent.dataSource = self
        tablecontent.delegate = self
        fetchdata()
    }
    
  
    func fetchdata(){
        guard let filelocation = Bundle.main.url(forResource: "contacts", withExtension: "json")
        else{
            return
        }
        do{
            let data = try Data(contentsOf: filelocation)
            let recivedata = try JSONDecoder().decode([Jsoninfo].self, from: data)
            
            
            self.JsoninfoList = recivedata
            
        }
        catch{
            print("Error\(error)")
        }
        
    }
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return JsoninfoList.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tablecontent.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
            
        let fullname = "\(JsoninfoList[indexPath.item].first_name) + \(JsoninfoList[indexPath.item].first_name)"
        cell.label.text = fullname
        var image : UIImage = UIImage(named: "acount")!
        let url = (JsoninfoList[indexPath.item].avatar) ?? "https://robohash.org/fugitreprehenderitcommodi.png"
    print(url)
//        cell.img.image = image
        
        cell.img.downloaded(from: url)
        return cell
            }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "contactinfo", sender: self)
    }
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          
             if let vc = segue.destination as? secondViewController{
                 vc.info = JsoninfoList[(tablecontent.indexPathForSelectedRow?.row)!]
               
                
            }
           
        }


    }

