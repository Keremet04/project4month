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
    
    private var serviceArray = [ServiceModel] ()
    private var optionsArray = [OptionsModel] ()
    private var productArray = [ProductNodel] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        confifureCollectionView()
        secondconfifureCollectionView()
        configureTableView()
        
        serviceArray = ServiceCategory.shared.parse(serviceJSON)
        optionsArray = OptionsCategory.shared.parse(productJSON)
        productArray = Product.shared.parse(productJSON)
        
    }
    
    class ServiceCategory {
        
    static let shared = ServiceCategory()
    func parse(_ json: String) -> [ServiceModel] {
            var serviceCategory = [ServiceModel] ()
            let serviceCategoryData = Data(serviceJSON.utf8)
            let decoder = JSONDecoder()
            
            do {
                let convertedData = try decoder.decode([ServiceModel].self, from: serviceCategoryData)
                serviceCategory = convertedData
            } catch {
                print("Error is: \(error.localizedDescription)")
            }
            return serviceCategory
        }
    }
    
    class OptionsCategory {
        
        static let shared = OptionsCategory()
        
        func parse(_ json: String) -> [OptionsModel] {
            var productCategory = [OptionsModel] ()
            let productCategoryData = Data(optionsJSON.utf8)
            let decoder = JSONDecoder()
            
            do {
                let convertedData = try decoder.decode([OptionsModel].self, from: productCategoryData)
                productCategory = convertedData
            } catch {
                print("Error is: \(error.localizedDescription)")
            }
            return productCategory
        }
    }
    
    class Product {
        
        static let shared = Product()
        func parse(_ json: String) -> [ProductNodel] {
            var product = [ProductNodel]()
            let productData = Data(productJSON.utf8)
            let decoder = JSONDecoder()
            
            do {
                let convertedData = try decoder.decode([ProductNodel].self, from: productData)
                product = convertedData
            } catch {
                print("Error is: \(error.localizedDescription)")
            }
            return product
        }
    }
    
    private func confifureCollectionView() {
        firstcollectionView.dataSource = self
        firstcollectionView.delegate = self
        firstcollectionView.register(
            UINib(
                nibName: String(describing: ServiceCollectionViewCell.self),
                bundle: nil), forCellWithReuseIdentifier: ServiceCollectionViewCell.reusedId)
    }
    
    private func secondconfifureCollectionView() {
        secondcollectionView.dataSource = self
        secondcollectionView.delegate = self
        secondcollectionView.register(
            UINib(
                nibName: String(describing: OptionsCollectionViewCell.self),
                bundle: nil), forCellWithReuseIdentifier: OptionsCollectionViewCell.reuseId2)
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
            return serviceArray.count
        }else{
            return optionsArray.count
        }
    }
    
    func collectionView(
            _ collectionView: UICollectionView,
            cellForItemAt indexPath: IndexPath
        ) -> UICollectionViewCell {
            if collectionView == firstcollectionView {
                let cell = firstcollectionView.dequeueReusableCell(
                    withReuseIdentifier: ServiceCollectionViewCell.reusedId,
                    for: indexPath) as! ServiceCollectionViewCell
                let serviceModel = serviceArray[indexPath.item]
                cell.display(item: serviceModel)
                if !serviceArray[indexPath.row].isSelected {
                    cell.backgroundColor = .white
                } else {
                    cell.backgroundColor = .systemGreen
                }
                return cell
            }else{
                let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: OptionsCollectionViewCell.reuseId2,
                    for: indexPath) as! OptionsCollectionViewCell
                let OptionsModel = optionsArray[indexPath.item]
                cell.display2(item: OptionsModel)
                if !optionsArray[indexPath.row].isSelected {
                    cell.backgroundColor = .white
                } else {
                    cell.backgroundColor = .systemGreen
                }
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
          
              return CGSize(width: 100, height: 130)
          }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if firstcollectionView == firstcollectionView {
            if !serviceArray[indexPath.row].isSelected {
                for item in 0..<serviceArray.count {
                    serviceArray[item].isSelected = false
                }
                serviceArray[indexPath.row].isSelected = true
                firstcollectionView.reloadData()
            } else {
                serviceArray[indexPath.row].isSelected = false
                firstcollectionView.reloadData()
            }
        } else {
            if !optionsArray[indexPath.row].isSelected {
                for item in 0..<optionsArray.count {
                    optionsArray[item].isSelected = false
                }
                optionsArray[indexPath.row].isSelected = true
                secondcollectionView.reloadData()
            } else {
                optionsArray[indexPath.row].isSelected = false
                secondcollectionView.reloadData()
            }
        }
    }
}

//  }

extension FirstViewController: UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return productArray.count
    }
    
    func tableView(_
    tableView: UITableView,
            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: ProductTableViewCell.reuseID3, for: indexPath)
        as! ProductTableViewCell
        let data = productArray[indexPath.row]
        cell.display3(item: data)
        cell.delegate = self
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
    
}

    extension FirstViewController: ProductCellDelegate {
        func switchToTheImage(_ img: UIImage) {
            guard let detailsViewConttoller = storyboard?.instantiateViewController(withIdentifier: ImageViewController.identifier) as? ImageViewController else {
                return
            }
            detailsViewConttoller.foodImagePhoto = img
            navigationController?.pushViewController(detailsViewConttoller, animated: true)
        }
    }

