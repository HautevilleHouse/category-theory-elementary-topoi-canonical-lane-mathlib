import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryElementaryTopoiCanonicalLaneLean

structure AdjointFunctorTheoremPackage where
  leftAdjoint : Prop
  rightAdjoint : Prop
  freydAdjointFunctorTheorem : Prop
  specialAdjointFunctorTheorem : Prop
  leftAdjointClosed : leftAdjoint
  rightAdjointClosed : rightAdjoint
  freydAdjointFunctorTheoremClosed : freydAdjointFunctorTheorem
  specialAdjointFunctorTheoremClosed : specialAdjointFunctorTheorem

structure AdjointFunctorTheoremEvidence (A : AdjointFunctorTheoremPackage) where
  leftAdjointClosed : A.leftAdjoint
  rightAdjointClosed : A.rightAdjoint
  freydAdjointFunctorTheoremClosed : A.freydAdjointFunctorTheorem
  specialAdjointFunctorTheoremClosed : A.specialAdjointFunctorTheorem

def AdjointFunctorTheoremClosed (A : AdjointFunctorTheoremPackage) : Prop :=
  A.leftAdjoint ∧ A.rightAdjoint ∧ A.freydAdjointFunctorTheorem ∧ A.specialAdjointFunctorTheorem

theorem adjoint_functor_theorem_closed_from_evidence
    (A : AdjointFunctorTheoremPackage) (E : AdjointFunctorTheoremEvidence A) :
    AdjointFunctorTheoremClosed A := by
  exact And.intro E.leftAdjointClosed
    (And.intro E.rightAdjointClosed
      (And.intro E.freydAdjointFunctorTheoremClosed E.specialAdjointFunctorTheoremClosed))

end CategoryTheoryElementaryTopoiCanonicalLaneLean
end HautevilleHouse