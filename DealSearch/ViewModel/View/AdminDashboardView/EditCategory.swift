/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 3
  Author: Canh Cut Team
  Created  date: 12/09/2022
  Last modified: 15/09/2022
  Acknowledgement: None
*/

import SwiftUI

struct EditCategory: View {
    @State private var showingUpdateSheet = false
    @State private var showingAddCategory = false
    @StateObject var categoryData = CategoryData()
    @State private var searchText = ""
    
    var body: some View {
        // MARK: CATEGORY LIST
        List {
            ForEach(searchResults) { categ in
                HStack(alignment: .top, spacing: 17) {
                    Text(categ.id)
                    Text(categ.category_name)
                    
                    Spacer()
                }
                
                .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                    // Delete Category
                    Button(role: .destructive) {
                        categoryData.deleteData(categoryToDelete: categ)
                    } label: {
                        Label("Delete", systemImage: "trash")
                    }
                    
                    // Edit Product
                    Button {
                        showingUpdateSheet.toggle()
                    } label: {
                        Label("Pencil", systemImage: "pencil")
                    }
                    .sheet(isPresented: $showingUpdateSheet) {
                        UpdateCategSheetView(categoryClicked: categ)
                    }
                }
                
            }
        }
        .searchable(text: $searchText)
        .navigationTitle("All Categories")
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                Button("Add Category") {
                    showingAddCategory.toggle()
                    print("Pressed")
                }
                .sheet(isPresented: $showingAddCategory) {
                    AddCategory()
                }
            }
        }
        
    }
    
    var searchResults: [Category] {
        if searchText.isEmpty {
            return categoryData.categoryList
        } else {
            return categoryData.categoryList.filter {$0.category_name.contains(searchText) || $0.id.contains(searchText)}
        }
    }
}



struct EditCategory_Previews: PreviewProvider {
    static var previews: some View {
        EditCategory()
    }
}

// MARK: UPDATE SHEET
struct UpdateCategSheetView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var categoryData = CategoryData()
    @State var categoryClicked: Category
    @State private var updateMessage = ""
    
    @State private var categoryName: String = ""
    @State private var categoryImage: String = ""
    
    var body: some View {
        VStack {
            VStack(spacing: 10) {
                Text("Scroll down to close")
                Image(systemName: "arrow.down")
            }
            Spacer().frame(width: 0, height: 80)
            
            // MARK: CATEGORY INPUT FIELDS
            VStack(spacing:20) {
                Group {
                    VStack(alignment: .leading) {
                        Text("Category Name:")
                        TextField("Category Name", text: $categoryName)
                    }
                    VStack(alignment: .leading) {
                        Text("Category Image URL:")
                        TextField("Category Image URL", text: $categoryImage)
                    }
                }
                .textFieldStyle(RoundedBorderTextFieldStyle())
                
                // MARK: BUTTON UPDATE
                Button {
                    if checkField() {
                        categoryData.updateData(categoryToUpdate: categoryClicked, category_name: categoryName, category_image: categoryImage ?? categoryClicked.category_image)
                        updateMessage = "updated"
                        
                        // Clear the text field after submit
                        categoryName = ""
                        categoryImage = ""
                        
                    } else {
                        updateMessage = "error"
                    }
                } label: {
                    Text("Update Category")
                }
                
            }
            .padding(.horizontal, 30)
            .padding(.bottom, 20)
            
            if updateMessage == "updated" {
                Text("Updated!")
                    .foregroundColor(.green)
                    .font(.system(size: 25))
            } else if updateMessage == "error" {
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

