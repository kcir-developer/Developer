//
//  EditablePopupView.swift
//  CalendarHabits
//
//  Created by Ricardo Dias on 14/10/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var isEditablePopupShowing = false
    @State private var selectedDay: Date?
    @State private var popupText = ""
    @State private var savedTexts: [String] = []

    var body: some View {
        Button("Mostrar Pop-up") {
            self.isEditablePopupShowing = true
        }
        .padding()
        .sheet(isPresented: $isEditablePopupShowing) {
            EditablePopupView(
                isEditablePopupShowing: $isEditablePopupShowing,
                selectedDay: $selectedDay,
                popupText: $popupText,
                savedTexts: $savedTexts
            )
        }
    }
}

struct EditablePopupView: View {
    @Binding var isEditablePopupShowing: Bool
    @Binding var selectedDay: Date?
    @Binding var popupText: String
    @Binding var savedTexts: [String]

    var body: some View {
        NavigationView {
            VStack {
                Text("Agenda")
                    .font(.title)
                    .padding()

                if let selectedDate = selectedDay {
                    Text("Dia selecionado: \(selectedDate.formattedDay())")
                }

                TextField("Digite algo aqui", text: $popupText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                HStack {
                    Button("Cancelar") {
                        self.isEditablePopupShowing = false
                    }

                    if !popupText.isEmpty {
                        Button("Salvar") {
                            savedTexts.append(popupText)
                            self.isEditablePopupShowing = false
                        }
                    }
                }
                .padding()
            }
        }
    }
}



