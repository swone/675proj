using Distributions, StatsBase, Random, Plots

Random.seed!(1)

dist = Exponential()

x = [rand(dist, 100) for i in 1:15]

v = [Float32[] for i in 1:15]

for i in 1:100
    pl = plot(x -> cdf.(dist, x), -0.1, 10, title = "Empirical Exponential CDF", linewidth = 5, label="Original CDF", xlabel = "x", ylabel = "CDF")
    for j in 1:15
        append!(v[j], x[j][i])
        norm_ecdf = ecdf(v[j])
        plot!(x -> norm_ecdf(x), -0.1, 10, legend=false)
    end
    display(pl)
end
