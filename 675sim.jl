using Distributions, StatsBase, Random, Plots

Random.seed!(1)

dist = Uniform()

function ecdf_samp(dist,itr,samp)
    v = [Float32[] for i in 1:samp]
    x = [rand(dist, itr) for i in 1:samp]
    pl = plot(x -> cdf.(dist, x), -0.1, 10, title = "Empirical Exponential CDF", linewidth = 5, label="Original CDF", xlabel = "x", ylabel = "CDF", xrange = [-0.1,1.1])
    for i in 1:itr
        for j in 1:samp
            append!(v[j], x[j][i])
        end
        norm_ecdf = ecdf(v[samp])
        plot!(x -> norm_ecdf(x), -0.1, 10, legend=false)
    end
    display(pl)
end




## Output animation
samp = 50
itr = 150

x = [rand(dist, itr) for i in 1:samp]
v = [Float32[] for i in 1:samp]

for i in 1:itr
    pl = plot(x -> cdf.(dist, x), -0.1, 10, title = "Empirical Exponential CDF", linewidth = 5, label="Original CDF", xlabel = "x", ylabel = "CDF", xrange = [-0.1,1.1])
    for j in 1:samp
        append!(v[j], x[j][i])
        norm_ecdf = ecdf(v[j])
        plot!(x -> norm_ecdf(x), -0.1, 10, legend=false)
    end
    display(pl)
end
