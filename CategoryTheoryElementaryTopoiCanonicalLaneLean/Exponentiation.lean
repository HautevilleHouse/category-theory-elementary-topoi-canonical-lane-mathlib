import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryElementaryTopoiCanonicalLaneLean

structure Exponentiation (C : ToposCategory) where
  exp : C.Obj → C.Obj → C.Obj
  eval : (X Y : C.Obj) → C.Hom (C.Obj) (C.Obj) ???
  curry : {X Y Z : C.Obj} (f : C.Hom (X × Y) Z) → C.Hom X (exp Y Z)
  uncurry : {X Y Z : C.Obj} (f : C.Hom X (exp Y Z)) → C.Hom (X × Y) Z
  curryUncurry : ∀ {X Y Z : C.Obj} (f : C.Hom (X × Y) Z), uncurry (curry f) = f
  uncurryCurry : ∀ {X Y Z : C.Obj} (f : C.Hom X (exp Y Z)), curry (uncurry f) = f

structure ExponentiationEvidence (C : ToposCategory) (E : Exponentiation C) where
  ...

def ExponentiationClosed (C : ToposCategory) (E : Exponentiation C) : Prop := ...

theorem exponentiation_closed_from_evidence ...

end CategoryTheoryElementaryTopoiCanonicalLaneLean
end HautevilleHouse
