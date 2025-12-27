
# hg-swift-patterns

**A collection of design pattern implementations in Swift**  
Explore practical examples of software design patterns written in clean, modern Swift.

---

## Patterns Implemented

### Creational
- **Unit of Work** — Aggregate operations under a single transaction interface.

*(Add more patterns here as you expand the project.)*

---

## 📁 Project Structure

```
hg-swift-patterns/
├── abstract-document/
├── creational/
├── repository/
├── unit-of-work/
└── LICENSE
```

- Each folder represents a category of design patterns.
- Files contain focused, easy-to-read Swift code demonstrating each pattern.

---

## Getting Started

### Clone the Repository

```bash
git clone https://github.com/hgq287/hg-swift-patterns.git
cd hg-swift-patterns
```

### Open in Xcode

Open the project or `.swift` files directly in Xcode to explore and run each pattern.

> You can also create a Swift Playground and import the source code for easier experimentation.

---

## Example Usage (Unit of Work)

```swift
let repository = Repository()
let unitOfWork = UnitOfWork(repository: repository)

unitOfWork.perform {
    // Queue multiple data operations
}.commit()
```

---

## Requirements

- Swift 5+
- Xcode 16 or newer
- macOS or iOS development environment

---

## Contributing

Want to contribute another pattern or improve an existing one? Feel free to:
- Fork the repository
- Submit a pull request
- Open an issue to discuss improvements

---

## License

This project is licensed under the [MIT License](LICENSE).

---

## Author

Maintained by [@hgq287](https://hgq287.github.io/).  
Feel free to reach out or share improvements.
