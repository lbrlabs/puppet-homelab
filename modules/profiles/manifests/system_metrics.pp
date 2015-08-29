# Collect system metrics using diamond
class profiles::system_metrics {

  diamond::collector { 'CPUCollector': }

  diamond::collector { 'MemoryCollector': }

}
