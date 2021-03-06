//
//  IssueView.swift
//  CSVVisualizer
//
//  Created by Ciprian Cojan on 19/07/21.
//

import UIKit

struct IssueViewModel {
    enum Style {
        case header
        case content
    }
    
    let name: String?
    let surname: String?
    let issuesCount: String?
    let birth: String?
    var style: Style = .content
    
    init(name: String?, surname: String?, issuesCount: String?, birth: String?, style: Style = .content) {
        self.name = name
        self.surname = surname
        self.issuesCount = issuesCount
        self.birth = birth
        self.style = style
    }
}

final class IssueView: UIView {
    
    // MARK:- Views
    let nameLabel = Label()
    let surnameLabel = Label()
    let countLabel = Label()
    let birthLabel = Label()
    
    // MARK:- Lifecycle
    init() {
        super.init(frame: .zero)
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK:- Private functions
    private func addSubviews() {
        addSubview(nameLabel)
        addSubview(surnameLabel)
        addSubview(countLabel)
        addSubview(birthLabel)
    }
    
    private func setupConstraints() {
        nameLabel.snp.makeConstraints {
            $0.left.equalToSuperview().offset(8)
            $0.top.bottom.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.22)
        }
        surnameLabel.snp.makeConstraints {
            $0.left.equalTo(nameLabel.snp.right)
            $0.top.bottom.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.22)
        }
        countLabel.snp.makeConstraints {
            $0.left.equalTo(surnameLabel.snp.right)
            $0.top.bottom.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.22)
        }
        birthLabel.snp.makeConstraints {
            $0.left.equalTo(countLabel.snp.right)
            $0.top.bottom.right.equalToSuperview()
        }
    }
    
    // MARK:- Functions
    func config(with viewModel: IssueViewModel) {
        nameLabel.text = viewModel.name
        surnameLabel.text = viewModel.surname
        countLabel.text = viewModel.issuesCount
        birthLabel.text = viewModel.birth
        
        let style = viewModel.style
        
        backgroundColor = style == .header ? .systemBlue.withAlphaComponent(0.8) : .white
        layer.borderWidth = style == .header ? 0 : 0.5
        layer.borderColor = UIColor.gray.withAlphaComponent(0.2).cgColor
        
        [nameLabel, surnameLabel, countLabel, birthLabel].forEach {
            $0.font = style == .header ? .systemFont(ofSize: 12, weight: .bold) : .systemFont(ofSize: 13, weight: .regular)
            $0.textColor = style == .header ? .white : .black.withAlphaComponent(0.8)
        }
    }
}
