import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryElementaryTopoiCanonicalLaneLean

structure ToposSheafPackage where
  site : Type u
  coverage : Type v
  sheafCondition : Prop
  sheafification : Type w
  sheafConditionClosed : sheafCondition
  sheafificationDefined : sheafification = (Type w)

structure ToposSheafEvidence (T : ToposSheafPackage) where
  sheafConditionClosed : T.sheafCondition

def ToposSheafClosed (T : ToposSheafPackage) : Prop :=
  T.sheafCondition

theorem topos_sheaf_closed_from_evidence (T : ToposSheafPackage) (E : ToposSheafEvidence T) :
    ToposSheafClosed T := by
  exact E.sheafConditionClosed

end CategoryTheoryElementaryTopoiCanonicalLaneLean
end HautevilleHouse