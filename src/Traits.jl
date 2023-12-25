abstract type GalacticModel end
struct PointMass <: GalacticModel end
struct Plummer <: GalacticModel end
struct Isochrone <: GalacticModel end
struct Zhao <: GalacticModel end
struct Jaffe <: GalacticModel end
struct Hernquist <: GalacticModel end
struct NFW <: GalacticModel end

struct TwoPower <: GalacticModel end
struct Kuzmin <: GalacticModel end
struct MigamotoNagai <: GalacticModel end
struct Logarithmic <: GalacticModel end
struct MestelDisk <: GalacticModel end
struct ExponentialDisk <: GalacticModel end
struct ThickDisk <: GalacticModel end

abstract type MilkyWay <: GalacticModel end
struct MilkyWayBulge <: MilkyWay end
struct MilkyWayDiscs <: MilkyWay end
struct MilkyWayGases <: MilkyWay end
struct MilkyWayHalo <: MilkyWay end
