//
//  MainVc.swift
//  QLPreviewPractise
//
//  Created by surya-zstk231 on 15/06/21.
//

import UIKit
import QuickLook


class MainVc: UIViewController {
    
    
    let preview = QLPreviewController()
    var selectedURL: URL?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func storyBtnTapped(_ sender: UIButton) {
        createUrl(fileName: "story", fileType: "pdf")
    }
    
    @IBAction func imageBtnTapped(_ sender: UIButton) {
        createUrl(fileName: "TommyJerry", fileType: "jpg")
    }
    @IBAction func pageBtnTapped(_ sender: UIButton) {
        createUrl(fileName: "Dummy", fileType: "pages")
    }
    
    @IBAction func jsBtnTapped(_ sender: UIButton) {
        createUrl(fileName: "model", fileType: "js")
    }
    @IBAction func videoBtnTapped(_ sender: UIButton) {
        createUrl(fileName: "Animations", fileType: "mp4")
    }
    
    
    func createUrl(fileName: String, fileType: String){
        if let path = Bundle.main.path(forResource: fileName, ofType: fileType){
            selectedURL = URL(fileURLWithPath: path)
            createQLc()
        }
    }
    
    
    func createQLc(){
        preview.reloadData()
        preview.dataSource = self
        preview.delegate = self
        self.present(preview, animated: true, completion: nil)
        
    }
    
    
}

extension MainVc: QLPreviewControllerDataSource{
    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        return 1
    }
    
    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        return selectedURL! as QLPreviewItem
    }
    
    
}

extension MainVc: QLPreviewControllerDelegate{
    
}
