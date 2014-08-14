using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Runtime.InteropServices;
namespace WindowsFormsApplication1
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
            IntPtr WindowHandle = FindWindow(null, textBox1.Text);
            //    // Verify that Calculator is a running process. 
            if (WindowHandle == IntPtr.Zero)
            {
                MessageBox.Show(textBox1.Text + " is not running.");
                return;
            }
            SetForegroundWindow(WindowHandle);
            RegisterHotKey(this.Handle, 247696411, 0, (UInt32)Keys.F10); //注册热键
            RegisterHotKey(this.Handle, 247696412, 0, (UInt32)Keys.F9); //注册热键
            RegisterHotKey(this.Handle, 247696413, 0, (UInt32)Keys.F8);//注册热键
            RegisterHotKey(this.Handle, 247696414, 0, (UInt32)Keys.F1);//注册热键
        }

        // Get a handle to an application window. 
        [DllImport("USER32.DLL")]
        public static extern IntPtr FindWindow(string lpClassName, string lpWindowName);
        // Activate an application window. 

        [DllImport("USER32.DLL")]
        public static extern bool SetForegroundWindow(IntPtr hWnd);

        // Send a series of key presses to the Calculator application. 
        [DllImport("user32.dll")]
        public static extern UInt32 RegisterHotKey(IntPtr hWnd, UInt32 id, UInt32 fsModifiers, UInt32 vk); //API
        [DllImport("user32.dll", SetLastError = true)]
        public static extern bool UnregisterHotKey(IntPtr hWnd, int id);

        protected override void WndProc(ref Message m)
        {

            const int WM_HOTKEY = 0x0312;
            // m.WParam.ToInt32() 要和 注册热键时的第2个参数一样
            if (m.Msg == WM_HOTKEY && m.WParam.ToInt32() == 247696411) //判断热键
            {
                timer1.Enabled = false;

            }
            if (m.Msg == WM_HOTKEY && m.WParam.ToInt32() == 247696412) //判断热键
            {
                timer1.Enabled = true;
            }
            if (m.Msg == WM_HOTKEY && m.WParam.ToInt32() == 247696413)
            {
                ColorPX.Text = Cursor.Position.X.ToString();
                ColorPY.Text = Cursor.Position.Y.ToString();
            }
            if (m.Msg == WM_HOTKEY && m.WParam.ToInt32() == 247696414)
            {
                ProcessKey();
            }
            base.WndProc(ref m);
        }

        private void ProcessKey()
        {
            Color color = GetPixelColor(Int32.Parse(ColorPX.Text), Int32.Parse(ColorPY.Text));
            if ((Convert.ToInt32(color.R) == 32) && (Convert.ToInt32(color.G) == 0) && (Convert.ToInt32(color.B) == 0))
                SendKeys.SendWait("t");//野蛮咆哮
            if ((Convert.ToInt32(color.R) == 64) && (Convert.ToInt32(color.G) == 0) && (Convert.ToInt32(color.B) == 0))
                SendKeys.SendWait("3");//破甲
            if ((Convert.ToInt32(color.R) == 96) && (Convert.ToInt32(color.G) == 0) && (Convert.ToInt32(color.B) == 0))
                SendKeys.SendWait("g");//猛虎之怒
            if ((Convert.ToInt32(color.R) == 128) && (Convert.ToInt32(color.G) == 0) && (Convert.ToInt32(color.B) == 0))
                SendKeys.SendWait("v");//狂暴
            if ((Convert.ToInt32(color.R) == 159) && (Convert.ToInt32(color.G) == 0) && (Convert.ToInt32(color.B) == 0))
                SendKeys.SendWait("q");//斜掠
            if ((Convert.ToInt32(color.R) == 191) && (Convert.ToInt32(color.G) == 0) && (Convert.ToInt32(color.B) == 0))
                SendKeys.SendWait("r");//割裂
            if ((Convert.ToInt32(color.R) == 223) && (Convert.ToInt32(color.G) == 0) && (Convert.ToInt32(color.B) == 0))
                SendKeys.SendWait("");//
            if ((Convert.ToInt32(color.R) == 255) && (Convert.ToInt32(color.G) == 0) && (Convert.ToInt32(color.B) == 0))
                SendKeys.SendWait("w");//撕碎
            if ((Convert.ToInt32(color.R) == 0) && (Convert.ToInt32(color.G) == 32) && (Convert.ToInt32(color.B) == 32))
                SendKeys.SendWait("a");//凶猛撕咬



            if ((Convert.ToInt32(color.R) == 0) && (Convert.ToInt32(color.G) == 32) && (Convert.ToInt32(color.B) == 0))
                SendKeys.SendWait("t");//月火
            if ((Convert.ToInt32(color.R) == 0) && (Convert.ToInt32(color.G) == 64) && (Convert.ToInt32(color.B) == 0))
                SendKeys.SendWait("g");//阳炎
            if ((Convert.ToInt32(color.R) == 0) && (Convert.ToInt32(color.G) == 96) && (Convert.ToInt32(color.B) == 0))
                SendKeys.SendWait("w");//愤怒
            if ((Convert.ToInt32(color.R) == 0) && (Convert.ToInt32(color.G) == 128) && (Convert.ToInt32(color.B) == 0))
                SendKeys.SendWait("r");//星火
            if ((Convert.ToInt32(color.R) == 0) && (Convert.ToInt32(color.G) == 159) && (Convert.ToInt32(color.B) == 0))
                SendKeys.SendWait("a");//星涌
            if ((Convert.ToInt32(color.R) == 0) && (Convert.ToInt32(color.G) == 191) && (Convert.ToInt32(color.B) == 0))
                SendKeys.SendWait("c");//星辰
            if ((Convert.ToInt32(color.R) == 0) && (Convert.ToInt32(color.G) == 223) && (Convert.ToInt32(color.B) == 0))
                SendKeys.SendWait("v");//自然之力
            if ((Convert.ToInt32(color.R) == 0) && (Convert.ToInt32(color.G) == 32) && (Convert.ToInt32(color.B) == 255))
                SendKeys.SendWait("2");//手套
        }
        [DllImport("gdi32.dll")]
        static public extern uint GetPixel(IntPtr hDC, int XPos, int YPos);

        [DllImport("user32.dll")]
        public static extern IntPtr GetDC(IntPtr hwnd);

        [DllImport("user32.dll")]
        public static extern IntPtr ReleaseDC(IntPtr hwnd, IntPtr hDC);

        public System.Drawing.Color GetPixelColor(int x, int y)
        {
            IntPtr hdc = GetDC(IntPtr.Zero);
            uint pixel = GetPixel(hdc, x, y);
            ReleaseDC(IntPtr.Zero, hdc);
            Color color = Color.FromArgb((int)(pixel & 0x000000FF),
            (int)(pixel & 0x0000FF00) >> 8,
            (int)(pixel & 0x00FF0000) >> 16);
            return color;
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            Random rnd = new Random();
            timer1.Interval = 500 + rnd.Next(20,100);
            ProcessKey();
        }
        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
