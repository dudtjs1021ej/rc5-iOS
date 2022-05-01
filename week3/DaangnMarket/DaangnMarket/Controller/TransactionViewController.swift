//
//  TransactionViewController.swift
//  DaangnMarket
//
//  Created by 임영선 on 2022/04/29.
//

import UIKit

protocol TransactionProtocol {
  func dataSend(productImage: UIImage, title: String, price: Int, detail: String)
  func updateData(indexPath: IndexPath, productImage: UIImage, title: String, price: Int, detail: String)
}

class TransactionViewController: UIViewController {

  @IBOutlet weak var cameraButton: UIButton!
  @IBOutlet weak var cameraImageView: UIImageView!
  @IBOutlet weak var titleTextField: UITextField!
  @IBOutlet weak var priceTextField: UITextField!
  @IBOutlet weak var detailTextView: UITextView!
  
  var delegate: TransactionProtocol?
  let picker = UIImagePickerController()
  let textViewPlaceHolder = "마두동에 올릴 게시글 내용을 작성해주세요. (가품 및 판매금지품목은 게시가 제한될 수 있어요.)"
  var transaction: TransactionModel?
  var indexPath: IndexPath?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationController?.navigationBar.tintColor = .black
    self.navigationController?.navigationBar.topItem?.title = ""
    
    cameraImageView.layer.cornerRadius = 10
    picker.delegate = self
    detailTextView.text = textViewPlaceHolder
    detailTextView.delegate  = self
    if let transaction = transaction {
      if let images = transaction.images {
        cameraImageView.image = images[0]
      }
      titleTextField.text = transaction.title
      priceTextField.text = String(transaction.price)
      detailTextView.text = transaction.detail
      detailTextView.textColor = .black
    }
  }
    
  @IBAction func clickedDone(_ sender: Any) {
    navigationController?.popViewController(animated: true)
    guard let title = titleTextField.text,
          let price = priceTextField.text,
          let detail = detailTextView.text,
          let image = cameraImageView.image
    else { return }
    
    if let _ = transaction {
      
      guard let indexPath = indexPath else {
        print("indexPath error")
        return
      }
      delegate?.updateData(indexPath: indexPath, productImage: image, title: title, price: Int(price) ?? 0, detail: detail)
      print("update")
      self.transaction = nil
    }
    
    else {
      print("send")
      delegate?.dataSend(productImage: image, title: title, price: Int(price) ?? 0, detail: detail)
    }
    
  }
  @IBAction func clickedCamera(_ sender: Any) {
    picker.sourceType = .photoLibrary
    present(picker, animated: true)
  }
}

extension TransactionViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
      cameraImageView.image = image
    }
    dismiss(animated: true, completion: nil)
  }
}

extension TransactionViewController: UITextViewDelegate {
  func textViewDidBeginEditing(_ textView: UITextView) {
    if detailTextView.text == textViewPlaceHolder {
      detailTextView.text = nil
      detailTextView.textColor = .black
    }
  }
}
