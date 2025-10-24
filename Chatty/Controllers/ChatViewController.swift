//
//  ChatViewController.swift
//  Chatty
//
//  Created by Alexandra on 23.10.25.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class ChatViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextField: UITextField!
    let database = Firestore.firestore()
    var messages: [Message] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Constants.Core.appName
        navigationItem.hidesBackButton = true
        
        tableView.dataSource = self
        tableView.register(UINib(nibName: Constants.Objects.TableView.messageCellNibName, bundle: nil), forCellReuseIdentifier: Constants.Objects.TableView.reusableCellIdentifier)
        
        database.collection(Constants.FStore.collectionName)
            .order(by: Constants.FStore.dateField)
            .addSnapshotListener(onDataReceived)
        forceLoadMessages() //need to recheck if it actually necessary
    }
    
    @IBAction func onSendPressed(_ sender: UIButton) {
        let message = messageTextField.text ?? ""
        if message.isEmpty {
            print("err_NoMessage")
            return
        }
        
        let sender = Auth.auth().currentUser
        if sender == nil || sender!.email == nil || sender!.email!.isEmpty {
            print("err_sender_or_email_isNilOrEmpty")
            return
        }
        let email = sender!.email!
        
        database.collection(Constants.FStore.collectionName).addDocument(data: [
            Constants.FStore.senderField: email,
            Constants.FStore.bodyField: message,
            Constants.FStore.dateField: Date().timeIntervalSince1970
        ], completion: onDatabaseSavedData)
    }
    
    func onDatabaseSavedData(error: Error?) {
        if let safeError = error {
            print(safeError.localizedDescription)
            return
        }
        
        print("Data was successfully saved")
        messageTextField.text = ""
    }
    
    func forceLoadMessages() {
        database.collection(Constants.FStore.collectionName).order(by: Constants.FStore.dateField).getDocuments(completion: onDataReceived)
    }
    
    func onDataReceived(snapshot: QuerySnapshot?, error: Error?) {
        if let safeError = error {
            print(safeError.localizedDescription)
            return
        }
        
        if let documents = snapshot?.documents {
            messages = []
            
            for doc in documents {
                let data = doc.data()
                if let sender = data[Constants.FStore.senderField] as? String, let message = data[Constants.FStore.bodyField] as? String {
                    let newMessage = Message(senderEmail: sender, body: message)
                    messages.append(newMessage)
                }
            }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    @IBAction func onLogOutPressed(_ sender: UIBarButtonItem) {
        do {
          try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            AlertController.showDefaultAlert(title: Constants.Errors.smthWentWrong, message: signOutError.localizedDescription, sender: self)
        }
    }
}

extension ChatViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = messages[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Objects.TableView.reusableCellIdentifier, for: indexPath) as! MessageCell
        cell.messageLabel.text = message.body
        cell.setRole(isCompanion: message.senderEmail != Auth.auth().currentUser?.email)
        return cell
    }
}
