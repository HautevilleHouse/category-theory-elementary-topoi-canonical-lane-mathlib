import HautevilleHouse.CategoryTheoryElementaryTopoiCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryElementaryTopoiCanonicalLaneLean

structure Category (Obj : Type u) (Hom : Obj → Obj → Type v) where
  id (X : Obj) : Hom X X
  comp {X Y Z : Obj} (f : Hom X Y) (g : Hom Y Z) : Hom X Z
  id_left {X Y : Obj} (f : Hom X Y) : comp (id X) f = f
  id_right {X Y : Obj} (f : Hom X Y) : comp f (id Y) = f
  assoc {X Y Z W : Obj} (f : Hom X Y) (g : Hom Y Z) (h : Hom Z W) : comp (comp f g) h = comp f (comp g h)

structure ElementaryTopos (C : Type u) [Category C] where
  terminal : C
  pullbacks : ∀ {X Y Z : C} (f : X → Z) (g : Y → Z), C
  classifier : C → C  -- subobject classifier
  true : ∀ X, X → classifier X
  power : C → C  -- power object functor
  finiteLimitsClosed : Prop
  powerObjectsExist : Prop
  subobjectClassifierExists : Prop

end CategoryTheoryElementaryTopoiCanonicalLaneLean
end HautevilleHouse