import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryElementaryTopoiCanonicalLaneLean

structure AdjunctionConstruction where
  leftAdjoint : Type u → Type v
  rightAdjoint : Type u → Type v
  unitNatural : Prop
  counitNatural : Prop
  triangleIdentities : Prop
  adjunctionEvidence : unitNatural ∧ counitNatural ∧ triangleIdentities

structure AdjointFunctorBridge (A : AdmissibleClass) where
  construction : AdjunctionConstruction
  evidence : construction.adjunctionEvidence
  bridgeClosed : bridgeClosed A

end CategoryTheoryElementaryTopoiCanonicalLaneLean
end HautevilleHouse