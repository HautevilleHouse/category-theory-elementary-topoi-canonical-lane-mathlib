import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryElementaryTopoiCanonicalLaneLean

structure Category where
  Obj : Type u
  Hom : Obj → Obj → Type v
  id : (X : Obj) → Hom X X
  comp : {X Y Z : Obj} → Hom X Y → Hom Y Z → Hom X Z
  id_left : ∀ {X Y : Obj} (f : Hom X Y), comp (id X) f = f
  id_right : ∀ {X Y : Obj} (f : Hom X Y), comp f (id Y) = f
  assoc : ∀ {X Y Z W : Obj} (f : Hom X Y) (g : Hom Y Z) (h : Hom Z W), comp (comp f g) h = comp f (comp g h)

structure Functor (C D : Category) where
  onObjects : C.Obj → D.Obj
  onMorphisms : {X Y : C.Obj} → C.Hom X Y → D.Hom (onObjects X) (onObjects Y)
  identityPreservation : ∀ (X : C.Obj), onMorphisms (C.id X) = D.id (onObjects X)
  compositionPreservation : ∀ {X Y Z : C.Obj} (f : C.Hom X Y) (g : C.Hom Y Z), onMorphisms (C.comp f g) = D.comp (onMorphisms f) (onMorphisms g)

structure NaturalTransformation {C D : Category} (F G : Functor C D) where
  components : ∀ (X : C.Obj), D.Hom (F.onObjects X) (G.onObjects X)
  naturality : ∀ {X Y : C.Obj} (f : C.Hom X Y), D.comp (components X) (G.onMorphisms f) = D.comp (F.onMorphisms f) (components Y)

end CategoryTheoryElementaryTopoiCanonicalLaneLean
end HautevilleHouse