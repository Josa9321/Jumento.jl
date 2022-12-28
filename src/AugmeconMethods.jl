module AugmeconMethods

using JuMP, XLSX, CPLEX

import Combinatorics: permutations

include("structs.jl")
include("solution.jl")
include("initialize.jl")
include("dominance_relations.jl")
include("augmecon.jl")

include("knapsack//load.jl")

export solve_by_augmecon, VariablesJuMP, SolutionJuMP, AugmeconJuMP

end

#===================
= When using, if I want to save the solution, I need to declare:
 * Variable <: VariablesJuMP
 * init_augmecon_variables(instance)
 * register_variables!(solution, augmecon_model, instance)
=#