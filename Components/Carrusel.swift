import SwiftUI

struct CarouselItemModel {
    var image: String
    var title: String
    var numberOfStars: Int
}

struct Carrusel: View {
    var items: [CarouselItemModel]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(items, id: \.title) { item in
                   CarruselItemComponent(item: item)
                }
            }
        }.padding(.vertical)
    }
}

struct CarruselItemComponent: View {
    var item: CarouselItemModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Text(item.title)
                Spacer()
//                ForEach(0..<item.numberOfStars, id: \.self) { _ in
//                    Image(systemName: "star.fill")
//                        .foregroundColor(.yellow)
//                }
            }
                .fontWeight(.bold)
                .font(.headline)
                .padding(.bottom, 0)
            CarruselImage(image: item.image)
        }
    }
}

struct CarruselImage: View {
    var image: String
    
    var body: some View {
        Image(image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 300)
            .cornerRadius(8)
            .padding(.top,0)
    }
}

struct Carrusel_Previews: PreviewProvider {
    static var previews: some View {
        let items = [
            CarouselItemModel(image: "portada1", title: "Lorem Impsum", numberOfStars: 3),
            CarouselItemModel(image: "portada2", title: "Lorem Impsum", numberOfStars: 5),
            CarouselItemModel(image: "portada3", title: "Lorem Impsum", numberOfStars: 4)
        ]
        
        Carrusel(items: items)
    }
}
