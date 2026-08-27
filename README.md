# Affine Hash

Retroactive `Hash.Protocol` conformances for `Affine.Discrete.Vector` and
`Affine.Discrete.Region`. Affine owns both types' native `Equatable` and
`Hashable` behavior; this seam exposes those implementations through Hash's
domain-typed `Hash.Value` without coupling either atom to the other.
