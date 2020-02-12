using System;

namespace sample1 {
    class Program {
        static void Main (string[] args) {
            // x = 5 + 1i
            Calc calc = new Calc ();
            calc.SetX (5); // x.re = 5
            calc.SetY (10); // x.re = 5

            Console.Write ("{0} + {1} = {2}\n", calc.GetX (), calc.GetY (), calc.Sum ());
            // 5 + 10 = 15

            calc.z = 10; // zはpublicだからアクセス可能だが、x, yはprivateなのでアクセス不可
        }
    }
    // 「実装の隠蔽」で作った複素数クラス
    class Calc {
        // 変数は外部から隠蔽(private)
        private double x;
        private double y;
        public double z;

        // xを取り出す
        public double GetX () {
            return this.x;
        }

        // xを書き換え
        public void SetX (double x) {
            this.x = x;
        }

        // yを取り出す
        public double GetY () {
            return this.y;
        }

        // yを書き換え
        public void SetY (double y) {
            this.y = y;
        }

        // 和を計算
        public double Sum () {
            return x + y;
        }
    }
}