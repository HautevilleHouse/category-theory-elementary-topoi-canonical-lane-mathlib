import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryElementaryTopoiCanonicalLaneLean

structure YonedaLemma (C : Type u) [Category C] where
  object : C
  presheaf : Cᵒᵖ ⥤ Type v
  naturalTransformation : (yoneda.obj object) ⟶ presheaf
  bijection : (presheaf.obj (op object)) ≃ (yoneda.obj object ⟶ presheaf)
  bijectionNatural : ∀ (f : presheaf.obj (op object)), bijection f = (yoneda.obj object).map f
  bijectionInverse : (bijection.symm : (yoneda.obj object ⟶ presheaf) → presheaf.obj (op object)) = λ α => α.app (op object) (𝟙 object)

structure YonedaEvidence {C : Type u} [Category C] (L : YonedaLemma C) where
  bijectionClosed : L.bijection
  bijectionNaturalClosed : L.bijectionNatural
  bijectionInverseClosed : L.bijectionInverse

def YonedaClosed {C : Type u} [Category C] (L : YonedaLemma C) : Prop :=
  L.bijection ∧ L.bijectionNatural ∧ L.bijectionInverse

theorem yoneda_closed_from_evidence {C : Type u} [Category C] (L : YonedaLemma C) (E : YonedaEvidence L) : YonedaClosed L := by
  exact And.intro E.bijectionClosed (And.intro E.bijectionNaturalClosed E.bijectionInverseClosed)

end CategoryTheoryElementaryTopoiCanonicalLaneLean
end HautevilleHouse
