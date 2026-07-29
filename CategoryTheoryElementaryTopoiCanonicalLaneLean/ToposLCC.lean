import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryElementaryTopoiCanonicalLaneLean

structure ToposLocalCartesianClosedPackage where
  exponentialsExist : Prop
  evaluationMorphism : Prop
  currying : Prop
  exponentialsExistClosed : exponentialsExist
  evaluationMorphismClosed : evaluationMorphism
  curryingClosed : currying

structure ToposLocalCartesianClosedEvidence (L : ToposLocalCartesianClosedPackage) where
  exponentialsExistClosed : L.exponentialsExist
  evaluationMorphismClosed : L.evaluationMorphism
  curryingClosed : L.currying

def ToposLocalCartesianClosed (L : ToposLocalCartesianClosedPackage) : Prop :=
  L.exponentialsExist ∧ L.evaluationMorphism ∧ L.currying

theorem topos_local_cartesian_closed_from_evidence
    (L : ToposLocalCartesianClosedPackage) (E : ToposLocalCartesianClosedEvidence L) :
    ToposLocalCartesianClosed L := by
  exact And.intro E.exponentialsExistClosed
    (And.intro E.evaluationMorphismClosed E.curryingClosed)

end CategoryTheoryElementaryTopoiCanonicalLaneLean
end HautevilleHouse