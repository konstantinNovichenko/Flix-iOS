//
//  MovieTrailerViewController.swift
//  Flix
//
//  Created by Konstantin Novichenko on 9/22/20.
//  Copyright © 2020 konst_nvc. All rights reserved.
//

import UIKit
import WebKit

class MovieTrailerViewController: UIViewController, WKUIDelegate {
    
    

    @IBOutlet weak var webView: WKWebView!
    var movieTrailers = [[String:Any]]()
    var movieId = Int64()
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let url = URL(string: "https://api.themoviedb.org/3/movie/" + String(self.movieId) + "/videos?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed&language=en-US")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            // This will run when the network request returns
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                
                self.movieTrailers = dataDictionary["results"] as! [[String:Any]]
                let trailerId = self.movieTrailers[0]["key"] as! String
                let myURL = URL(string:"https://www.youtube.com/embed/" + trailerId)
                let myRequest = URLRequest(url: myURL!)
                self.webView.load(myRequest)
            }
        }
        task.resume()
        
        
        
    }
        // Do any additional setup after loading the view.
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
