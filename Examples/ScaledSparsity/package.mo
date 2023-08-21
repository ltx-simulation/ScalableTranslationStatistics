within ScalableTranslationStatistics.Examples;
package ScaledSparsity "Collection of models with scaled sparsity"



  annotation (Documentation(info="<html>
<p>Collection of models with scaled sparsity (percentage of nonzero entries in ODE matrix)</p>
<p>The sparsity is mainly defined by number of equation systems (number of springs) in the system. <br>
If only one spring per mass is defined, only neighboored masses are connected. Thus, only matrix entries close to the diagonal are not zero.<br>
The more springs are defined, the more equations are connecting distant masses and matrix entries far away from the diagonal are nonzero. 
</html>"));
end ScaledSparsity;
