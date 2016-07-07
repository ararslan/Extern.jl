__precompile__()

module Extern

    export @extern

    macro extern(pkg, ex)
        local installed::Bool

        installed = try
            Pkg.installed("$pkg") !== nothing
        catch
            false
        end

        if installed && isdefined(Main, pkg)
            return esc(ex)
        end

        nothing
    end

end
