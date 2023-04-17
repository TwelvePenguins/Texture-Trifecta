//
//  OrcaShapes.swift
//  SSC 2023
//
//  Created by Yuhan Du on 15/4/23.
//

import Foundation
import SwiftUI

struct OrcaBody: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.09552*width, y: 0.50558*height))
        path.addCurve(to: CGPoint(x: 0.37687*width, y: 0.42458*height), control1: CGPoint(x: 0.15299*width, y: 0.41368*height), control2: CGPoint(x: 0.28209*width, y: 0.45651*height))
        path.addCurve(to: CGPoint(x: 0.46269*width, y: 0.33112*height), control1: CGPoint(x: 0.39627*width, y: 0.42458*height), control2: CGPoint(x: 0.4097*width, y: 0.31944*height))
        path.addCurve(to: CGPoint(x: 0.47164*width, y: 0.42445*height), control1: CGPoint(x: 0.45622*width, y: 0.36461*height), control2: CGPoint(x: 0.44552*width, y: 0.41121*height))
        path.addCurve(to: CGPoint(x: 0.58582*width, y: 0.44795*height), control1: CGPoint(x: 0.50328*width, y: 0.42009*height), control2: CGPoint(x: 0.5602*width, y: 0.43834*height))
        path.addCurve(to: CGPoint(x: 0.8194*width, y: 0.50869*height), control1: CGPoint(x: 0.71716*width, y: 0.50636*height), control2: CGPoint(x: 0.73881*width, y: 0.4791*height))
        path.addCurve(to: CGPoint(x: 0.89179*width, y: 0.46586*height), control1: CGPoint(x: 0.83259*width, y: 0.49*height), control2: CGPoint(x: 0.86552*width, y: 0.45464*height))
        path.addCurve(to: CGPoint(x: 0.88657*width, y: 0.53595*height), control1: CGPoint(x: 0.87015*width, y: 0.47832*height), control2: CGPoint(x: 0.89179*width, y: 0.51181*height))
        path.addCurve(to: CGPoint(x: 0.90299*width, y: 0.63798*height), control1: CGPoint(x: 0.90672*width, y: 0.54919*height), control2: CGPoint(x: 0.8806*width, y: 0.58346*height))
        path.addCurve(to: CGPoint(x: 0.8194*width, y: 0.56633*height), control1: CGPoint(x: 0.86642*width, y: 0.64343*height), control2: CGPoint(x: 0.84776*width, y: 0.62007*height))
        path.addCurve(to: CGPoint(x: 0.7209*width, y: 0.57334*height), control1: CGPoint(x: 0.80746*width, y: 0.55387*height), control2: CGPoint(x: 0.74876*width, y: 0.56581*height))
        path.addCurve(to: CGPoint(x: 0.6709*width, y: 0.56633*height), control1: CGPoint(x: 0.70896*width, y: 0.56399*height), control2: CGPoint(x: 0.68184*width, y: 0.56243*height))
        path.addCurve(to: CGPoint(x: 0.66119*width, y: 0.5453*height), control1: CGPoint(x: 0.54179*width, y: 0.63019*height), control2: CGPoint(x: 0.54104*width, y: 0.55776*height))
        path.addCurve(to: CGPoint(x: 0.6709*width, y: 0.53128*height), control1: CGPoint(x: 0.6803*width, y: 0.53969*height), control2: CGPoint(x: 0.67562*width, y: 0.53362*height))
        path.addCurve(to: CGPoint(x: 0.4694*width, y: 0.53128*height), control1: CGPoint(x: 0.5097*width, y: 0.49514*height), control2: CGPoint(x: 0.4694*width, y: 0.51493*height))
        path.addCurve(to: CGPoint(x: 0.31574*width, y: 0.57702*height), control1: CGPoint(x: 0.48197*width, y: 0.62151*height), control2: CGPoint(x: 0.31963*width, y: 0.59643*height))
        path.addCurve(to: CGPoint(x: 0.2291*width, y: 0.5601*height), control1: CGPoint(x: 0.3238*width, y: 0.64483*height), control2: CGPoint(x: 0.30873*width, y: 0.75425*height))
        path.addCurve(to: CGPoint(x: 0.20149*width, y: 0.53517*height), control1: CGPoint(x: 0.2291*width, y: 0.54114*height), control2: CGPoint(x: 0.21418*width, y: 0.52739*height))
        path.addCurve(to: CGPoint(x: 0.14701*width, y: 0.50869*height), control1: CGPoint(x: 0.17782*width, y: 0.5497*height), control2: CGPoint(x: 0.16567*width, y: 0.53673*height))
        path.addCurve(to: CGPoint(x: 0.09552*width, y: 0.50558*height), control1: CGPoint(x: 0.13866*width, y: 0.51493*height), control2: CGPoint(x: 0.1092*width, y: 0.50921*height))
        path.closeSubpath()
        return path
    }
}

