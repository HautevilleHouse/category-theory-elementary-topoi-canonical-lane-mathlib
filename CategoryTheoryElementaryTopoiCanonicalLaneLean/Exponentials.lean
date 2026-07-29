import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryElementaryTopoiCanonicalLaneLean

structure ExponentialPackage where
  category : Type u
  objectA : Type v
  objectB : Type w
  exponential : Type x
  evaluationMorphism : Prop
  universalProperty : Prop
  currying : Prop

structure ExponentialEvidence (E : ExponentialPackage) where
  exponentialClosed : E.exponential
  evaluationMorphismClosed : E.evaluationMorphism
  universalPropertyClosed : E.universalProperty
  curryingClosed : E.currying

def ExponentialClosed (E : ExponentialPackage) : Prop :=
  E.exponential ∧ E.evaluationMorphism ∧ E.universalProperty ∧ E.currying

theorem exponential_closed_from_evidence (E : ExponentialPackage) (Ev : ExponentialEvidence E) :
    ExponentialClosed E := by
  exact And.intro Ev.exponentialClosed
    (And.intro Ev.evaluationMorphismClosed
      (And.intro Ev.universalPropertyClosed Ev.curryingClosed))

end CategoryTheoryElementaryTopoiCanonicalLaneLean
end HautevilleHouse