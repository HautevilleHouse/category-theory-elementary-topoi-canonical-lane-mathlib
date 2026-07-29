import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryElementaryTopoiCanonicalLaneLean

structure SubobjectClassifier (E : Type u) [Category E] [Topos E] where
  trueMorphism : ⊤_ E ⟶ Ω E
  characteristicMorphism : ∀ (A : E) (m : Subobject A), A ⟶ Ω E
  pullbackSquare : ∀ (A : E) (m : Subobject A), IsPullback (m.arrow) (characteristicMorphism A m) (trueMorphism) (terminal.from A)
  uniqueness : ∀ (A : E) (f : A ⟶ Ω E), ∃! (m : Subobject A), characteristicMorphism A m = f

structure SubobjectClassifierEvidence {E : Type u} [Category E] [Topos E] (S : SubobjectClassifier E) where
  trueMorphismClosed : S.trueMorphism
  characteristicMorphismClosed : ∀ (A : E) (m : Subobject A), S.characteristicMorphism A m
  pullbackSquareClosed : ∀ (A : E) (m : Subobject A), S.pullbackSquare A m
  uniquenessClosed : ∀ (A : E) (f : A ⟶ Ω E), S.uniqueness A f

def SubobjectClassifierClosed {E : Type u} [Category E] [Topos E] (S : SubobjectClassifier E) : Prop :=
  S.trueMorphism ∧ (∀ (A : E) (m : Subobject A), S.characteristicMorphism A m) ∧
  (∀ (A : E) (m : Subobject A), S.pullbackSquare A m) ∧
  (∀ (A : E) (f : A ⟶ Ω E), S.uniqueness A f)

theorem subobject_classifier_closed_from_evidence {E : Type u} [Category E] [Topos E] (S : SubobjectClassifier E) (E' : SubobjectClassifierEvidence S) : SubobjectClassifierClosed S := by
  refine And.intro E'.trueMorphismClosed ?_
  refine And.intro E'.characteristicMorphismClosed ?_
  refine And.intro E'.pullbackSquareClosed E'.uniquenessClosed

end CategoryTheoryElementaryTopoiCanonicalLaneLean
end HautevilleHouse
