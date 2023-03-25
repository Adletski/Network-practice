//
//  OurCoursesTableViewController.swift
//  Networking
//
//  Created by Adlet Zhantassov on 25.03.2023.
//

import UIKit

class OurCoursesTableViewController: UITableViewController {
    
    private var courses: [Course] = []
    private var courseName: String?
    private var courseURL: String?
    private let jsonUrlString = "https://swiftbook.ru/wp-content/uploads/api/api_courses"

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(OurCoursesTableViewCell.self, forCellReuseIdentifier: OurCoursesTableViewCell.identifier)
        title = "Courses"
        fetchData()
    }
    
    //MARK: - Functions
    
    private func fetchData() {
//        NetworkManager.fetchData(url: "https://swiftbook.ru/wp-content/uploads/api/api_courses")
        NetworkManager.fetchData(url: "https://swiftbook.ru/wp-content/uploads/api/api_courses") { courses in
            self.courses = courses
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: OurCoursesTableViewCell.identifier, for: indexPath) as? OurCoursesTableViewCell else { return UITableViewCell() }
        
        configureCell(cell: cell, for: indexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    private func configureCell(cell: OurCoursesTableViewCell, for indexPath: IndexPath) {
        let course = courses[indexPath.row]
        cell.nameOfCourse.text = course.name
        
        if let numberOfLessons = course.number_of_lessons {
            cell.numberOfLessons.text = "Number of lesson: \(numberOfLessons)"
        }
        
        if let label = course.number_of_tests {
            cell.label.text = "Number of tests: \(label)"
        }
        
        DispatchQueue.global().async {
            guard let imageUrl = URL(string: course.imageUrl!) else { return }
            guard let imageData = try? Data(contentsOf: imageUrl) else { return }
            
            DispatchQueue.main.async {
                cell.ourCoursesImageView.image = UIImage(data: imageData)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let course = courses[indexPath.row]
        
        courseURL = course.link
        courseName = course.name
        
        let webVC = WebViewController()
        webVC.url = courseURL
        navigationController?.pushViewController(webVC, animated: true)
    }
}
