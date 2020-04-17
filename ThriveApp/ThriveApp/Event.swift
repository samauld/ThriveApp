import SwiftUI


struct Event: Identifiable {
    
    var id: String = ""

    
    var tasks = [String]()
    var title: String?
    var date: String?
    
    /// Init
    init(tasks: [String], title: String, id: String, date: String) {
        self.tasks = tasks
        self.title = title
        self.id = id
        self.date = date
    }
}
