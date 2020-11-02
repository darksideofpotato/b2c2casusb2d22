using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace b2c2casusb2d22.Classes
{
    public class Student
    {
        private int studentId;
        private string studentNaam;
        private string studentNummer;
        private int klas;


        public Student(int _studentId, string _studentNaam, string _studentNummer, int _klas)
        {
            this.studentId = _studentId;
            this.studentNaam = _studentNaam;
            this.studentNummer = _studentNummer;
            this.klas = _klas;

        }
        public int getId()
        {
            return studentId;
        }
        public string getStudentNaam()
        {
            return studentNaam;
        }

        public string getStudentNummer()
        {
            return studentNummer;
        }
        public int getKlas()
        {
            return klas;
        }
    }
}



//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Web;

//namespace b2c2casusb2d22.Classes
//{
//    public class Student
//    {
//        private int studentId;
//        private string studentNaam;
//        private string studentNummer;
//        private string klasNaam;
//        private List<string> vakNaam;
//        private List<string> expertiseNaam;
//        private List<string> expertiseNiveau;
//        private List<string> interesseNaam;
//        private List<string> socialNaam;
//        private List<string> socialLink;


//        public Student(int _studentId, string _studentNaam, string _studentNummer, string _klasNaam, List<string> _vakNaam, List<string> _expertiseNaam, List<string> _expertiseNiveau,
//            List<string> _interesseNaam, List<string> _socialNaam, List<string> _socialLink)
//        {
//            this.studentId = _studentId;
//            this.studentNaam = _studentNaam;
//            this.studentNummer = _studentNummer;
//            this.klasNaam = _klasNaam;
//            this.vakNaam = _vakNaam;
//            this.expertiseNaam = _expertiseNaam;
//            this.expertiseNiveau = _expertiseNiveau;
//            this.interesseNaam = _interesseNaam;
//            this.socialNaam = _socialNaam;
//            this.socialLink = _socialLink;
//        }
//        public int getId()
//        {
//            return studentId;
//        }
//        public string getStudentNaam()
//        {
//            return studentNaam;
//        }

//        public string getStudentNummer()
//        {
//            return studentNummer;
//        }
//        public string getKlas()
//        {
//            return klasNaam;
//        }
//    }
//}