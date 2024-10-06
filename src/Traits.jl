abstract type GalacticModel end
@inline length(p::T) where T <: GalacticModel = 1
@inline iterate(p::T) where T <: GalacticModel = (p,nothing)
@inline iterate(p::T,st) where T <: GalacticModel = nothing

abstract type NFWModel <: GalacticModel end
abstract type SersicModel <: GalacticModel end

abstract type MilkyWay <: GalacticModel end
struct MilkyWayBulge <: MilkyWay end
struct MilkyWayDiscs <: MilkyWay end
struct MilkyWayGases <: MilkyWay end
struct MilkyWayHalo <: MilkyWay end
