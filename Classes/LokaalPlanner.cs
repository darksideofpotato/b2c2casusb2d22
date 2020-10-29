using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace b2c2casusb2d22.Classes
{
    public class LokaalPlanner
    {
        private int lokaalPlannerId;
        private int lokaalId;
        private string datum;
        private string tijdstip;
        private int studentId;

        public LokaalPlanner(int _lokaalPlannerId, int _lokaalId, string _datum, 
            string _tijdstip, int _studentId)
        {
            this.lokaalPlannerId = _lokaalPlannerId;
            this.lokaalId = _lokaalId;
            this.datum = _datum;
            this.tijdstip = _tijdstip;
            this.studentId = _studentId;
        }

        public int getLokaal()
        {
            return lokaalId;
        }
        public string getDate()
        {
            return datum;
        }
        public string getTijdstip()
        {
            return tijdstip;
        }
        public int getStudent()
        {
            return studentId;
        }
    }
}