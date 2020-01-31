//
//  TaskDetailLayoutViewContoller.swift
//  DOITTaskManager
//
//  Created by Nikolay Mikhailishin on 1/30/20.
//  Copyright © 2020 nikolay.mihailishin. All rights reserved.
//

import UIKit

class TaskDetailLayoutViewContoller: UIViewController, TaskDetailLayoutContoller {
    // MARK: - Properties
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var priorityLabel: UILabel!
    
    var task: Task? {
        didSet {
            guard isViewLoaded, let task = task else { return }
            update(with: task)
        }
    }
    
    
    
    // MARK: - TaskDetailLayoutContoller
    
    weak var delegate: TaskDetailLayoutContollerDelegate?
    
    
    
    // MARK: - Private
    
    private func update(with task: Task) {
        titleLabel.text = task.title
        
        let date = Date(timeIntervalSince1970: task.expirationDate)
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = "EEEE dd MMM, yyyy"
        let strDate = dateFormatter.string(from: date)
        dateLabel.text = strDate
        
        priorityLabel.text = task.priority.string
    }
    
    
    
    // MARK: - Actions
    
    @IBAction private func deleteButtonPressed(_ sender: Any) {
        delegate?.layoutControllerDidAskToRemoveTask(self)
    }
}
