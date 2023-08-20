//
//  AboutViewController.swift
//  BullsEye.draft2
//
//  Created by Grey on 8/20/23.
//

import UIKit
import WebKit


class AboutViewController: UIViewController {
    
  @IBAction func close() {
    dismiss(animated: true, completion: nil)
  }
    
  @IBOutlet var webView: WKWebView!
    
    override func viewDidLoad() {
      super.viewDidLoad()
      if let url = Bundle.main.url(
        forResource: "BullsEye", withExtension: "html") {
        let request = URLRequest(url: url)
        webView.load(request)
        }
        
     }
    
    
    
}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


