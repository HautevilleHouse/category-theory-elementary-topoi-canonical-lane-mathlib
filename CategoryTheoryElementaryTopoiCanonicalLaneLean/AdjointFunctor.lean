import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryElementaryTopoiCanonicalLaneLean

structure AdjointFunctorPackage where
  categories : Type u
  leftAdjoint : Type v
  rightAdjoint : Type w
  adjunctionUnit : Type x
  adjunctionCounit : Type y
  triangleIdentities : Prop
  adjunctionDefined : Prop
  triangleIdentitiesClosed : triangleIdentities
  adjunctionDefinedClosed : adjunctionDefined

structure AdjointFunctorEvidence (A : AdjointFunctorPackage) where
  triangleIdentitiesClosed : A.triangleIdentities
  adjunctionDefinedClosed : A.adjunctionDefined

def AdjointFunctorClosed (A : AdjointFunctorPackage) : Prop :=
  A.triangleIdentities ∧ A.adjunctionDefined

theorem adjoint_functor_closed_from_evidence (A : AdjointFunctorPackage) (E : AdjointFunctorEvidence A) :
    AdjointFunctorClosed A := by
  exact And.intro E.triangleIdentitiesClosed E.adjunctionDefinedClosed

end CategoryTheoryElementaryTopoiCanonicalLaneLean
end HautevilleHouse