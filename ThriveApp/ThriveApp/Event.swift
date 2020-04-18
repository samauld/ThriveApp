import SwiftUI


struct Event: Identifiable {
    
    var id: String = ""
    
    var tasks = [String]()
    var title: String?
    var date: String?
    var start: Date
    var end: Date?
    
    init(tasks: [String], title: String, id: String, date: String, start: Date, end: Date) {
        self.tasks = tasks
        self.title = title
        self.id = id
        self.date = date
        self.start = start
        self.end = end
    }
}
