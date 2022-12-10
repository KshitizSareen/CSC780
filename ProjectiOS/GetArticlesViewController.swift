//
//  GetPostsViewController.swift
//  ProjectiOS
//
//  Created by Kshitiz on 10/12/22.
//

import UIKit
import FirebaseFirestore



class GetArticlesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
 
    @IBOutlet weak var tableview: UITableView!
    
    var db: Firestore!
    var articles = [CustomArticle]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(CustomArticleCell.self, forCellReuseIdentifier: "CustomArticleCell")
        
        //firebase
        db = Firestore.firestore()
        
        getData();
        self.tableview.reloadData();
        
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCellTemp") as? CustomArticleCell else {
            return UITableViewCell()
        }
        
        let article = articles[indexPath.row]
        cell.Title?.text = article.title;
        cell.Description?.text = article.description;
        return cell
    }
    


    func getData(){
        db.collection("articles")
            .order(by: "date_created",  descending: true)
            .addSnapshotListener { querySnapshot, error in
                guard let documents = querySnapshot?.documents else {
                    print("Error fetching documents: \(error!)")
                    return
                }
                
                self.articles = documents.map{(queryDocumentSnapshot)-> CustomArticle in
                    let data = queryDocumentSnapshot.data();
                    let title:String = data["title"] as! String ?? "Title";
                    let description:String = data["description"] as! String ?? "description";
                    let user_id = data["user_id"] as! String ?? "user_id";
                    let date_created = Date()
                    return CustomArticle(title: title, description: description, user_id: user_id,date_created: date_created)
                }
                self.tableview.reloadData()

            }

    }

}
