import CategoryTheoryElementaryTopoiCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryElementaryTopoiCanonicalLaneLean

structure ToposPackage where
  finiteLimits : Prop
  powerObjects : Prop
  functor : Type u
  naturalTransformation : Type v
  epiMonoFactorization : Prop
  exponentiation : Prop

structure ToposEvidence (T : ToposPackage) where
  finiteLimitsClosed : T.finiteLimits
  powerObjectsClosed : T.powerObjects
  epiMonoFactorizationClosed : T.epiMonoFactorization
  exponentiationClosed : T.exponentiation

def ToposClosed (T : ToposPackage) : Prop :=
  T.finiteLimits ∧ T.powerObjects ∧ T.epiMonoFactorization ∧ T.exponentiation

theorem topos_closed_from_evidence (T : ToposPackage) (E : ToposEvidence T) : ToposClosed T :=
  And.intro E.finiteLimitsClosed (And.intro E.powerObjectsClosed (And.intro E.epiMonoFactorizationClosed E.exponentiationClosed))

end CategoryTheoryElementaryTopoiCanonicalLaneLean
end HautevilleHouse