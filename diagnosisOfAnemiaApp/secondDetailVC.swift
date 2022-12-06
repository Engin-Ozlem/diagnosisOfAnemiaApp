//
//  secondDetailVC.swift
//  diagnosisOfAnemiaApp
//
//  Created by macbookair on 2.12.2022.
//

import UIKit

class secondDetailVC: UIViewController , UITextFieldDelegate {
    @IBOutlet weak var questionsLabel: UILabel!
    @IBOutlet weak var textField: UITextField!

    @IBOutlet weak var previousButton: UIButton!
    
    
    
    @IBOutlet weak var saveButton: UIButton!
    var questions = [String]()
    var answers = [Double]()
    var questionsCount = 0
    var currentIndexValue : Int = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        
        navigationItem.hidesBackButton = true
        
        var RBC = "Vücut içinde oksijen ya da karbondioksit taşınmasından sorumlu (kırmızı) alyuvar hücrelerine eritrosit ya da RBC diyoruz . RBC değerinizi giriniz."
        var HGB = "HBG, hemoglobini sembolize eder. Hemoglobin, kemik iliğinde üretilen ve kırmızı kan hücrelerinde depo edilen demir açısından oldukça zengin bir proteindir . HGB değerinizi giriniz. "
        var HCT = "HCT (Hematokrit) Nedir? Hematokrit yani HCT, kırmızı kan hücrelerinin hacminin, dolaşımdaki kanın hacmine oranını ifade eder. HCT değerinizi giriniz."
        var MCV = "MCV, tam kan sayımının değişkenlerinden biri arasında yer alır. Alyuvarların boyutunu anlamak için uygulanır, kırmızı kan hücreleri hakkında bilgi verir . MCV değerinizi giriniz."
        var MCH = "Standart tam kan sayımının bir parçası olarak rapor edilir. Hipokromik anemilerde MCH değeri düşer. MCH değerinizi giriniz."
        var MCHC = "belirli bir paketlenmiş kırmızı kan hücresi hacmindeki hemoglobin konsantrasyonunun bir ölçüsüdür. MCHC değerinizi giriniz."
        
        questions.append(RBC)
        questions.append(HGB)
        questions.append(HCT)
        questions.append(MCV)
        questions.append(MCH)
        questions.append(MCHC)
        
        previousButton.isEnabled = false
        questionsLabel.text = questions[questionsCount]
        
        
        
        
        
    }
    
    
    
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
            guard let currentString = textField.text as NSString? else {
                return false
            }
            let newString = currentString.replacingCharacters(in: range, with: string)
            return Double(newString) != nil
    }
    
    
    //kaydet butonu
    @IBAction func saveButton(_ sender: UIButton) {
        if questionsCount != 5 {
            let gelenVeri = Double(textField.text!)
            answers.insert(gelenVeri ?? 0, at: currentIndexValue)
            currentIndexValue += 1
            
            
            questions.append(questionsLabel.text!)
            questionsLabel.text = "\(questions[questionsCount+1])"
            questionsCount += 1
            previousButton.isEnabled = true
            textField.text = ""
            
            
        }else if questionsCount == 5 {
            let gelenVeri = Double(textField.text!)
            answers.insert(gelenVeri ?? 0, at: currentIndexValue)
            currentIndexValue += 1
            
            questions.append(questionsLabel.text!)
            
            navigationItem.hidesBackButton = false
            let alert = UIAlertController(title: "Tamamlandı", message: "Testiniz Tamamlanmıştır Sonucu görmek için Ok a basınız", preferredStyle: UIAlertController.Style.alert)
            let okbutton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { UIAlertAction in
                self.performSegue(withIdentifier: "thirdDetailVC", sender: nil)
            }
            alert.addAction(okbutton)
            present(alert, animated: true, completion: nil)
            previousButton.isEnabled = false
            saveButton.isEnabled = false
            textField.isEnabled = false
            textField.text = ""
            
        }
        
        
    }
    
    //önceki soru butonu
    @IBAction func previousButton(_ sender: UIButton) {
        
            questionsLabel.text = "\(questions[questionsCount-1])"
            currentIndexValue -= 1
            answers.remove(at: currentIndexValue)
            questionsCount -= 1
            
        
        if questionsCount == 0 {
            previousButton.isEnabled = false
            
        }
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "thirdDetailVC" {
            let destinationVC = segue.destination as! thirdDetailVC
            destinationVC.incomingdataAnswer = answers
        }
    }
    
}
