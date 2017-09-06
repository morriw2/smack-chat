//
//  AvatarPickerVC.swift
//  smack-chat
//
//  Created by Billy Morris on 9/5/17.
//  Copyright © 2017 Billy Morris. All rights reserved.
//

import UIKit

class AvatarPickerVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var avatarCollectionView: UICollectionView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        avatarCollectionView.delegate = self
        avatarCollectionView.dataSource = self
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = avatarCollectionView.dequeueReusableCell(withReuseIdentifier: "AvatarCell", for: indexPath) as? AvatarCell {
            return cell
        }
        return AvatarCell()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 28
    }

    @IBAction func backPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func segmentControlPressed(_ sender: Any) {
    }
    
    
}
