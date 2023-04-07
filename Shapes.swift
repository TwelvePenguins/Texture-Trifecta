//
//  Shapes.swift
//  SSC 2023
//
//  Created by Yuhan Du on 6/4/23.
//

import Foundation
import SwiftUI

struct PenguinTorso: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.28582*width, y: 0.72788*height))
        path.addCurve(to: CGPoint(x: 0.63284*width, y: 0.29497*height), control1: CGPoint(x: 0.28582*width, y: -0.20503*height), control2: CGPoint(x: 0.69179*width, y: 0.08859*height))
        path.addCurve(to: CGPoint(x: 0.40862*width, y: 0.80899*height), control1: CGPoint(x: 0.54577*width, y: 0.27464*height), control2: CGPoint(x: 0.41698*width, y: 0.35781*height))
        path.addCurve(to: CGPoint(x: 0.25672*width, y: 0.81989*height), control1: CGPoint(x: 0.40765*width, y: 0.86129*height), control2: CGPoint(x: 0.30896*width, y: 0.86039*height))
        path.addCurve(to: CGPoint(x: 0.28582*width, y: 0.72788*height), control1: CGPoint(x: 0.2806*width, y: 0.80354*height), control2: CGPoint(x: 0.28781*width, y: 0.76318*height))
        path.closeSubpath()
        return path
    }
}

struct PenguinBelly: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.63284*width, y: 0.29497*height))
        path.addCurve(to: CGPoint(x: 0.40862*width, y: 0.80899*height), control1: CGPoint(x: 0.54577*width, y: 0.27464*height), control2: CGPoint(x: 0.41698*width, y: 0.35781*height))
        path.addCurve(to: CGPoint(x: 0.63284*width, y: 0.29497*height), control1: CGPoint(x: 0.85373*width, y: 0.91802*height), control2: CGPoint(x: 0.6806*width, y: 0.36577*height))
        path.closeSubpath()
        return path
    }
}
