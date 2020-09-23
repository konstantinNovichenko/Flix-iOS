//
//  MovieDetailsViewController.swift
//  Flix
//
//  Created by Konstantin Novichenko on 9/21/20.
//  Copyright © 2020 konst_nvc. All rights reserved.
//

import UIKit
import AlamofireImage
import WebKit

class MovieDetailsViewController: UIViewController, WKUIDelegate {

    @IBOutlet weak var backdropView: UIImageView!
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    
    var movie: [String:Any]!
    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        titleLabel.text = movie["title"] as? String
        titleLabel.sizeToFit()
        synopsisLabel.text = movie["overview"] as? String
        synopsisLabel.sizeToFit()
        
        let baseUrl = "http://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let posterUrl = URL(string: baseUrl + posterPath)
        let backdropPath = movie["backdrop_path"] as! String
        let backdropUrl = URL(string: "http://image.tmdb.org/t/p/w780" + backdropPath)
        
        posterView.af_setImage(withURL: posterUrl!)
        backdropView.af_setImage(withURL: backdropUrl!)
        
    }
    
    @IBAction func tapOnPoster(_ sender: UITapGestureRecognizer) {
        //Open trailer view
        self.performSegue(withIdentifier: "showTrailer", sender: self);
    }
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        
        //Set the movie id
        let movieId = movie["id"] as! Int64
        
        // Pass the movie id to the new view controller.
        let trailerViewController = segue.destination as! MovieTrailerViewController
        trailerViewController.movieId = movieId
    }
    

}
