import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoryTheoryElementaryTopoiCanonicalLaneLean.CategoryDefinitions

namespace HautevilleHouse
namespace CategoryTheoryElementaryTopoiCanonicalLaneLean

structure LimitCone {C : Category} (J : Category) where
  apex : C.Obj
  π : (j : J.Obj) → C.Hom apex (J.Obj → C.Obj) -- simplified
  universalProperty : Prop

structure ColimitCocone {C : Category} (J : Category) where
  apex : C.Obj
  ι : (j : J.Obj) → C.Hom (J.Obj → C.Obj) apex -- simplified
  universalProperty : Prop

structure HasFiniteLimits (C : Category) where
  terminalObject : C.Obj
  binaryProducts : (A B : C.Obj) → C.Obj
  equalizers : (f g : C.Hom A B) → C.Obj
  terminalProperty : ∀ X : C.Obj, Unique (C.Hom X terminalObject)
  binaryProductProperty : ∀ (A B : C.Obj), ∃ (P : C.Obj) (π1 : C.Hom P A) (π2 : C.Hom P B), ∀ (X : C.Obj) (f : C.Hom X A) (g : C.Hom X B), ∃! h : C.Hom X P, C.comp h π1 = f ∧ C.comp h π2 = g
  equalizerProperty : ∀ (f g : C.Hom A B), ∃ (E : C.Obj) (e : C.Hom E A), C.comp e f = C.comp e g ∧ ∀ (X : C.Obj) (h : C.Hom X A), C.comp h f = C.comp h g → ∃! k : C.Hom X E, C.comp k e = h

structure HasFiniteColimits (C : Category) where
  initialObject : C.Obj
  binaryCoproducts : (A B : C.Obj) → C.Obj
  coequalizers : (f g : C.Hom A B) → C.Obj
  initialProperty : ∀ X : C.Obj, Unique (C.Hom initialObject X)
  binaryCoproductProperty : ∀ (A B : C.Obj), ∃ (C₀ : C.Obj) (ι1 : C.Hom A C₀) (ι2 : C.Hom B C₀), ∀ (X : C.Obj) (f : C.Hom A X) (g : C.Hom B X), ∃! h : C.Hom C₀ X, C.comp ι1 h = f ∧ C.comp ι2 h = g
  coequalizerProperty : ∀ (f g : C.Hom A B), ∃ (Q : C.Obj) (q : C.Hom B Q), C.comp f q = C.comp g q ∧ ∀ (X : C.Obj) (h : C.Hom B X), C.comp f h = C.comp g h → ∃! k : C.Hom Q X, C.comp q k = h

structure FiniteLimitClosed {C : Category} (L : HasFiniteLimits C) : Prop := where
  terminal : L.terminalProperty
  products : L.binaryProductProperty
  equalizers : L.equalizerProperty

theorem finite_limit_closed_from_evidence {C : Category} (L : HasFiniteLimits C) : FiniteLimitClosed L :=
  { terminal := L.terminalProperty,
    products := L.binaryProductProperty,
    equalizers := L.equalizerProperty }

structure FiniteColimitClosed {C : Category} (L : HasFiniteColimits C) : Prop := where
  initial : L.initialProperty
  coproducts : L.binaryCoproductProperty
  coequalizers : L.coequalizerProperty

theorem finite_colimit_closed_from_evidence {C : Category} (L : HasFiniteColimits C) : FiniteColimitClosed L :=
  { initial := L.initialProperty,
    coproducts := L.binaryCoproductProperty,
    coequalizers := L.coequalizerProperty }

end CategoryTheoryElementaryTopoiCanonicalLaneLean
end HautevilleHouse