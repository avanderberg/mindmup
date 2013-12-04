heroku logs -n 1500 --source heroku --remote production |  gawk 'NR==1 {start_time=$1} //{match ($0, /path=([^[:space:]]*).*connect=([0-9]*).*service=([0-9]*)/, a); connect=a[2]; service=a[3]; path= a[1]; num++; t_c+=connect; if(connect>m_c) {m_c=connect;m_c_r=$0;} t_s+=service; if (service>m_s) {m_s=service;m_s_r=$0;} /*print connect "\t" service "\t" path;*/} END { print "start\t" start_time; print "end\t" $1; print "STAT\tCOUNT\tMAX\tAVG"; print "Connect\t" num "\t" m_c "\t" (t_c/num); print "Service\t" num "\t" m_s "\t" (t_s/num); print "MAX Requests"; print m_s_r; print m_c_r;} '
