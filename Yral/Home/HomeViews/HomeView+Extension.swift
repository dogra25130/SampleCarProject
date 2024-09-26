//
//  HomeView+Extension.swift
//  Yral
//
//  Created by Abhishek Dogra on 26/09/24.
//

import SwiftUI
import MapKit

typealias HomeViewFactory = HomeView
extension HomeViewFactory {
    @ViewBuilder
    var TopView: some View {
        if let models = viewModel.dataModel?.extraInfoModel {
            HStack(spacing: .p26) {
                Spacer()
                ForEach(models) { model in
                    ImageLabelView(data: model,
                                   titleFontWeight: .semiBold600,
                                   titleFontSize: .font16,
                                   spacing: .p10)
                }
                Spacer()
            }
        }
    }
    
    @ViewBuilder
    var CarInfoView: some View {
        if let carInfoModel = viewModel.dataModel?.carInfoModel {
            VStack(alignment: .leading, spacing: .zero) {
                Text(carInfoModel.title)
                    .tracking(.t3)
                    .font(.setFont(.regular400, .font12))
                    .padding(.leading, .p22)
                    .padding(.bottom, .p16)
                Image(carInfoModel.image)
                    .resizable()
                    .frame(width: carInfoModel.imageWidth,
                           height: carInfoModel.imageHeight)
                CarDetailView
            }
            .padding(.vertical, .p18)
            .background(
                RoundedRectangle(cornerRadius: .p20)
                    .fill(Color.lightGrayBG)
            )
        }
    }
    
    @ViewBuilder
    var ProfileViewContainer: some View {
        if let profileModel = viewModel.dataModel?.profileModel {
            HStack(spacing: .p16) {
                ProfileView(for: profileModel)
                .frame(maxWidth: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: .p20)
                        .fill(Color.lightGrayBG)
                )
                
                MapView
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .clipShape(RoundedRectangle(cornerRadius: .p20))
            }
        }
    }
    
    @ViewBuilder
    private func MoreCarsInfoView(model: MoreCarModelInfo) -> some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading, spacing: .p10) {
                Text(model.title)
                    .font(.setFont(.bold700, .font20))
                    .foregroundStyle(Color.white)
                HStack(spacing: .p26) {
                    ForEach(model.extraInfoModel) { model in
                        ImageLabelView(data: model,
                                       titleFontWeight: .regular400,
                                       titleFontSize: .font12,
                                       spacing: .p6)
                    }
                    .foregroundStyle(Color.lightWhiteTextColor)
                }
            }
            Spacer()
            Image.arrawRightCircle
                .resizable()
                .frame(width: .p32, height: .p32)
                .foregroundStyle(Color.white)
            
            
        }
    }
}

extension HomeViewFactory {
    @ViewBuilder
    private var CarDetailView: some View {
        if let carInfoModel = viewModel.dataModel?.carInfoModel {
            VStack(alignment: .leading, spacing: .p8) {
                Text(carInfoModel.carName)
                    .font(.setFont(.semiBold600, .font20))
                HStack(spacing: .p20) {
                    ForEach(carInfoModel.infoLabel) { model in
                        ImageLabelView(data: model,
                                       titleFontWeight: .regular400,
                                       titleFontSize: .font12,
                                       spacing: .p2)
                    }
                    Spacer()
                    Text(carInfoModel.price)
                        .font(.setFont(.semiBold600, .font14))
                        .padding(.trailing, .p8)
                }
                
            }
            .padding(.horizontal, .p22)
        }
    }
    
    @ViewBuilder
    private func ProfileView(for profileModel: ProfileModel) -> some View {
        VStack(spacing: .zero) {
            Image(profileModel.imageURL)
                .resizable()
                .frame(width: .p72, height: .p72)
                .padding(.top, .p28)
                .padding(.bottom, .p14)
            
            Text(profileModel.title)
                .font(.setFont(.medium500, .font16))
                .padding(.bottom, .p6)
            
            Text(profileModel.amount)
                .font(.setFont(.bold700, .font14))
                .padding(.bottom, .p20)
        }
    }
    
    @ViewBuilder
    private var MapView: some View {
        /// Settings Mock location coordinates of Gurugram for now
        let position = MapCameraPosition.region(
            MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: 28.4595, longitude: 77.0266),
                span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
            )
        )
        Map(initialPosition: position)
    }
    
    @ViewBuilder
    var MoreCarsView: some View {
        if let carsModel = viewModel.dataModel?.moreCarModel {
            VStack(spacing: .p20) {
                HStack {
                    Text(carsModel.title)
                        .font(.setFont(.regular400, .font12))
                        .foregroundStyle(Color.lightWhiteTextColorV2)
                    Spacer()
                    Button {
                        
                    } label: {
                        Image.ellipsis
                            .foregroundStyle(Color.lightGrayTextColor)
                            .padding(.trailing, .p8)
                    }
                }
                ForEach(carsModel.carModels) { model in
                    MoreCarsInfoView(model: model)
                    if model.id != carsModel.carModels.last?.id {
                        Rectangle()
                            .frame(height: .p1)
                            .foregroundStyle(Color.dividerColor)
                    }
                }
            }
            .padding(.p24)
            .background {
                RoundedRectangle(cornerRadius: .p20)
                    .fill(Color.darkBlackBG)
            }
        }
    }
}

#Preview(body: {
    HomeView()
})
