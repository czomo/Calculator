//
//  ViewController.swift
//  Calculator2
//
//  Created by tmp on 28/03/2020.
//  Copyright © 2020 tmp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var orientations = UIInterfaceOrientationMask.portrait //or what orientation you want
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
    get { return self.orientations }
    set { self.orientations = newValue }
    }
    @IBOutlet weak var label: UILabel!
    
    var valueFirst: Double = 0;
    var valueSecond: Double = 0;
    var math = false;
    var operation = 0;
    var calculated = false;
    var temp_in_faren: Double = 0;
    var temp_in_cel: Double = 0;
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func numbers(_ sender: UIButton) {
        if math == true{
            label.text = String(sender.tag-1)
            valueFirst = Double(label.text!)!
            math = false;
        }
        else {
            if calculated == true{
                label.text = ""
            }
            label.text = label.text! + String(sender.tag-1)
            valueFirst = Double(label.text!)!
            print(sender.titleLabel!.text!)
        }

    }
    
    @IBAction func buttons(_ sender: UIButton) {
        if label.text != "" && sender.tag != 15 && sender.tag != 16 && sender.tag != 17 && sender.tag != 18{
            valueSecond = Double(label.text!)!
            if sender.tag == 11{ //plus
                label.text = "+";
            }
            else if sender.tag == 12{ //minus
                label.text = "-";

            }
            else if sender.tag == 13{ //multi
                label.text = "x";

            }
            else if sender.tag == 14{ //divade
                label.text = "/";

            }
            operation = sender.tag
            math = true;
            calculated = false;
        }
        else if sender.tag == 15{
            if operation == 11{
                label.text = String(valueFirst + valueSecond)
            }
            else if operation == 12{
                label.text = String(valueSecond - valueFirst)
            }
            else if operation == 13{
                label.text = String(valueFirst * valueSecond)
            }
            else if operation == 14{
                if valueFirst == 0 {
                    label.text = String("Error")
                }
                else {
                    label.text = String(valueSecond / valueFirst)
                }
                
            }
            calculated = true
        }
        else if sender.tag == 16{
            label.text = ""
            valueSecond = 0
            valueFirst = 0
            operation = 0
        }
        else if sender.tag == 17{
            valueSecond=0
            temp_in_faren = Double((valueFirst * 9/5) + 32);
            label.text = String(temp_in_faren)
            calculated = true;
        }
        else if sender.tag == 18{
            valueSecond=0
            temp_in_cel = Double((valueFirst-32) * 5/9);
            label.text = String(temp_in_cel)
            calculated = true;
        }
    }
}

