//
//  ViewController.swift
//  _17SimpsonBook
//
//  Created by Eray İnal on 19.12.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    var mySimpsons = [Simpson]()
    //4 Burada bütün aile üyelerini array içerisine alıyoruz ki kullanalım ve dışarıda tanımlıyoruz ki mothodların içerisinde de kullanabilelim
    
    var chosenSimpson: Simpson?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
        let homer = Simpson(name: "Homer Simpson", job: "Nuclear Safety", image: UIImage(named: "homer")!) //3 Buradaki ünlem 'homer adında bir resim var ve ben bundan eminim sorun çıkmayacak' anlamına gelmekte
        let marge = Simpson(name: "Marge Simpson", job: "Housewife", image: UIImage(named: "marge")!)
        let bart = Simpson(name: "Bart Simpson", job: "Student", image: UIImage(named: "bart")!)
        let lisa = Simpson(name: "Lisa Simpson", job: "Student", image: UIImage(named: "lisa")!)
        let maggie = Simpson(name: "Maggie Simpson", job: "Baby", image: UIImage(named: "maggie")!)
        
        mySimpsons.append(homer)
        mySimpsons.append(marge)
        mySimpsons.append(bart)
        mySimpsons.append(lisa)
        mySimpsons.append(maggie)
        
    }
    
    
    
    //1 Öncelikle yukarıdaki 3 tane sınıfı inherit ediyoruz. Ettikten sonra 2 tane zorunlu override etmemiz gereken 2 fonksiyonu(tableView sayır sayısı ve hücre) da yazıyoruz
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mySimpsons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = mySimpsons[indexPath.row].name
        return cell
    }
    //2 Şimdi biz bu 2 methodu yazdık ve eğer çalıştırırsak 10 satırlı bir table view oluşturur ama satırlarda hiçbir şey yazmaz çünkü viewDidLoad içerisine girip iki satır kod yazmamız lazım

    
    
    
    //5 DetailsViewCont sınınıfını modifiye ettiğine göre şimdi bu 2id methodu da yazabiliriz:
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        chosenSimpson = mySimpsons[indexPath.row] //7Burada chosenSimpson yazabilmek için yukarıda tanımlayıp gelmem lazım
        self.performSegue(withIdentifier: "toDetailsVC", sender: nil) //6 Buradaki 'withIdentifier' Main'de yeni eklediğimiz View Controller'a giden ok işaretine tıklayıp verdiğimiz identifier ile aynı olmalı
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == "toDetailsVC"){
            let destinationVC = segue.destination as! DetailsViewCont
            destinationVC.selectedSimpson = chosenSimpson   //7Burada chosenSimpson yazabilmek için yukarıda tanımlayıp gelmem lazım
            destinationVC.selectedSimpson = chosenSimpson
        }
    }
    
    
}

