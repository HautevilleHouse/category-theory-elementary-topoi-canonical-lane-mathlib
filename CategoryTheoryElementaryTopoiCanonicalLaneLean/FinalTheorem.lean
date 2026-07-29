import canonicalLaneMathlib.AdmissibleClass
import CategoryTheoryElementaryTopoiCanonicalLaneLean.YonedaLemma
import CategoryTheoryElementaryTopoiCanonicalLaneLean.SubobjectClassifier
import CategoryTheoryElementaryTopoiCanonicalLaneLean.ExponentialAdjunction

namespace HautevilleHouse
namespace CategoryTheoryElementaryTopoiCanonicalLaneLean

def ConstrainedToposClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_topos_endgame (A : AdmissibleClass) : ConstrainedToposClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CategoryTheoryElementaryTopoiCanonicalLaneLean
end HautevilleHouse
