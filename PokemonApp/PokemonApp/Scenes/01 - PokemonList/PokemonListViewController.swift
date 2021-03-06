import UIKit

class PokemonListViewController: UIViewController {
    let service = PokemonService()
    let imageLoader: ImageLoader
    let stackView = UIStackView()
    let scrollView = UIScrollView()
    
    init(imageLoader: ImageLoader) {
        self.imageLoader = imageLoader
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        title = "Pokémon"
        setupScrollView()
        setupStackView()
        showMock()
        service.getPokemonList { (result, error) in
            print(result as Any)
            print(error as Any)
        }
    }
    
    func setupScrollView() {
        view.addAutoLayoutSubview(scrollView)
        scrollView.edgesToSuperview()
    }
    
    func setupStackView() {
        stackView.axis = .vertical
        scrollView.addAutoLayoutSubview(stackView)
        
        stackView.edgesToSuperview()
        NSLayoutConstraint.activate([
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
    }
    
    func showMock() {
        Array(repeating: PokemonViewData.mockList(), count: 30)
            .flatMap { $0 }
            .map(createCell(pokemonData:))
            .forEach(stackView.addArrangedSubview(_:))
    }
    
    func createCell(pokemonData: PokemonViewData) -> UIView {
        let view = UIView()
        view.backgroundColor = .white
        
        let contentView = UIView()
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        
        let nameLabel = UILabel()
        let typesLabel = UILabel()
        nameLabel.font = .boldSystemFont(ofSize: 20)
        typesLabel.textColor = .white
        nameLabel.textColor = .white
        typesLabel.textColor = .white
        
        view.addAutoLayoutSubview(contentView)
        contentView.addAutoLayoutSubview(imageView)
        contentView.addAutoLayoutSubview(stackView)
        
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(typesLabel)
        
        contentView.edgesToSuperview(top: 16, bottom: 16, leading: 24, trailing: 24)
        contentView.layer.cornerRadius = 16
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 100),
            imageView.heightAnchor.constraint(equalToConstant: 100),
            imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            stackView.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 8),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -8),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
        ])
        
        nameLabel.text = pokemonData.name
        typesLabel.text = "types: " + pokemonData.types.joined(separator: ", ")
        
        imageLoader.loadImage(from: pokemonData.imageURL, to: imageView)
        
        imageView.image?.getColors { colors in
            contentView.backgroundColor = colors?.background ?? .lightGray
        }
        
        let viewTap = TapGestureRecognizer {
            self.showPokemonDetail(id: pokemonData.id)
        }
        
        view.addGestureRecognizer(viewTap)
        
        return view
    }
    
    func showPokemonDetail(id: Int) {
        navigationController?.pushViewController(PokemonDetailViewController(pokemonID: id), animated: true)
    }
}
