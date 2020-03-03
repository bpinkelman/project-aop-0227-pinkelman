//package pkg2;

public aspect TraceAspect {
   pointcut classToTrace(): within(DataApp) || within(ComponentApp) || within (ServiceApp);
   pointcut methodToTrace():  classToTrace() &&  execution(String getName());

   before(): methodToTrace() {
      String info = thisJoinPointStaticPart.getSignature() + ", " //
            //+ thisJoinPointStaticPart.getSourceLocation().getFileName() + ", " //
            + thisJoinPointStaticPart.getSourceLocation().getLine();
      System.out.println("[BGN] " + info);
   }

   after(): methodToTrace() {
      System.out.println("[END] " + thisJoinPointStaticPart.getSourceLocation().getFileName());
   }
}
