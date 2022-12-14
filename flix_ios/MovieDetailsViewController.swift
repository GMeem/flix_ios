//
//  MovieDetailsViewController.swift
//  flix_ios
//
//  Created by Gulshan Meem on 9/18/22.
//

import UIKit
import AlamofireImage

class MovieDetailsViewController: UIViewController {
    
    
    
    @IBOutlet weak var backdropView: UIImageView!
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var movie: [String:Any]!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        titleLabel.text = movie["title"] as? String
        titleLabel.sizeToFit()
        
        synopsisLabel.text = movie["overview"] as? String
        synopsisLabel.sizeToFit()
        
        dateLabel.text = movie["release_date"] as? String
        dateLabel.sizeToFit()
        
        
        let BaseUrl = "https://image.tmdb.org/t/p/w780"
        
        if let posterPath = movie["poster_path"] as? String {
                  let posterUrl = URL(string: BaseUrl + posterPath)
            posterView.af.setImage(withURL: posterUrl!)
         }
         else {
                  posterView.image = nil
         }
        
        if let backdropPath = movie["backdrop_path"] as? String {
                  let backdropUrl = URL(string: BaseUrl + backdropPath)
            backdropView.af.setImage(withURL: backdropUrl!)
         }
         else {
                  backdropView.image = nil
         }
        
         let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(MovieDetailsViewController.didTap(sender:)))

         // Optionally set the number of required taps, e.g., 2 for a double click
         tapGestureRecognizer.numberOfTapsRequired = 1

         // Attach it to a view of your choice. If it's a UIImageView, remember to enable user interaction
         posterView.isUserInteractionEnabled = true
         posterView.addGestureRecognizer(tapGestureRecognizer)
         
        
    }
    
    
    
    @IBAction func didTap(sender: UITapGestureRecognizer) {
        
        let location = sender.location(in: view)
        print("image tapped")
        /*
        let movieID = movie["id"]!
        let mid = String(movieID)
        let urlBeforeID = "https://api.themoviedb.org/3/movie/"
        let urlAfterID = "videos?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed"
        //let apiUrl = URL(string: urlBeforeID + movieID! + urlAfterID)
        print(movie["title"] as? String)
        print(movieID)
        //print(apiUrl)
        
        
        
         guard let url = URL(string: "https://www.google.com") else {
         return
         }
         let vc = TrailerViewController(url: url, title: "Google")
         let navVC = UINavigationController(rootViewController: vc)
         present(navVC, animated: true)
         */
        
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
