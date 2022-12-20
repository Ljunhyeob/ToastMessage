//
//  ViewController.swift
//  Toast
//
//  Created by 이준협 on 2022/12/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        showToast(message: "안녕하세요.")
    }
    
    @IBAction func button(_ sender: Any) {
        showToast(message: "버튼으로 만든 토스트.")
    }
    
    func showToast(message : String) {
            let width:CGFloat = 20 // 가로 크기 지정
            let toastLabel = UILabel(frame: CGRect(x: width, y: self.view.frame.size.height-100, width: view.frame.size.width-2*width, height: 50)) // 세로 크기 및 동적 속성 지정
            
            // 뷰가 위치할 위치를 지정
            toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6) // 배경 색상
            toastLabel.textColor = UIColor.white // 텍스트 색상
            toastLabel.textAlignment = .center; // 텍스트 정렬
            toastLabel.text = message // 메시지
            toastLabel.alpha = 1.0 // 투명도
            toastLabel.layer.cornerRadius = 10 // 코너 둥글기
            toastLabel.clipsToBounds  =  true //코너 둥글기 활성화
            self.view.addSubview(toastLabel) // 뷰 컨트롤러에 추가
            
            // [애니메이션 동작 실시]
            UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
                toastLabel.alpha = 0.0
            }, completion: {(isCompleted) in
                toastLabel.removeFromSuperview() // 뷰컨트롤러에서 제거
            })
        }

}

