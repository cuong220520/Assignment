using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WindowsFormsApp3
{
    public partial class assignment2 : Form
    {
        public assignment2()
        {
            InitializeComponent();
        }

        private void assignment2_Load(object sender, EventArgs e)
        {

        }

        private void txt14_TextChanged(object sender, EventArgs e)
        {

        }
        static double pur(int x, int y)
        {
            double b;
            b = (double)x / y;
            b = Math.Round(b, 2);
            return b;
        }

        private void rbtArea1_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void btnPurchased_Click_1(object sender, EventArgs e)

        {
            int RON9541;
            int RON9531;
            int E51;
            int DO11;
            int DO51;
            int Oil1;
            int RON9542;
            int RON9532;
            int E52;
            int DO12;
            int DO52;
            int Oil2;
            int Money;
            double Buy = 0;
            RON9541 = Convert.ToInt32(txt1.Text);
            RON9531 = Convert.ToInt32(txt2.Text);
            E51 = Convert.ToInt32(txt3.Text);
            DO11 = Convert.ToInt32(txt4.Text);
            DO51 = Convert.ToInt32(txt5.Text);
            Oil1 = Convert.ToInt32(txt6.Text);
            RON9542 = Convert.ToInt32(txt7.Text);
            RON9532 = Convert.ToInt32(txt8.Text);
            E52 = Convert.ToInt32(txt9.Text);
            DO12 = Convert.ToInt32(txt10.Text);
            DO52 = Convert.ToInt32(txt11.Text);
            Oil2 = Convert.ToInt32(txt12.Text);
            Money = Convert.ToInt32(txt13.Text);
            
            if (rbtArea1.Checked)
            {
                if (rbt3.Checked)
                {
                    Buy = pur(Money, RON9541);
                }
                else if (rbt4.Checked)
                {
                    Buy = pur(Money, RON9531);
                }
                else if (rbt5.Checked)
                {
                    Buy = pur(Money, E51);
                }
                else if (rbt6.Checked)
                {
                    Buy = pur(Money, DO11);
                }
                else if (rbt7.Checked)
                {
                    Buy = pur(Money, DO51);
                }
                else if (rbt8.Checked)
                {
                    Buy = pur(Money, Oil1);
                }
            }
            else if (rbtArea2.Checked)
            {
                if (rbt3.Checked)
                {
                    Buy = pur(Money, RON9542);
                }
                else if (rbt4.Checked)
                {
                    Buy = pur(Money, RON9532);
                }
                else if (rbt5.Checked)
                {
                    Buy = pur(Money, E52);
                }
                else if (rbt6.Checked)
                {
                    Buy = pur(Money, DO12);
                }
                else if (rbt7.Checked)
                {
                    Buy = pur(Money, DO52);
                }
                else if (rbt8.Checked)
                {
                    Buy = pur(Money, Oil2);
                }
            }
            txt14.Text = Buy.ToString() + " liter";


        }

                

        
    }
}
