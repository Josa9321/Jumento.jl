function generate_pareto(frontier)
    pareto_set = typeof(frontier[1])[]
    for solution in frontier
        if is_efficient(solution, frontier)
            push!(pareto_set, solution)
        end
    end
    return pareto_set
end

function is_efficient(solution, frontier)
    for sol_k in frontier
        if max_j_dominates_i(solution_i = solution, solution_j = sol_k) && !(solutions_are_equals(solution, sol_k))
            return false
        end
    end
    return true
end

function max_j_dominates_i(;solution_i, solution_j)
    at_least_better_in_one = false
    as_good_in_all = true
    for o in eachindex(solution_i.objectives)
        if solution_j.objectives[o] < solution_i.objectives[o]
            as_good_in_all = false
            break
        elseif solution_j.objectives[o] > solution_i.objectives[o]
            at_least_better_in_one = true
        end
    end
    return as_good_in_all && at_least_better_in_one
end

function solutions_are_equals(solution_1, solution_2)
    tolerable_error = 0.5
    for o in eachindex(solution_1.objectives)
        if abs(solution_1.objectives[o] - solution_2.objectives[o]) > tolerable_error 
            return false
        end
    end
    return true
end