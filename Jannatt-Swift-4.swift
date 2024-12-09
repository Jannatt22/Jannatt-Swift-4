/*
Objective:
- Create a base protocol with common properties or methods for monsters.
- Derive two child protocols for specific monster types.
- Create four classes (two flying and two water monsters) conforming to these child protocols.
- Write a function that accepts a collection of Monster objects and prints details about each.*/

//Step 1: Creating the Base Protocol
protocol Monster {
    var name: String { get }
    func roar() -> String
}

// Step 2: Defining FlyingMonster and WaterMonster Protocols that inherits from base the protocol Monster
protocol FlyingMonster: Monster {
    var wingSpan: Double { get }
    func fly() -> String
}

protocol WaterMonster: Monster {
    var swimSpeed: Int { get }
    func swim() -> String
}

// Step 3: Defining four classes that conforms to FlyingMonster and WaterMonster

// Class Dragon
class Dragon: FlyingMonster {
    var name: String
    var wingSpan: Double

    init(name: String, wingSpan: Double) {
        self.name = name
        self.wingSpan = wingSpan
    }

    func roar() -> String {
        return "\(name) lets out a fierce battle cry!"
    }

    func fly() -> String {
        return "It spreads its \(wingSpan)-meter wings and soars into the clouds!"
    }
}

// Class Gryphon
class Gryphon: FlyingMonster {
    var name: String
    var wingSpan: Double

    init(name: String, wingSpan: Double) {
        self.name = name
        self.wingSpan = wingSpan
    }

    func roar() -> String {
        return "\(name) screams with a loud, sharp voice!"
    }

    func fly() -> String {
        return "It takes to the skies with its impressive \(wingSpan)-meter wings!"
    }
}

// Class Kraken
class Kraken: WaterMonster {
    var name: String
    var swimSpeed: Int

    init(name: String, swimSpeed: Int) {
        self.name = name
        self.swimSpeed = swimSpeed
    }

    func roar() -> String {
        return "\(name) growls a low, deep sound!"
    }

    func swim() -> String {
        return "It moves swiftly through the water at \(swimSpeed) knots!"
    }
}

// Class Merfolk
class Merfolk: WaterMonster {
    var name: String
    var swimSpeed: Int

    init(name: String, swimSpeed: Int) {
        self.name = name
        self.swimSpeed = swimSpeed
    }

    func roar() -> String {
        return "\(name) sings a soft, enchanting song!"
    }

    func swim() -> String {
        return "It swims peacefully through the coral reef at \(swimSpeed) knots!"
    }
}

// Step 4: Creating a Function to Handle different types of Monsters
// using polymorphism to call appropriate methods based on their type
func printMonsterDetails(monsters: [Monster]) {
    for monster in monsters {
      
      // Printing the monster's name and its runtime type
        print(">>> Creature type: \(monster.name) (\(type(of: monster)))")
        
      // Polymorphic method for roar()
      // it allows different types to respond differently to the same method.
        print("\(monster.roar())")
        
        // Now, we need to use polymorphism for the flying/swimming part
        if let flyingMonster = monster as? FlyingMonster {
            // If the monster is a FlyingMonster, call the fly() method
            print(flyingMonster.fly())
        } else if let waterMonster = monster as? WaterMonster {
            // If the monster is a WaterMonster, call the swim() method
            print(waterMonster.swim())
        }
        
        // Creating a separator line to separate each monster's details for readability 
        var separator = String(repeating: "-", count: 60) // Creates a separator
        print(separator)
    }
}

// Creating instances of monsters
let dragon = Dragon(name: "Ironfeather", wingSpan: 18.0)
let gryphon = Gryphon(name: "Goldenbeak", wingSpan: 15.0)
let kraken = Kraken(name: "Silverclaw", swimSpeed: 25)
let merfolk = Merfolk(name: "Crystalbloom", swimSpeed: 12)

// creating Array of monsters
let monsters: [Monster] = [dragon, gryphon, kraken, merfolk]

// Printing details for each monster
printMonsterDetails(monsters: monsters)
