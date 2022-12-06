//
//  thirdDetailVC.swift
//  diagnosisOfAnemiaApp
//
//  Created by macbookair on 2.12.2022.
//

import UIKit

class thirdDetailVC: UIViewController {
    
    @IBOutlet weak var rbcLabel: UILabel!
    @IBOutlet weak var hgbLabel: UILabel!
    @IBOutlet weak var hctLabel: UILabel!
    @IBOutlet weak var mcvLabel: UILabel!
    @IBOutlet weak var mchLabel: UILabel!
    @IBOutlet weak var mchcLabel: UILabel!
    
    @IBOutlet weak var rbcResultLabel: UILabel!
    @IBOutlet weak var hgbResultLabel: UILabel!
    @IBOutlet weak var hctResultLabel: UILabel!
    @IBOutlet weak var mcvResultLabel: UILabel!
    @IBOutlet weak var mchResultLabel: UILabel!
    @IBOutlet weak var mchcResultLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    
    @IBOutlet weak var dateLabel: UILabel!
    
    
    var incomingdataAnswer = [Double?]()
    var utcTimeZoneStr = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        let utcTimeZoneStr = formatter.string(from: date)
        UserDefaults.standard.set(utcTimeZoneStr, forKey: "dateTimeUser")
        dateLabel.text = "\(utcTimeZoneStr)"
        
        
        
        
        //Sonuçların yazdırıyoruz
        rbcLabel.text = "RBC : \(incomingdataAnswer[0] ?? 0)"
        hgbLabel.text = "HGB : \(incomingdataAnswer[1] ?? 0)"
        hctLabel.text = "HCT : \(incomingdataAnswer[2] ?? 0)"
        mcvLabel.text = "MCV : \(incomingdataAnswer[3] ?? 0)"
        mchLabel.text = "MCH : \(incomingdataAnswer[4] ?? 0)"
        mchcLabel.text = "MCMH :\(incomingdataAnswer[5] ?? 0)"
        
        //Kullanıcımıza hangi değerlerinin düşük veya yüksek olduğunun bilgisini veriyoruz
        if incomingdataAnswer[0]! <= 4.6 || incomingdataAnswer[0]! >= 6 {
            rbcResultLabel.text = "RBC değeriniz 4.6 - 6 aralığında değildir"
            rbcResultLabel.backgroundColor = UIColor.red
        }else {
            rbcResultLabel.text = "RBC değeriniz 4.6 - 6 aralığındadır"
            rbcResultLabel.backgroundColor = UIColor.green
        }
        if incomingdataAnswer[1]! <= 12.0 || incomingdataAnswer[1]! >= 16 {
            hgbResultLabel.text = "HGB değeriniz 12 - 16 aralığında değildir"
            hgbResultLabel.backgroundColor = UIColor.red
        }else {
            hgbResultLabel.text = "HGB değeriniz 12 - 16 aralığındadır"
            hgbResultLabel.backgroundColor = UIColor.green
        }
        if incomingdataAnswer[2]! <= 36.0 || incomingdataAnswer[2]! >= 48 {
            hctResultLabel.text = "HCT değeriniz 36 - 48 aralığında değildir"
            hctResultLabel.backgroundColor = UIColor.red
        }else{
            hctResultLabel.text = "HCT değeriniz 36 - 48 aralığındadır"
            hctResultLabel.backgroundColor = UIColor.green
        }
        if incomingdataAnswer[3]! <= 80 || incomingdataAnswer[3]! >= 100 {
            mcvResultLabel.text = "MVC değeriniz 80 - 100 aralığında değildir"
            mcvResultLabel.backgroundColor = UIColor.red
        }else {
            mcvResultLabel.text = "MVC değeriniz 80 - 100 aralığındadır"
            mcvResultLabel.backgroundColor = UIColor.green
        }
        if incomingdataAnswer[4]! <= 27 || incomingdataAnswer[4]! >= 34 {
            mchResultLabel.text = "MCH değeriniz 27 - 34 aralığında değildir"
            mchResultLabel.backgroundColor = UIColor.red
        }else{
            mchResultLabel.text = "MCH değeriniz 27 - 34 aralığındadır"
            mchResultLabel.backgroundColor = UIColor.green
        }
        if incomingdataAnswer[5]! <= 31 || incomingdataAnswer[5]! >= 37 {
            mchcResultLabel.text = "MCHC değeriniz 31 - 37 aralığında değildir"
            mchcResultLabel.backgroundColor = UIColor.red
        }else {
            mchcResultLabel.text = "MCHC değeriniz 31 - 37 aralığındadır"
            mchcResultLabel.backgroundColor = UIColor.green
        }
        
        
        //Demir eksikliğine bağlı kansızlık tanısı için Koşullarımız
        if incomingdataAnswer[1]! <= 10.950 {
            if incomingdataAnswer[1]! > 5.510 {
                resultLabel.text = "Demir eksikliğine bağlı kansızlığınız olabilir"
            }else {
                resultLabel.text = "Demir eksikliğine bağlı kansızlığınız yoktur"
            }
        }
        
        if incomingdataAnswer[1]! > 10.950 {
            if incomingdataAnswer[2]! > 33.950 {
                resultLabel.text = "Demir eksikliğine bağlı kansızlığınız yoktur"
            }
        }
        
        if incomingdataAnswer[2]! <= 33.950 {
            if incomingdataAnswer[5]! <= 32.500 {
                resultLabel.text = "Demir eksikliğine bağlı kansızlığınız olabilir"
            }
        }
        
        if incomingdataAnswer[5]! > 32.500 {
            if incomingdataAnswer[1]! > 11.450 {
                resultLabel.text = "Demir eksikliğine bağlı kansızlığınız olabilir"
            }
        }
        
        if incomingdataAnswer[1]! <= 11.450{
            if incomingdataAnswer[0]! > 3.600 {
                resultLabel.text = "Demir eksikliğine bağlı kansızlığınız yoktur"
            }else {
                resultLabel.text = "Demir eksikliğine bağlı kansızlığınız olabilir"
            }
        }
        
        
        
    }
    
   
}
