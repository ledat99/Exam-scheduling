using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ExamScheduling
{
    class HocPhan
    {
        private int maHP, color=0, tgThi=1, maP=0;
        private List<int> sv;
        public HocPhan(int ma)
        {
            sv = new List<int>();
            this.maHP = ma;
        }
        public HocPhan()
        { }
        public int MaHP { get => this.maHP; set => this.maHP = value; }
        public int Color { get => color; set => color = value; }
        public List<int> Sv { get => sv; set => sv = value; }
        public void addSV(int a)
        {
            this.sv.Add(a);
        }
        public string show()
        {
            return "Mã HP: " + maHP + " / Màu: " + Color + "\n";
        }
    }
}
