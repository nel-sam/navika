# Room instantiates WorkManager's generated database reflectively.
-keep class androidx.work.impl.WorkDatabase_Impl {
    public <init>();
}
