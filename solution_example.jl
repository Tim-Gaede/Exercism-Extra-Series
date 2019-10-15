function slices(series::String, size::Int)
    if size > length(series)
        msg = "The size of the slice cannot be " *
              "greater than the size of the series."

        throw(DomainError(msg))
    end

    if size < 1
        throw(DomainError("size must be at least 1."))
    end

    res = []
    for start = 1 : length(series) - size + 1
        slice = ""
        for i = 0 : size-1
            j = start + i
            slice *= string(series[j])
        end
        push!(res, slice)
    end


    res # returned
end
