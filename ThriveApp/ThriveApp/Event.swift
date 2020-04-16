import SwiftUI


struct Event: Identifiable {
    
    var id: String = UUID().uuidString

    
    var tasks = [String]()
    let title: String?
    
    /// Init
    init(tasks: [String], title: String) {
        self.tasks = tasks
        self.title = title
    }
}
