//
//  HomeTableViewController.swift
//  Roomy
//
//  Created by Mohamed Mostafa Fawzi on 4/17/20.
//  Copyright © 2020 Mohamed Mostafa Fawzi. All rights reserved.
//

import UIKit
import Alamofire
import RealmSwift
//
// MARK: - HomeTableViewController
//
class HomeTableViewController: UIViewController {
    //
    // MARK: - Variables And Properties
    //
    var rooms = [Room]()
    //
    // MARK: - IBOutlets
    //
    @IBOutlet weak var roomsTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCustomCells()
        fetchRooms()
        
    }
    
    func fetchRooms() {
        APIClient.getRooms() { response  in
            switch response {
                
            case .success(let rooms):
                self.rooms = rooms
                RealmManager.saveRooms(rooms: rooms)
                self.roomsTableView.reloadData()
                
            case .failure:
                RealmManager.getRooms()
                self.roomsTableView.reloadData()
            }
            
        }
    }
}


//
// MARK: - UITableViewDataSource
//
extension HomeTableViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rooms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RoomTableViewCell", for: indexPath) as!RoomTableViewCell
        
        let roomTitle = rooms[indexPath.row].title
        cell.roomTitle.text = roomTitle
        let roomPlace = rooms[indexPath.row].place
        cell.roomPlace.text = roomPlace
        let roomPrice = rooms[indexPath.row].price
        cell.roomPrice.text = roomPrice
        
        return cell
    }
    
    
}
//
// MARK: - UITableViewDelegate
//
extension HomeTableViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let listingViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ListingViewController") as! ListingViewController
        listingViewController.descriptionListing = rooms[indexPath.row].theDescription
        listingViewController.modalPresentationStyle = .automatic
        self.present(listingViewController, animated: true, completion: nil)
    }
    
}
//
// MARK: - registerCustomCells
//
extension HomeTableViewController {
    
    func registerCustomCells() {
        let cellNib = UINib(nibName: "RoomTableViewCell", bundle: nil)
        roomsTableView.register(cellNib, forCellReuseIdentifier: "RoomTableViewCell")
    }
}



