"""
$(TYPEDSIGNATURES)

Ref: Zhu et al 2023, MNRAS 519, 4479-4498

Returns profiles `(ρ_bulge(R,z), ρ_discs(R,z), ρ_gas(R,z), ρ_halo(r))`
"""
function milkyway_zhu2023how()
    model_bulge = Bulge(0.5, 9.5e10u"Msun/kpc^3", 0.075u"kpc", 1.8, 2.1u"kpc")
    model_disc_thin = ExponentialDisk(1003.12u"Msun/pc^2", 2.42u"kpc", 0.3u"kpc")
    model_disc_thick = ExponentialDisk(167.93u"Msun/pc^2", 3.17u"kpc", 0.9u"kpc")
    model_gas_HI  = ExponentialDiskWithHole(  53.1u"Msun/pc^2", 7.0u"kpc", 0.085u"kpc",  4.0u"kpc")
    model_gas_HII = ExponentialDiskWithHole(2179.5u"Msun/pc^2", 1.5u"kpc", 0.045u"kpc", 12.0u"kpc")
    model_halo = Zhao(1.55e7u"Msun/kpc^3", 11.75u"kpc", 1.19, 2.95, 0.95)

    ρ_bulge = (R,z)->density(model_bulge, R, z)
    ρ_discs = _disc(R,z)->0.15 * density(model_disc_thin, R, z) + 0.85 * density(model_disc_thick, R, z)
    ρ_gas = (R,z)->density(model_gas_HI, R, z) + density(model_gas_HII, R, z)
    ρ_halo = (r)->density(model_halo, r)
    
    return ρ_bulge, ρ_discs, ρ_gas, ρ_halo
end
