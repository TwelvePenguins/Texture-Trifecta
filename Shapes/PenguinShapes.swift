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

struct PenguinBeak: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.74403*width, y: 0.2093*height))
        path.addLine(to: CGPoint(x: 0.6209*width, y: 0.17445*height))
        path.addCurve(to: CGPoint(x: 0.63806*width, y: 0.26947*height), control1: CGPoint(x: 0.62836*width, y: 0.18847*height), control2: CGPoint(x: 0.64179*width, y: 0.22664*height))
        path.addLine(to: CGPoint(x: 0.74403*width, y: 0.2093*height))
        path.closeSubpath()
        return path
    }
}

struct PenguinFlipper: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.4458*width, y: 0.49455*height))
        path.addCurve(to: CGPoint(x: 0.48134*width, y: 0.3933*height), control1: CGPoint(x: 0.43555*width, y: 0.58333*height), control2: CGPoint(x: 0.73209*width, y: 0.68847*height))
        path.addCurve(to: CGPoint(x: 0.4458*width, y: 0.49455*height), control1: CGPoint(x: 0.47015*width, y: 0.41433*height), control2: CGPoint(x: 0.45021*width, y: 0.46402*height))
        path.closeSubpath()
        return path
    }
}

struct PenguinLFoot: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.60821*width, y: 0.8565*height))
        path.addLine(to: CGPoint(x: 0.55672*width, y: 0.81989*height))
        path.addCurve(to: CGPoint(x: 0.46642*width, y: 0.81989*height), control1: CGPoint(x: 0.52328*width, y: 0.82597*height), control2: CGPoint(x: 0.48259*width, y: 0.82242*height))
        path.addLine(to: CGPoint(x: 0.51866*width, y: 0.91647*height))
        path.addLine(to: CGPoint(x: 0.51866*width, y: 0.87285*height))
        path.addLine(to: CGPoint(x: 0.5694*width, y: 0.89155*height))
        path.addLine(to: CGPoint(x: 0.54701*width, y: 0.8565*height))
        path.addLine(to: CGPoint(x: 0.60821*width, y: 0.8565*height))
        path.closeSubpath()
        return path
    }
}

struct PenguinRFoot: Shape {    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.72761*width, y: 0.77394*height))
        path.addLine(to: CGPoint(x: 0.66194*width, y: 0.7609*height))
        path.addCurve(to: CGPoint(x: 0.61194*width, y: 0.80218*height), control1: CGPoint(x: 0.65299*width, y: 0.77025*height), control2: CGPoint(x: 0.64328*width, y: 0.78427*height))
        path.addLine(to: CGPoint(x: 0.66119*width, y: 0.85728*height))
        path.addLine(to: CGPoint(x: 0.66194*width, y: 0.82145*height))
        path.addLine(to: CGPoint(x: 0.7097*width, y: 0.83158*height))
        path.addLine(to: CGPoint(x: 0.69403*width, y: 0.79341*height))
        path.addLine(to: CGPoint(x: 0.72761*width, y: 0.77394*height))
        path.closeSubpath()
        return path
    }
}

struct PenguinEye: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.addEllipse(in: CGRect(x: 0.50522*width, y: 0.13999*height, width: 0.06418*width, height: 0.06698*height))
        return path
    }
}
