import HautevilleHouse.CategoryTheoryElementaryTopoiCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryElementaryTopoiCanonicalLaneLean

structure LimitsPackage (T : ElementaryTopos) where
  limit : (J : Type u) → (F : J → T.carrier) → T.carrier
  limitUniversal : Prop
  colimit : (J : Type u) → (F : J → T.carrier) → T.carrier
  colimitUniversal : Prop
  limitExists : limitUniversal
  colimitExists : colimitUniversal

structure LimitsEvidence {T : ElementaryTopos} (L : LimitsPackage T) where
  limitClosed : L.limitExists
  colimitClosed : L.colimitExists

def LimitsClosed {T : ElementaryTopos} (L : LimitsPackage T) : Prop :=
  L.limitExists ∧ L.colimitExists

theorem limits_closed_from_evidence {T : ElementaryTopos} (L : LimitsPackage T) (E : LimitsEvidence L) : LimitsClosed L :=
  And.intro E.limitClosed E.colimitClosed

end CategoryTheoryElementaryTopoiCanonicalLaneLean
end HautevilleHouse