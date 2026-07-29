import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryElementaryTopoiCanonicalLaneLean

structure PowerObjectPackage where
  topos : Type u
  powerObjectFunctor : Type v
  evaluationMorphism : Type w
  universalProperty : Prop
  powerObjectFunctorDefined : powerObjectFunctor = (Type v)
  universalPropertyClosed : universalProperty

structure PowerObjectEvidence (P : PowerObjectPackage) where
  universalPropertyClosed : P.universalProperty

def PowerObjectClosed (P : PowerObjectPackage) : Prop :=
  P.universalProperty

theorem power_object_closed_from_evidence (P : PowerObjectPackage) (E : PowerObjectEvidence P) :
    PowerObjectClosed P := by
  exact E.universalPropertyClosed

end CategoryTheoryElementaryTopoiCanonicalLaneLean
end HautevilleHouse