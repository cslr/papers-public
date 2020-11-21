<TeXmacs|1.99.13>

<style|<tuple|generic|british>>

<\body>
  <\strong>
    Use of D-Wave's Quatum Computer for Global Optimization
  </strong>

  <with|font-shape|italic|Tomas Ukkonen, Novel Insight, 2020>

  \;

  D-Wave Hybrid Quantum Optimizer can solve problems using one million
  variables (9/2020). Their quantum computer can optimize Ising model
  (quadratic optimization) and do simulated annealing. The one million
  variables <math|N=10<rsup|6>> mean that using normal linear optimization
  the memory use would scale as <math|O<around*|(|N<rsup|2>|)>>. This means
  that the computer must have 4096 gigabytes of memory which is outside of
  the scope of normal computers (supercomputers, however, could be used to
  solve for larger models).

  The Ising model originally for simple magnetic materials is:

  <\padded-center>
    <math|H<around*|(|\<b-sigma\>|)>=-<big|sum>J<rsub|i*j>*\<sigma\><rsub|i>**\<sigma\><rsub|j>-\<mu\>*<big|sum>h<rsub|j>*\<sigma\><rsub|j>>,
    <math|P<rsub|\<beta\>><around*|(|\<b-sigma\>|)>=<frac|e<rsup|-\<beta\>*H<around*|(|\<b-sigma\>|)>>|<big|sum><rsub|\<b-sigma\>>e<rsup|-\<beta\>*H<around*|(|\<b-sigma\>|)>>>>
  </padded-center>

  The optimization of <math|H<around*|(|\<b-sigma\>|)>> can be mapped to
  simple optimization problem which maximizes, for example, expected value
  <math|E<around*|[|Y|]>> given variables <math|\<b-sigma\>>. We can choose
  <math|J<rsub|i*j>=-<frac|1|4>E<around*|[|Y<around*|\||\<sigma\><rsub|i>,\<sigma\><rsub|j>|\<nobracket\>>|]>>,
  <math|\<mu\>=0> and map <math|\<sigma\><rsub|i>> <math|-1/+1> variables to
  be binary indicator <math|0/1> variables.
  <math|\<sigma\><rprime|'><rsub|i>=<around*|(|\<sigma\><rsub|i>+1|)>/2>,
  <math|\<sigma\><rsub|i>=2*\<sigma\><rsub|i><rprime|'>-1>. It is then
  possible to write by simplifying that <math|E<around*|[|Y<around*|\||\<b-sigma\>|\<nobracket\>>|]>>
  depends on only two <math|\<b-sigma\>> variables at the time and that they
  are independent (it is possible generalize model to more variable
  combinations by introducting meta variables
  <math|\<sigma\><rsub|k>=<around*|(|\<sigma\><rsub|i>*\<sigma\><rsub|j>|)><rsub|k>>):

  <\padded-center>
    <math|E<around*|[|Y|]>=<big|sum><rsub|\<b-sigma\>>E<around*|[|Y<around*|\||\<sigma\><rprime|'><rsub|i>*\<sigma\><rprime|'><rsub|j>|\<nobracket\>>|]>*P<around*|(|\<sigma\><rprime|'><rsub|i>|)>*P<around*|(|\<sigma\><rprime|'><rsub|j>|)>>
  </padded-center>

  This problem is further simplified so that
  <math|\<sigma\><rprime|'><rsub|i>> are indicator variables telling
  probability if some decision is made or not
  (<math|P<around*|(|\<sigma\><rsub|i>=p|)>=p>). For high dimensional data
  the most of the probability mass in a hypercube
  <math|<around*|[|0,1|]><rsup|D>> are near edges meaning that one can make
  rough approximation and only use values <math|p=0> and <math|p=1>. This
  means that <math|P<around*|(|\<sigma\><rsub|i>=0|)>=0> and
  <math|P<around*|(|\<sigma\><rsub|i>=1|)>=1> and we have\ 

  <\padded-center>
    <math|E<around*|[|Y|]>=<big|sum>E<around*|[|Y<around*|\||\<sigma\><rprime|'><rsub|i>*\<sigma\><rprime|'><rsub|j>|\<nobracket\>>|]>*\<sigma\><rprime|'><rsub|i>*\<sigma\><rprime|'><rsub|j>>
  </padded-center>

  <\padded-center>
    <math|E<around*|[|Y|]>=-<frac||><big|sum>J<rsub|i*j>**<around*|(|\<sigma\><rsub|i>+1|)><around*|(|\<sigma\><rsub|j>+1|)>>

    <math|E<around*|[|Y|]>=-<frac||><big|sum>J<rsub|i*j>*\<sigma\><rsub|i>*\<sigma\><rsub|j>*-<big|sum><around*|(|<big|sum><rsub|j>J<rsub|k*j>+<big|sum><rsub|i>J<rsub|i*k>|)><rsub|k>*\<sigma\><rsub|k>-<big|sum><rsub|i,j>J<rsub|i*j>>

    <math|E<around*|[|Y|]>=E<around*|{|H<around*|(|\<b-sigma\>|)>|}>>

    <math|E<around*|[|Y<around*|\||\<b-sigma\>|\<nobracket\>>|]>=H<around*|(|\<b-sigma\>|)>>
  </padded-center>

  We have Ising model in which <math|\<mu\>=1> and
  <math|h<rsub|k>=<big|sum><rsub|j>J<rsub|k*j>+<big|sum><rsub|i>J<rsub|i*k>>
  and an additional constant term can be ignored when optimizing or sampling
  from the Ising model.

  In practice, the large scale Ising model allows us to optimize for larger
  number of parameters than using normal computers. It is then possible to
  try to do global optimization of problems such as how municipalities
  operate (<math|\<b-sigma\>> is joint all actions taken by different
  municipalities each making <math|M> same decisions) or
  <with|font-shape|italic|approximately> optimize for total GDP when
  <math|\<b-sigma\>> variables are all decisions made by different countries
  (each country makes <math|M> same deicisions). It is then possible to run
  the optimization also separately for each municipality or country and
  compare results which can be used to look for possible co-operations which
  can be shown to maybe finally improve each participant's interest by
  optimization operations as a whole.

  When using D-Wave quantum computers we can look for optimimum from
  <math|N=2<rsup|10<rsup|6>>=10<rsup|301029>> possible binary combinations
  which cannot be easily done using normal computers. Also instead of
  expetected value it is possible to optimize for uncertainly based the worst
  case problems like <math|J<rsub|i*j>\<sim\>max<around*|(|0,E<around*|[|Y|]>-\<alpha\>*StDev<around*|[|Y|]>|)>>
  which are maybe more realistic. (<with|font-shape|italic|FIXME: Is it
  possible to have freely connected Ising model or does one have to reduce
  number of connections to fit to reduced 2d lattice?>)

  \;

  <strong|Application to Municipalities Data (TODO)>

  Because the quantum computer can solve for one million variables and
  because there are 310 municipalities in Finland it is possible to have 3225
  variables per municipality. However, these are binary variables and in
  practice continuous variables must be discretized to binary variables using
  one-hot encoding by using <math|10> binary variables meaning there are
  <math|322> variables available per municipality.

  Basically this is quite simple but requires lots of preprocessing by doing
  ETL, preprocessing the variables and scaling variables to have reasonable
  range.

  \;

  <with|font-series|bold|Application to Country-Wise GDP Data (TODO)>

  There are 195 countries in the World. This means there can be 512
  continuous variables per country. The optimization target is to maximize
  total GDP and compare results if each country maximizes GDP independently
  (by maximizing only own good).

  \;

  Basically this is quite simple but requires lots of preprocessing by doing
  ETL, preprocessing the variables and scaling variables to have reasonable
  range.

  \;

  \;
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>