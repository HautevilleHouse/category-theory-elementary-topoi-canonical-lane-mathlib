import HautevilleHouse.CategoryTheoryElementaryTopoiCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryElementaryTopoiCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  A.bridgeClosed

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A :=
  A.bridgeClosed

end CategoryTheoryElementaryTopoiCanonicalLaneLean
end HautevilleHouse