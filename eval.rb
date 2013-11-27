#!/usr/bin/env ruby

n, seq, gc_content = File.readlines(ARGV.first)
gc_content = gc_content.split(" ").map(&:to_f)
n = n.to_i
seq = seq.chomp

gc_content.each do |gc_probability|
    probability = 1
    at_probability = (1-gc_probability)/2
    gc_probability /= 2
    seq.each_char do |a|
        if a == "A" or a == "T"
            probability *= at_probability
        else
            probability *= gc_probability
        end
    end
    print "#{((n-seq.length+1) * probability).round(3)} "
end
