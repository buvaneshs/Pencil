//
//  PencilViewController.swift
//  Pencil
//
//  Created by M_AMBIN02825 on 13/09/23.
//

import UIKit
import PencilKit

class PencilViewController: UIViewController, PKCanvasViewDelegate {

    
    @IBOutlet weak var canvasView: PKCanvasView!
    var drawing = PKDrawing()
    let toolPk = PKToolPicker()
    override func viewDidLoad() {
        super.viewDidLoad()
        canvasView.delegate = self
        canvasView.drawing = drawing
        canvasView.alwaysBounceVertical = true
        canvasView.drawingPolicy = .anyInput
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        toolPk.addObserver(canvasView)
        toolPk.setVisible(true, forFirstResponder: canvasView)
        canvasView.becomeFirstResponder()
    }
    
    @IBAction func btClearTapped(_ sender: Any) {
        canvasView.drawing = PKDrawing()
    }
    
    @IBAction func btImageTapped(_ sender: Any) {
        
        let imageVC = self.storyboard?.instantiateViewController(withIdentifier: "imgVC") as? ImageViewController
        let img = UIGraphicsImageRenderer(bounds: canvasView.bounds).image{_ in (view.drawHierarchy(in: canvasView.bounds, afterScreenUpdates: true))}
        imageVC?.img = img
        self.navigationController?.pushViewController(imageVC!, animated: true)
    }
    
//    func canvasViewDrawingDidChange(_ canvasView: PKCanvasView) {
//        
//    }
//    func canvasViewDidFinishRendering(_ canvasView: PKCanvasView) {
//        
//    }
//    func canvasViewDidEndUsingTool(_ canvasView: PKCanvasView) {
//        
//    }
//    func canvasViewDidBeginUsingTool(_ canvasView: PKCanvasView) {
//        
//    }
}
