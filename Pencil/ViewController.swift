//
//  ViewController.swift
//  Pencil
//
//  Created by M_AMBIN02825 on 12/09/23.
//

import UIKit
import PencilKit

class ViewController: UIViewController, PKCanvasViewDelegate{
    
    @IBOutlet weak var canvasVu: PKCanvasView!
    
    let drwaing = PKDrawing()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        canvasVu.delegate = self
        canvasVu.drawing = drwaing
        canvasVu.alwaysBounceVertical = true
        canvasVu.allowsFingerDrawing = true
        canvasVu.drawingPolicy = .anyInput
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupCanvasView()
    }
    private func setupCanvasView(){
        if let window = view.window, let toolPiker = PKToolPicker.shared(for: window){
            toolPiker.setVisible(true, forFirstResponder: canvasVu)
            toolPiker.addObserver(canvasVu)
            canvasVu.becomeFirstResponder()
        }
        
        
    }
}

