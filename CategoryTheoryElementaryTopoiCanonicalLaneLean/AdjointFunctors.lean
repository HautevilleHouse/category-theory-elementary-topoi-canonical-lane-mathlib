import HautevilleHouse.CategoryTheoryElementaryTopoiCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryElementaryTopoiCanonicalLaneLean

structure AdjointPackage (T : ElementaryTopos) where
  leftAdjoint : (F : T.carrier → T.carrier) → (G : T.carrier → T.carrier) → Prop
  rightAdjoint : (F : T.carrier → T.carrier) → (G : T.carrier → T.carrier) → Prop
  adjunctionIso : Prop
  unitCounit : Prop
  adjunctionIsoClosed : adjunctionIso
  unitCounitClosed : unitCounit

structure AdjointEvidence {T : ElementaryTopos} (A : AdjointPackage T) where
  adjunctionIsoClosed : A.adjunctionIsoClosed
  unitCounitClosed : A.unitCounitClosed

def AdjointClosed {T : ElementaryTopos} (A : AdjointPackage T) : Prop :=
  A.adjunctionIso ∧ A.unitCounit

theorem adjoint_closed_from_evidence {T : ElementaryTopos} (A : AdjointPackage T) (E : AdjointEvidence A) : AdjointClosed A :=
  And.intro E.adjunctionIsoClosed E.unitCounitClosed

end CategoryTheoryElementaryTopoiCanonicalLaneLean
end HautevilleHouse