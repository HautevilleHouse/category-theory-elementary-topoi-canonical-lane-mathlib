import HautevilleHouse.CategoryTheoryElementaryTopoiCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryElementaryTopoiCanonicalLaneLean

structure FiniteLimitsPackage (T : ElementaryTopos) where
  terminalExists : Prop
  binaryProductsExist : Prop
  equalizersExist : Prop
  finiteLimitsExist : Prop
  terminalExistsClosed : terminalExists
  binaryProductsExistClosed : binaryProductsExist
  equalizersExistClosed : equalizersExist
  finiteLimitsExistClosed : finiteLimitsExist

structure FiniteLimitsEvidence {T : ElementaryTopos} (F : FiniteLimitsPackage T) where
  terminalExistsClosed : F.terminalExistsClosed
  binaryProductsExistClosed : F.binaryProductsExistClosed
  equalizersExistClosed : F.equalizersExistClosed
  finiteLimitsExistClosed : F.finiteLimitsExistClosed

def FiniteLimitsClosed {T : ElementaryTopos} (F : FiniteLimitsPackage T) : Prop :=
  F.terminalExists ∧ F.binaryProductsExist ∧ F.equalizersExist ∧ F.finiteLimitsExist

theorem finite_limits_closed_from_evidence {T : ElementaryTopos} (F : FiniteLimitsPackage T) (E : FiniteLimitsEvidence F) : FiniteLimitsClosed F :=
  And.intro E.terminalExistsClosed (And.intro E.binaryProductsExistClosed (And.intro E.equalizersExistClosed E.finiteLimitsExistClosed))

end CategoryTheoryElementaryTopoiCanonicalLaneLean
end HautevilleHouse