struct OrcaBelly: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.25*width, y: 0.60748*height))
        path.addCurve(to: CGPoint(x: 0.09552*width, y: 0.50558*height), control1: CGPoint(x: 0.18552*width, y: 0.59003*height), control2: CGPoint(x: 0.10597*width, y: 0.52842*height))
        path.addCurve(to: CGPoint(x: 0.14701*width, y: 0.50869*height), control1: CGPoint(x: 0.1092*width, y: 0.50921*height), control2: CGPoint(x: 0.13866*width, y: 0.51493*height))
        path.addCurve(to: CGPoint(x: 0.20149*width, y: 0.53517*height), control1: CGPoint(x: 0.16567*width, y: 0.53673*height), control2: CGPoint(x: 0.17782*width, y: 0.5497*height))
        path.addCurve(to: CGPoint(x: 0.2291*width, y: 0.5601*height), control1: CGPoint(x: 0.21418*width, y: 0.52739*height), control2: CGPoint(x: 0.2291*width, y: 0.54114*height))
        path.addLine(to: CGPoint(x: 0.25*width, y: 0.60748*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.72015*width, y: 0.57334*height))
        path.addCurve(to: CGPoint(x: 0.31716*width, y: 0.6215*height), control1: CGPoint(x: 0.59627*width, y: 0.61773*height), control2: CGPoint(x: 0.41269*width, y: 0.64486*height))
        path.addCurve(to: CGPoint(x: 0.31521*width, y: 0.57852*height), control1: CGPoint(x: 0.31716*width, y: 0.59559*height), control2: CGPoint(x: 0.316*width, y: 0.58288*height))
        path.addCurve(to: CGPoint(x: 0.31493*width, y: 0.57723*height), control1: CGPoint(x: 0.31504*width, y: 0.57809*height), control2: CGPoint(x: 0.31494*width, y: 0.57766*height))
        path.addCurve(to: CGPoint(x: 0.31521*width, y: 0.57852*height), control1: CGPoint(x: 0.31501*width, y: 0.57752*height), control2: CGPoint(x: 0.31511*width, y: 0.57795*height))
        path.addCurve(to: CGPoint(x: 0.4694*width, y: 0.53128*height), control1: CGPoint(x: 0.32289*width, y: 0.59777*height), control2: CGPoint(x: 0.48181*width, y: 0.6204*height))
        path.addCurve(to: CGPoint(x: 0.6709*width, y: 0.53128*height), control1: CGPoint(x: 0.4694*width, y: 0.51493*height), control2: CGPoint(x: 0.5097*width, y: 0.49514*height))
        path.addCurve(to: CGPoint(x: 0.66119*width, y: 0.5453*height), control1: CGPoint(x: 0.67562*width, y: 0.53362*height), control2: CGPoint(x: 0.6803*width, y: 0.53969*height))
        path.addCurve(to: CGPoint(x: 0.6709*width, y: 0.56633*height), control1: CGPoint(x: 0.54104*width, y: 0.55776*height), control2: CGPoint(x: 0.54179*width, y: 0.63019*height))
        path.addCurve(to: CGPoint(x: 0.72015*width, y: 0.57334*height), control1: CGPoint(x: 0.68184*width, y: 0.56243*height), control2: CGPoint(x: 0.70821*width, y: 0.56399*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.25*width, y: 0.60748*height))
        path.addCurve(to: CGPoint(x: 0.09552*width, y: 0.50558*height), control1: CGPoint(x: 0.18552*width, y: 0.59003*height), control2: CGPoint(x: 0.10597*width, y: 0.52842*height))
        path.addCurve(to: CGPoint(x: 0.14701*width, y: 0.50869*height), control1: CGPoint(x: 0.1092*width, y: 0.50921*height), control2: CGPoint(x: 0.13866*width, y: 0.51493*height))
        path.addCurve(to: CGPoint(x: 0.20149*width, y: 0.53517*height), control1: CGPoint(x: 0.16567*width, y: 0.53673*height), control2: CGPoint(x: 0.17782*width, y: 0.5497*height))
        path.addCurve(to: CGPoint(x: 0.2291*width, y: 0.5601*height), control1: CGPoint(x: 0.21418*width, y: 0.52739*height), control2: CGPoint(x: 0.2291*width, y: 0.54114*height))
        path.addLine(to: CGPoint(x: 0.25*width, y: 0.60748*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.72015*width, y: 0.57334*height))
        path.addCurve(to: CGPoint(x: 0.31716*width, y: 0.6215*height), control1: CGPoint(x: 0.59627*width, y: 0.61773*height), control2: CGPoint(x: 0.41269*width, y: 0.64486*height))
        path.addCurve(to: CGPoint(x: 0.31521*width, y: 0.57852*height), control1: CGPoint(x: 0.31716*width, y: 0.59559*height), control2: CGPoint(x: 0.316*width, y: 0.58288*height))
        path.addCurve(to: CGPoint(x: 0.31493*width, y: 0.57723*height), control1: CGPoint(x: 0.31504*width, y: 0.57809*height), control2: CGPoint(x: 0.31494*width, y: 0.57766*height))
        path.addCurve(to: CGPoint(x: 0.31521*width, y: 0.57852*height), control1: CGPoint(x: 0.31501*width, y: 0.57752*height), control2: CGPoint(x: 0.31511*width, y: 0.57795*height))
        path.addCurve(to: CGPoint(x: 0.4694*width, y: 0.53128*height), control1: CGPoint(x: 0.32289*width, y: 0.59777*height), control2: CGPoint(x: 0.48181*width, y: 0.6204*height))
        path.addCurve(to: CGPoint(x: 0.6709*width, y: 0.53128*height), control1: CGPoint(x: 0.4694*width, y: 0.51493*height), control2: CGPoint(x: 0.5097*width, y: 0.49514*height))
        path.addCurve(to: CGPoint(x: 0.66119*width, y: 0.5453*height), control1: CGPoint(x: 0.67562*width, y: 0.53362*height), control2: CGPoint(x: 0.6803*width, y: 0.53969*height))
        path.addCurve(to: CGPoint(x: 0.6709*width, y: 0.56633*height), control1: CGPoint(x: 0.54104*width, y: 0.55776*height), control2: CGPoint(x: 0.54179*width, y: 0.63019*height))
        path.addCurve(to: CGPoint(x: 0.72015*width, y: 0.57334*height), control1: CGPoint(x: 0.68184*width, y: 0.56243*height), control2: CGPoint(x: 0.70821*width, y: 0.56399*height))
        path.closeSubpath()
        return path
    }
}
struct OrcaSpot1: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.17225*width, y: 0.47695*height))
        path.addCurve(to: CGPoint(x: 0.20657*width, y: 0.48707*height), control1: CGPoint(x: 0.1812*width, y: 0.49688*height), control2: CGPoint(x: 0.19886*width, y: 0.492*height))
        path.addCurve(to: CGPoint(x: 0.19762*width, y: 0.47149*height), control1: CGPoint(x: 0.20334*width, y: 0.48369*height), control2: CGPoint(x: 0.19702*width, y: 0.47586*height))
        path.addCurve(to: CGPoint(x: 0.17225*width, y: 0.47695*height), control1: CGPoint(x: 0.19837*width, y: 0.46604*height), control2: CGPoint(x: 0.16105*width, y: 0.45202*height))
        path.closeSubpath()
        return path
    }
}

struct OrcaEye: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.addEllipse(in: CGRect(x: 0.13881*width, y: 0.47664*height, width: 0.01791*width, height: 0.02181*height))
        return path
    }
}

struct OrcaSpot2: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.46642*width, y: 0.45196*height))
        path.addCurve(to: CGPoint(x: 0.5194*width, y: 0.44495*height), control1: CGPoint(x: 0.47597*width, y: 0.42579*height), control2: CGPoint(x: 0.50622*width, y: 0.43664*height))
        path.addCurve(to: CGPoint(x: 0.48209*width, y: 0.46598*height), control1: CGPoint(x: 0.49478*width, y: 0.44495*height), control2: CGPoint(x: 0.48955*width, y: 0.45975*height))
        path.addCurve(to: CGPoint(x: 0.46642*width, y: 0.45196*height), control1: CGPoint(x: 0.4791*width, y: 0.46847*height), control2: CGPoint(x: 0.46215*width, y: 0.46364*height))
        path.closeSubpath()
        return path
    }
}
