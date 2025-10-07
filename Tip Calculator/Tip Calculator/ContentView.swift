//
//  ContentView.swift
//  Tip Calculator
//
//  Created by Ahmad El-Bobou on 10/6/25.
//

import SwiftUI

struct ContentView: View {
    @State private var billTotal: Double? = 35.50
    @State private var tipPercentage: Double? = 15
    
    private var tipTotal: Double  {
        (billTotal ?? 0.0) * (tipPercentage ?? 0.0) / 100
    }
    var body: some View {
        ZStack {
            LinearGradient(colors: [.purple, .blue, .green], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack {
                Spacer()
                HStack {
                    doubleTextField("Bill Total", value: $billTotal, type: .money)
                    doubleTextField("Tip Percentage", value: $tipPercentage, type: .percentage)
                }.padding()
                if tipTotal == 0.0 {
                   Text("Please insert your values")
                } else {
                    Text("You should leave")
                    Text("\(tipTotal, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))")
                        .fontWeight(.bold)
                        .font(.largeTitle)
                        .monospacedDigit()
                    Text("as tip")
                }
                Spacer()
            }
            .padding()
        }
    }
}

enum TextFieldType {
    case percentage
    case money
}

@ViewBuilder
private func doubleTextField(_ placeholder: String, value: Binding<Double?>, type: TextFieldType) -> some View {
    HStack {
        Text(type == TextFieldType.money ? Locale.current.currencySymbol ?? "$": "%")
            .font(.largeTitle)
            .foregroundColor(.secondary)
        TextField(placeholder, value: value, format: .number)
            .keyboardType(.numberPad)
            .multilineTextAlignment(.trailing)
            .font(.largeTitle)
            .monospacedDigit()
    }
    .padding()
    .background(
        RoundedRectangle(cornerRadius: 6)
            .foregroundColor(Color.white)
    )
    
}

#Preview {
    ContentView()
}
