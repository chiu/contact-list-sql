# randomnamegenerator


# for i in 1..100
# random_name =(0...8).map { (65 + rand(26)).chr }.join
# puts random_name

# end

def generate_random_names

for i in 1..100
puts (0...10).map { ('a'..'z').to_a[rand(26)] }.join

end