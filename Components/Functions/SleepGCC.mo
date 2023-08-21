within ScalableTranslationStatistics.Components.Functions;
function SleepGCC
  input Real waitingTime "waiting time in mikroseconds";
  external "C" msleep(waitingTime) annotation(Include="#include <sleep_gcc.c>", IncludeDirectory=
        "modelica://ScalableTranslationStatistics/Resources");

  annotation (Documentation(info="<html>
<p>sleeping function defined for gcc compiler</p>
</html>"));
end SleepGCC;
