import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryElementaryTopoiCanonicalLaneLean

structure ExponentialAdjunction (E : Type u) [Category E] [CartesianClosed E] where
  exponent : (A B : E) → E
  evaluation : (A B : E) → (exponent A B) ⨯ A ⟶ B
  currying : (A B C : E) → (C ⨯ A ⟶ B) → (C ⟶ exponent A B)
  adjunction : ∀ (A B C : E) (f : C ⨯ A ⟶ B), (evaluation A B) ∘ ((currying A B C f) ⊗ (𝟙 A)) = f
  uniqueness : ∀ (A B C : E) (g : C ⟶ exponent A B), currying A B C ((evaluation A B) ∘ (g ⊗ (𝟙 A))) = g

structure ExponentialAdjunctionEvidence {E : Type u} [Category E] [CartesianClosed E] (Exp : ExponentialAdjunction E) where
  exponentClosed : ∀ (A B : E), Exp.exponent A B
  evaluationClosed : ∀ (A B : E), Exp.evaluation A B
  curryingClosed : ∀ (A B C : E) (f : C ⨯ A ⟶ B), Exp.currying A B C f
  adjunctionClosed : ∀ (A B C : E) (f : C ⨯ A ⟶ B), Exp.adjunction A B C f
  uniquenessClosed : ∀ (A B C : E) (g : C ⟶ Exp.exponent A B), Exp.uniqueness A B C g

def ExponentialAdjunctionClosed {E : Type u} [Category E] [CartesianClosed E] (Exp : ExponentialAdjunction E) : Prop :=
  (∀ (A B : E), Exp.exponent A B) ∧ (∀ (A B : E), Exp.evaluation A B) ∧
  (∀ (A B C : E) (f : C ⨯ A ⟶ B), Exp.currying A B C f) ∧
  (∀ (A B C : E) (f : C ⨯ A ⟶ B), Exp.adjunction A B C f) ∧
  (∀ (A B C : E) (g : C ⟶ Exp.exponent A B), Exp.uniqueness A B C g)

theorem exponential_adjunction_closed_from_evidence {E : Type u} [Category E] [CartesianClosed E] (Exp : ExponentialAdjunction E) (E' : ExponentialAdjunctionEvidence Exp) : ExponentialAdjunctionClosed Exp := by
  refine And.intro E'.exponentClosed (And.intro E'.evaluationClosed (And.intro E'.curryingClosed (And.intro E'.adjunctionClosed E'.uniquenessClosed)))

end CategoryTheoryElementaryTopoiCanonicalLaneLean
end HautevilleHouse
