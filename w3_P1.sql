Working with text

Here are different ways of generating text in sql 

repeat () this funciton is used to generate horizontal 
text (ie. it concatenates the string put into it).

select repeat('NEON', 5); => NEON NEON NEON NEON NEON

random() is used to get a random number between 0 and 1.
 
select random(); => 0.567754.

truck() - the random funciton is combined with trunk to get
any whole number.

 select truck(random() * 100000); => this would give us whole numbers

generate_series(1, 5) is used to generate numbers vertically.
it is akin to the python range function. it is very powerful,
because it can be combined/concatenated with other sentences to 
produce a large number of sentences.

select generate_series(1, 5) => 1
                                2
                                3
                                4
                                5


"||" this is used for concatenation.

I.e select "here i am "|| truck(random)