//
//  EditPopularSeach.swift
//  DealSearch
//
//  Created by Vu Bui Khanh Linh on 12/09/2022.
//

import SwiftUI

struct EditPopularSeach: View {
    @State private var showingAddSheet = false
    @StateObject var popularSearchData = PopularSearchData()
    @State private var searchText = ""
    
    var body: some View {
        // MARK: TRENDING PRODUCT LIST
        List {
            ForEach(searchResults) { search in
                HStack(alignment: .top, spacing: 17) {
                    Text(search.id)
                    Text(search.product_name)
                    
                    Spacer()
                }
                
                .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                    // Delete Product
                    Button(role: .destructive) {
                        popularSearchData.deleteData(searchToDelete: search)
                    } label: {
                        Label("Delete", systemImage: "trash")
                    }
                }
                
            }
        }
        .searchable(text: $searchText)
        .navigationTitle("Popular Searchkeys")
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                Button("Add Popular Search Key") {
                    showingAddSheet.toggle()
                    print("Pressed")
                }
                .sheet(isPresented: $showingAddSheet) {
                    AddPopularSearch()
                }
            }
        }
        
    }
    
    var searchResults: [PopularSearch] {
        if searchText.isEmpty {
            return popularSearchData.popularSearchList
        } else {
            return popularSearchData.popularSearchList.filter {$0.product_name.contains(searchText) || $0.id.contains(searchText)}
        }
    }
}

struct EditPopularSeach_Previews: PreviewProvider {
    static var previews: some View {
        EditPopularSeach()
    }
}
