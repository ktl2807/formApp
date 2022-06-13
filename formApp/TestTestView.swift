//
//  TestTestView.swift
//  formApp
//
//  Created by sand liao on 27/05/2022.
//

import SwiftUI

struct TestTestView: View {
    var body: some View {
        DatePicker(selection: /*@START_MENU_TOKEN@*/.constant(Date())/*@END_MENU_TOKEN@*/, label: { /*@START_MENU_TOKEN@*/Text("Date")/*@END_MENU_TOKEN@*/ })
           
    }
}

struct TestTestView_Previews: PreviewProvider {
    static var previews: some View {
        TestTestView()
    }
}
