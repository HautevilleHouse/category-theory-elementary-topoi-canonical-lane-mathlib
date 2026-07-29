import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryElementaryTopoiCanonicalLaneLean

structure ElementaryTopos where
  carrier : Type u
  terminalObject : carrier
  pullback : (A B : carrier) → carrier
  exponential : (A B : carrier) → carrier
  subobjectClassifier : carrier
  terminalObjectUniversal : Prop
  pullbackExists : Prop
  exponentialAdjunction : Prop
  subobjectClassifierUniversal : Prop

structure AdmissibleClass where
  topos : ElementaryTopos
  bridgeClosed : Prop
  gateClosed : Prop
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  A.bridgeClosed ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end CategoryTheoryElementaryTopoiCanonicalLaneLean
end HautevilleHouse