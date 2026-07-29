import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryElementaryTopoiCanonicalLaneLean

structure ToposCategory where
  Obj : Type u
  Hom : Obj → Obj → Type v
  identity : (X : Obj) → Hom X X
  compose : {X Y Z : Obj} → Hom X Y → Hom Y Z → Hom X Z
  associativity : ∀ {W X Y Z : Obj} (f : Hom W X) (g : Hom X Y) (h : Hom Y Z), compose (compose f g) h = compose f (compose g h)
  identityLeft : ∀ {X Y : Obj} (f : Hom X Y), compose (identity X) f = f
  identityRight : ∀ {X Y : Obj} (f : Hom X Y), compose f (identity Y) = f

structure ToposStructure (C : ToposCategory) where
  terminalObject : C.Obj
  terminalMorphism : (X : C.Obj) → C.Hom X terminalObject
  terminalUnique : ∀ (X : C.Obj) (f g : C.Hom X terminalObject), f = g
  pullbackExists : ∀ {X Y Z : C.Obj} (f : C.Hom X Z) (g : C.Hom Y Z), ∃ (P : C.Obj) (π1 : C.Hom P X) (π2 : C.Hom P Y), 
    C.compose π1 f = C.compose π2 g ∧ ∀ (Q : C.Obj) (q1 : C.Hom Q X) (q2 : C.Hom Q Y), C.compose q1 f = C.compose q2 g → ∃! (u : C.Hom Q P), C.compose u π1 = q1 ∧ C.compose u π2 = q2
  exponentialExists : ∀ (X Y : C.Obj), ∃ (Y^X : C.Obj) (eval : C.Hom (C.Obj) (C.Obj)?) → need proper definition

end CategoryTheoryElementaryTopoiCanonicalLaneLean
end HautevilleHouse
