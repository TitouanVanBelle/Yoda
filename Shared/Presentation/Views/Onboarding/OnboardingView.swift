//
//  OnboardingView.swift
//  Yoda
//
//  Created by Titouan Van Belle on 22.01.21.
//

import SwiftUI

struct OnboardingView: View {

    @Binding var needsOnboarding: Bool

    var body: some View {
        ZStack(alignment: .center) {
            Daisy.color.primaryBackground
                .edgesIgnoringSafeArea(.all)

            VStack(alignment: .center, spacing: 80) {
                appIcon
                copy
            }

            VStack {
                Spacer()
                nextButton
            }
            .padding(.bottom, 52)
        }
    }
}

fileprivate extension OnboardingView {
    var appIcon: some View {
        Image("RemindIcon")
            .resizable()
            .frame(width: 140, height: 140)
    }

    var copy: some View {
        VStack(alignment: .center, spacing: 0) {
            Text("Be Kind")
                .font(Daisy.font.h1)
                .foregroundColor(Daisy.color.primaryForeground)
                .padding(.bottom, -14)

            Text("Remind")
                .font(Daisy.font.h0)
                .foregroundColor(Daisy.color.quartiaryForeground)

            Text("Help your future self remember.\nSchedule reminders and get notified.")
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .font(Daisy.font.largeTitle)
                .foregroundColor(Daisy.color.secondaryForeground)
        }
    }

    var nextButton: some View {
        Button(action: { withAnimation(.spring()) { needsOnboarding = false } }) {
            Text("Get Started")
                .font(Daisy.font.smallButton)
                .foregroundColor(Daisy.color.white)
                .padding(.horizontal, 32)
        }
        .background(
            RoundedCorners(radius: 24)
                .fill(Daisy.color.tertiaryForeground)
                .frame(height: 48)
                .shadow(color: Daisy.color.black.opacity(0.5), radius: 16, x: 0, y: 8)
        )
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(needsOnboarding: .constant(true))
    }
}