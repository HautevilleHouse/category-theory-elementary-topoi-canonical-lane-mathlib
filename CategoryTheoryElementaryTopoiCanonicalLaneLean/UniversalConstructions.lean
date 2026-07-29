import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryElementaryTopoiCanonicalLaneLean

structure UniversalConstructionPackage where
  product : Prop
  equalizer : Prop
  pullback : Prop
  exponential : Prop
  subobjectClassifier : Prop
  productClosed : product
  equalizerClosed : equalizer
  pullbackClosed : pullback
  exponentialClosed : exponential
  subobjectClassifierClosed : subobjectClassifier

structure UniversalConstructionEvidence (U : UniversalConstructionPackage) where
  productClosed : U.product
  equalizerClosed : U.equalizer
  pullbackClosed : U.pullback
  exponentialClosed : U.exponential
  subobjectClassifierClosed : U.subobjectClassifier

def UniversalConstructionClosed (U : UniversalConstructionPackage) : Prop :=
  U.product ∧ U.equalizer ∧ U.pullback ∧ U.exponential ∧ U.subobjectClassifier

theorem universal_construction_closed_from_evidence
    (U : UniversalConstructionPackage) (E : UniversalConstructionEvidence U) :
    UniversalConstructionClosed U := by
  exact And.intro E.productClosed
    (And.intro E.equalizerClosed
      (And.intro E.pullbackClosed
        (And.intro E.exponentialClosed E.subobjectClassifierClosed)))

end CategoryTheoryElementaryTopoiCanonicalLaneLean
end HautevilleHouse