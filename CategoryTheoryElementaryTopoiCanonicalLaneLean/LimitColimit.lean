import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryElementaryTopoiCanonicalLaneLean

structure LimitColimitPackage where
  diagram : Type u
  limit : Type v
  colimit : Type w
  universalProperty : Prop
  limitExistence : Prop
  colimitExistence : Prop
  limitExistenceClosed : limitExistence
  colimitExistenceClosed : colimitExistence
  universalPropertyClosed : universalProperty

structure LimitColimitEvidence (L : LimitColimitPackage) where
  limitExistenceClosed : L.limitExistence
  colimitExistenceClosed : L.colimitExistence
  universalPropertyClosed : L.universalProperty

def LimitColimitClosed (L : LimitColimitPackage) : Prop :=
  L.limitExistence ∧ L.colimitExistence ∧ L.universalProperty

theorem limit_colimit_closed_from_evidence (L : LimitColimitPackage) (E : LimitColimitEvidence L) :
    LimitColimitClosed L := by
  exact And.intro E.limitExistenceClosed
    (And.intro E.colimitExistenceClosed E.universalPropertyClosed)

end CategoryTheoryElementaryTopoiCanonicalLaneLean
end HautevilleHouse