import UIKit

//Importa o framework QuickLook
import QuickLook

class ViewController: UIViewController, QLPreviewControllerDataSource{
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    //MARK: Action
    @IBAction func mostrarArquivo(_ sender: UIButton) {
        
        let quickLook = QLPreviewController()
        quickLook.dataSource = self
        
        //Empurrando o objteto para a sequencia do navigation controller
        self.navigationController?.pushViewController(quickLook, animated: true)
    }
    
    //MARK: DataSource
    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        return 1
    }
    
    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        
        let nomeArquivo = "conselhos"
        let extensao = "pdf"
        let raizDoApp = Bundle.main
        let caminhoArquivo = raizDoApp.path(forResource: nomeArquivo, ofType: extensao)
        let urlArquivo = URL(fileURLWithPath: caminhoArquivo!)
        return urlArquivo as QLPreviewItem
    }



}

