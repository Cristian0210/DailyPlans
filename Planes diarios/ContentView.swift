//
//  ContentView.swift
//  Planes diarios
//
//  Created by Cristian Vangheli on 5/2/24.
//

import SwiftUI

struct DailyPlan {
    let title: String
    let tasks: [String]
}

struct ContentView: View {
    @State private var plans: [DailyPlan] = [
        DailyPlan(title: "Plan A", tasks: ["Hacer ejercicio", "Leer un libro", "Practicar la meditación", "Cenar"]),
        DailyPlan(title: "Plan B", tasks: ["Trabajar en el proyecto X", "Reunión con el equipo", "Aprender algo nuevo"]),
        // Agrega más planes según sea necesario
    ]

    @State private var selectedPlan: DailyPlan?

    var body: some View {
        NavigationView {
            ZStack {
                // Fondo degradado con colores
                LinearGradient(
                    gradient: Gradient(colors: [Color.blue, Color.purple]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .edgesIgnoringSafeArea(.all)

                // Contenido de la aplicación
                VStack {
                    Text("Generador de Planes Diarios Aleatorios")
                        .font(.title)
                        .padding()

                    Button("Generar Plan") {
                        selectedPlan = plans.randomElement()
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.green)
                    .cornerRadius(10)

                    Button("Actualizar Planes") {
                        updatePlans()
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.orange)
                    .cornerRadius(10)

                    if let plan = selectedPlan {
                        PlanDetailView(plan: plan)
                    }
                }
                .foregroundColor(.white) // Asegura que el texto sea visible sobre el fondo de colores
            }
            .navigationTitle("Daily Planner")
        }
    }

    private func updatePlans() {
        // Simplemente asigna nuevos planes aleatorios
        plans = [
            DailyPlan(title: "Nuevo Plan A", tasks: ["Jugar futbol", "Tomar algo", "Estudiar"]),
            DailyPlan(title: "Nuevo Plan B", tasks: ["Echarme una Siesta", "Ir a pescar", "Hacer una donacion"]),
            // Agrega más planes según sea necesario
        ]

        // También puedes deseleccionar el plan actual
        selectedPlan = nil
    }
}

struct PlanDetailView: View {
    let plan: DailyPlan

    var body: some View {
        VStack(alignment: .leading) {
            Text("Plan: \(plan.title)")
                .font(.headline)
                .padding(.bottom, 10)

            ForEach(plan.tasks, id: \.self) { task in
                Text("• \(task)")
                    .padding(.bottom, 5)
            }

            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


