using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using MySql.Data.MySqlClient;
using MySqlX.XDevAPI.Relational;

namespace JSOS_3._0
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window, IMainWindow
    {
        public MainWindow()
        {
            InitializeComponent();
            home();
        }




        public void loadView(Frame f)
        {
            ContentGrid.Children.Clear();
            ContentGrid.Children.Add(f);
            Grid.SetRow(f, 0);
            Grid.SetColumn(f, 0);
        }

        public void home()
        {
            StronaPowitalna sp = new StronaPowitalna(this);
            loadView(new Frame { Content = sp});
        }

        public void login(int rola)
        {
            Login login = new Login(rola);
            loadView(new Frame { Content = login });
        }

        public void signin()
        {
            Signin signin= new Signin(this);
            loadView(new Frame { Content = signin });
        }

    }
}


