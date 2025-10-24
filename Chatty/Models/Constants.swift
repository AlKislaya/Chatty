//
//  Constants.swift
//  Chatty
//
//  Created by Alexandra on 23.10.25.
//

struct Constants {
    struct Core {
        static let appName = "Chatty 𐔌՞. .՞𐦯"
        static let ok = "Ok"
    }
    struct Segues {
        static let registerToChat = "registerToChat"
        static let loginToChat = "loginToChat"
    }
    struct Errors {
        static let smthWentWrong = "Something went wrong :(("
        static let emailNotProvided = "Seems like you forgot to provide your email"
        static let passwordNotProvided = "Seems like you forgot to provide your password"
    }
    struct Objects {
        struct TableView {
            static let messageCellNibName = "MessageCell"
            static let reusableCellIdentifier = "ReusableCell"
        }
    }
    struct FStore {
        static let collectionName = "messages"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
    }
}
