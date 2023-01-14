//
//  FirstViewController.swift
//  hw1
//
//  Created by Керемет  on 25/12/22.
//

import UIKit

class FirstViewController: UIViewController{
  
    @IBOutlet private weak var firstcollectionView: UICollectionView!
    @IBOutlet private weak var secondcollectionView: UICollectionView!
    @IBOutlet private weak var productTableView: UITableView!
  
    private let mockData: [CustomModel] = [
        .init(imageIconView: UIImage(systemName: "cart.fill")!, lable: "Delivery", isSelected: true),
        .init(imageIconView: UIImage(systemName: "car")!, lable: "Pickup", isSelected: true),
        .init(imageIconView: UIImage(systemName: "powersleep")!, lable: "Catering", isSelected: true),
        .init(imageIconView: UIImage(systemName: "play")!, lable: "Curbside", isSelected: true)
        ]
    
    private let mockData2:  [SecondModel] = [
        .init(imagesecond: UIImage(named: "pic6")!, lable2: "Takeaways"),
        .init(imagesecond: UIImage(named: "pic2 1")!, lable2: "Grocery"),
        .init(imagesecond: UIImage(named: "pic3")!, lable2: "Convenience"),
        .init(imagesecond: UIImage(named: "pic4")!, lable2: "Pharmacy")
    ]
    
    private let productsArray: [ProductNodel] = [
        .init(productImageIcon: UIImage(named: "photo2")!,
            score: "4.5", productName: "Vegetarian Pizza",
            subName: "Italian | Burgers", openClose: "OPEN",
            delivery: "Delivery: FREE | Minimun: 10$",
            location: "1.5 km away", circle: UIImage(named: "circle")!,
            star: UIImage(named: "star")!),
        .init(productImageIcon: UIImage(named: "photo1")!,
            score: "4.6", productName: "Burger Craze",
            subName: "American | Burgers", openClose: "OPEN",
            delivery: "Delivery: FREE | Minimun: 10$",
            location: "1.5 km away", circle: UIImage(named: "circle")!,
            star: UIImage(named: "star")!)
    ]
    
   override func viewDidLoad() {
        super.viewDidLoad()
        confifureCollectionView()
        secondconfifureCollectionView()
        configureTableView()
    }
    
    private func confifureCollectionView() {
        firstcollectionView.dataSource = self
        firstcollectionView.delegate = self
        firstcollectionView.register(
            UINib(
                nibName: String(describing: FirstCollectionViewCell.self),
                bundle: nil), forCellWithReuseIdentifier: FirstCollectionViewCell.reusedId)
    }
    
    private func secondconfifureCollectionView() {
        secondcollectionView.dataSource = self
        secondcollectionView.delegate = self
        secondcollectionView.register(
            UINib(
                nibName: String(describing: SecondCollectionViewCell.self),
                bundle: nil), forCellWithReuseIdentifier: SecondCollectionViewCell.reuseId2)
    }
    
    private func configureTableView() {
        productTableView.dataSource = self
        productTableView.delegate = self
        productTableView.register(
            UINib(
                nibName: String(describing: ProductTableViewCell.self),
                bundle: nil), forCellReuseIdentifier: ProductTableViewCell.reuseID3)
     }
}

extension FirstViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int
    ) -> Int {
        if collectionView == firstcollectionView{
            
            return mockData.count
        }else{
            return mockData2.count
            }
    }
    
    func collectionView(
            _ collectionView: UICollectionView,
            cellForItemAt indexPath: IndexPath
        ) -> UICollectionViewCell {
            if collectionView == firstcollectionView {
                let cell = firstcollectionView.dequeueReusableCell(
                    withReuseIdentifier: "FirstCollectionViewCell",
                    for: indexPath) as! FirstCollectionViewCell
                let data = mockData[indexPath.row]
                cell.display(item: data)
                return cell
            }else{
                let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: "SecondCollectionViewCell",
                    for: indexPath) as! SecondCollectionViewCell
                let data = mockData2[indexPath.row]
                cell.display2(item: data)
                return cell
        }
    }
}

extension FirstViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(
          _ collectionView: UICollectionView,
            layout collectionViewLayout: UICollectionViewLayout,
          sizeForItemAt indexPath: IndexPath
      ) -> CGSize {
          if collectionView == firstcollectionView {
              return CGSize(width: 100, height: 128)
          } else {
              return CGSize(width: 100, height: 130)
          }
      }
  }

extension FirstViewController: UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return productsArray.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "ProductTableViewCell")
        as! ProductTableViewCell
        let data = productsArray[indexPath.row]
        cell.display3(item: data)
        return cell
    }
}

extension FirstViewController: UITableViewDelegate {
    func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath)
    -> CGFloat {
        return 300
    }
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        
    }
}
