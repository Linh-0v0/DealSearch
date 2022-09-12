//
//  AddCategory.swift
//  DealSearch
//
//  Created by Vu Bui Khanh Linh on 12/09/2022.
//

import SwiftUI

struct AddCategory: View {
    @StateObject private var categoryData = CategoryData()
    @State private var addMessage = ""
    
    @State private var categoryImage: String = ""
    @State private var categoryName: String = ""
    
    var body: some View {
        VStack {
            VStack(spacing: 10) {
                Text("Scroll down to close")
                Image(systemName: "arrow.down")
            }
            Spacer().frame(width: 0, height: 80)
            
            VStack(spacing:20) {
                Group {
                    VStack(alignment: .leading) {
                        Text("Category Name:")
                        TextField("Category Name", text: $categoryName)
                    }
                    VStack(alignment: .leading) {
                        Text("Category Image:")
                        TextField("Category Image", text: $categoryImage)
                    }
                }
                .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button {
                    if checkField() {
                    categoryData.addData(category_image: categoryImage, category_name: categoryName)
                    addMessage = "added"
                    
                    // Clear the text field after submit
                    categoryImage = ""
                    categoryName = ""
                    } else {
                        addMessage = "error"
                    }
                } label: {
                    Text("Add Category")
                }
                .padding(.bottom, 15)
            }
            .padding(.horizontal, 30)
            
            if addMessage == "added" {
                Text("Added!")
                    .foregroundColor(.green)
                    .font(.system(size: 25))
            } else if addMessage == "error" {
                Text("Invalid input!")
                    .foregroundColor(.red)
                    .font(.system(size: 25))
            }
        }
        
    }
    
    func checkField() -> Bool{
        if categoryName == "" {
            return false
        }
        return true
    }
    
}

struct AddCategory_Previews: PreviewProvider {
    static var previews: some View {
        AddCategory()
    }
}
