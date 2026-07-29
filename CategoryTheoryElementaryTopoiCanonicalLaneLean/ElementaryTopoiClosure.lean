import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryElementaryTopoiCanonicalLaneLean

def ElementaryTopoiClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem elementary_topoi_endgame (A : AdmissibleClass) : ElementaryTopoiClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CategoryTheoryElementaryTopoiCanonicalLaneLean
end HautevilleHouse