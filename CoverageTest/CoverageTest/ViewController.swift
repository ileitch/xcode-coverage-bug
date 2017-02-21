//
//  ViewController.swift
//  CoverageTest
//
//  Created by Ian Leitch on 2/21/17.
//
//

import UIKit
import Shared

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func testButtonTouched(_ sender: Any) {
        // !!!!!!!!!!!!!!!!!!!!!!
        UsedByApp().perform()
        // !!!!!!!!!!!!!!!!!!!!!!

        let alert = UIAlertController(title: "Hello", message: "This is a test!", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)

        present(alert, animated: true, completion: nil)
    }
}

