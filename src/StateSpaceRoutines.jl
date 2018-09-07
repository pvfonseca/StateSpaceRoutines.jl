isdefined(Base, :__precompile__) && __precompile__()

module StateSpaceRoutines

    using QuantEcon: solve_discrete_lyapunov
    using Distributions: Distribution, MvNormal, pdf, Weights, sample
    using Roots: fzero
    using HDF5, JLD

    export

        # filters/kalman_filter.jl
        init_stationary_states, kalman_filter,

        # filters/tempered_particle_filter
        tempered_particle_filter, initialize_state_draws,
        resample, solve_inefficiency, mutation, weight_kernel!, next_φ, correction!, selection!,
        mutation!, update_c,

        # filters/bootstrap
        bootstrap_particle_filter, initialize_state_draws,
        resample, solve_inefficiency, mutation, weight_kernel!, correction!, selection!,
        mutation!, update_c,

        # smoothers/
        hamilton_smoother, koopman_smoother, koopman_disturbance_smoother, carter_kohn_smoother, durbin_koopman_smoother

    const VERBOSITY = Dict(:none => 0, :low => 1, :high => 2)

    include("filters/kalman_filter.jl")

    include("filters/tempered_particle_filter/util.jl")
    include("filters/tempered_particle_filter/initialization.jl")
    include("filters/tempered_particle_filter/correction.jl")
    include("filters/tempered_particle_filter/selection.jl")
    include("filters/tempered_particle_filter/mutation.jl")
    include("filters/tempered_particle_filter/tempered_particle_filter.jl")

    include("filters/bootstrap/util.jl")
    include("filters/bootstrap/initialization.jl")
    include("filters/bootstrap/correction.jl")
    include("filters/bootstrap/selection.jl")
    include("filters/bootstrap/mutation.jl")
    include("filters/bootstrap/bootstrap_particle_filter.jl")

    include("smoothers/util.jl")
    include("smoothers/hamilton_smoother.jl")
    include("smoothers/koopman_smoother.jl")
    include("smoothers/carter_kohn_smoother.jl")
    include("smoothers/durbin_koopman_smoother.jl")
end
