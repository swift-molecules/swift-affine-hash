import Affine
import Affine_Hash
import Cardinal
import Hash
import Ordinal
import Testing

@Suite
struct `Affine Hash Tests` {

    @Test
    func `Discrete Vector supplies Hash's domain-typed value`() {
        let first: Hash.Value = hash(Affine.Discrete.Vector(3))
        let second: Hash.Value = hash(Affine.Discrete.Vector(3))

        #expect(first == second)
    }

    @Test
    func `Discrete Region supplies Hash's domain-typed value`() {
        let region = Affine.Discrete.Region(start: Ordinal(UInt(2)), count: Cardinal(UInt(4)))
        let first: Hash.Value = hash(region)
        let second: Hash.Value = hash(region)

        #expect(first == second)
    }
}

private func hash<T: Hash.`Protocol`>(_ value: borrowing T) -> Hash.Value {
    value.hashValue
}
