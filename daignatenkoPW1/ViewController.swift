//
//  ViewController.swift
//  daignatenkoPW1
//
//  Created by Dmitriy Ignatenko on 9/16/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var button: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonWasPressed(_ sender: Any) {
        button.isEnabled = false
        
        let views = [view1, view2, view3]
        let uniqueColors = getUniqueColors(count: views.count)

        for (index, view) in views.enumerated() {
            guard let view = view else {
                continue
            }
            
            UIView.animate(withDuration: 1.0, animations: {
                view.backgroundColor = uniqueColors[index]
                self.setRandomCornerRadius(view: view)
            }) { (_) in
                if index == views.count - 1 {
                    self.button.isEnabled = true
                }
            }
        }
    }

    func getUniqueColors(count: Int) -> [UIColor] {
        var uniqueColors = [UIColor]()
        var set = Set<UIColor>()

        while set.count < count {
            let color = UIColor(
                red: .random(in: 0...1),
                green: .random(in: 0...1),
                blue: .random(in: 0...1),
                alpha: 1
            )
            if !set.contains(color) {
                set.insert(color)
                uniqueColors.append(color)
            }
        }

        return uniqueColors
    }

    func setRandomCornerRadius(view: UIView?) {
        view?.layer.cornerRadius = CGFloat.random(in: 0...25)
    }
}
