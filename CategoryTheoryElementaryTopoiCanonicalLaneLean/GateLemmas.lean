import canonicalLaneMathlib.BridgeLemmas

namespace HautevilleHouse
namespace CategoryTheoryElementaryTopoiCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.universalPropertySatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end CategoryTheoryElementaryTopoiCanonicalLaneLean
end HautevilleHouse