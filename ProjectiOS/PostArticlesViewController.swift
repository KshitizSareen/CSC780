//
//  PostThoughtsViewController.swift
//  ProjectiOS
//
//  Created by Kshitiz on 10/12/22.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
class PostArticlesViewController: UIViewController {
    
    var db: Firestore!

    @IBOutlet weak var titleTextview: UITextView!
    @IBOutlet weak var descriptionTextview: UITextView!
   
    
    @IBAction func shareBtnPressed(_ sender: Any) {
        setArticle()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //giving border to textview
        self.descriptionTextview.layer.borderColor = UIColor.gray.cgColor
        self.descriptionTextview.layer.borderWidth = 1
        self.descriptionTextview.layer.cornerRadius = 15
        
        self.titleTextview.layer.borderColor = UIColor.gray.cgColor
        self.titleTextview.layer.borderWidth = 1
        self.titleTextview.layer.cornerRadius = 15

        // Do any additional setup after loading the view.
        db = Firestore.firestore()
        
    }
    
    private func setArticle() {
          // [START set_document_codable]
        guard let userID = Auth.auth().currentUser?.uid else { return }
        
        guard let title = titleTextview.text else {return}
        
        guard let description = descriptionTextview.text else {return}
        

        let article: [String: Any] = [
            "title": title,
            "description": description,
            "user_id": userID,
            "date_created": Timestamp(date: Date()),
           
            ]
        
    

     db.collection("articles").document().setData(article){
              err in
                  if let err = err {
                      print("Error writing document: \(err)")
                  } else {
                      print("Document successfully written!")
                      self.dismiss(animated: true, completion: nil)
                  }
          }
    
     
      }

    
}
