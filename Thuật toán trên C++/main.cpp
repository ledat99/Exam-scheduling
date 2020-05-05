#include<iostream>
#include<stdlib.h>
#include<fstream>
#define max 50

using namespace std;


void MangDinh(int n, int dinh[])
{
    for(int i = 1; i <= n; i++)
    {
        dinh[i] = i;
    }
}
void BacDinh(int a[][max], int n, int bac[])
{
    for(int i = 1;i <=n; i++)
    {
        bac[i] = 0;
        for(int j = 1;j <= n; j++)
        {
            bac[i] += a[i][j];
        }
    }
}
void SortDinh(int dinh[], int bac[], int n)
{
    for(int i = 1;i <= n;i++)
    {
        for(int j = i+1;j < n;j++)
        {
            if(bac[i] < bac[j])
            {
                swap(bac[i] , bac[j]);
                swap(dinh[i] , dinh[j]);
            }
        }

    }
}
void ToMau(int a[][max], int dinh[], int n, int x[])
{
    int mau=0;
    for (int i = 1;i <= n;i++)
    {
        if (x[dinh[i]] == 0)
        {
            mau++;
            x[dinh[i]] = mau;
            for (int j = i + 1;j <= n;j++)
            {
                if (a[dinh[i]][dinh[j]] == 0 && x[dinh[j]] == 0)
                {
                    int kt = 1;
                    for (int k = i + 1;k < j;k++)
                    {
                        if (a[dinh[k]][dinh[j]] == 1 && x[dinh[i]] == x[dinh[k]])
                        {
                            kt = 0;
                            break;
                        }
                    }
                    if (kt)
                    x[dinh[j]] = mau;
                }
            }
        }
    }
}
void xuatkq(int x[], int dinh[], int n)
{
    cout << "Dinh    Mau" << endl;
    for (int i = 1;i <= n;i++)
    {
        cout << " " << dinh[i] << " --->  " << x[dinh[i]] << endl;
    }
}
int chuyen(char c)
{
    return (int)c-48;
}
void readfile(int a[][max],int &n)
{
    fstream f;
    f.open("Input3.txt", ios::in);
    f>>n;
    string line;
    getline(f,line);
    int k=0;
    while(!f.eof())
    {
        getline(f,line);
        int h=0;
        for(int i=1;i<line.length();i++)
        {
            if(line[i]!=',' && line[i]!='\t'){
                a[k][h]=chuyen(line[i]);
                h++;
            }
        }
        k++;
    }
    f.close();
}
void WriteFile(int dinh[], int x[], int n)
{
    ofstream f("Tomau.txt");
    f << "Ma mon\t     To mau";
    f << endl;
    for (int i = 1; i <= n; i++)
    {
        f << "   " << dinh[i] << "\t\t" << x[dinh[i]];
        f << endl;
    }
    f.close();
}
void convertDS(int n, int a[][max],int b[][max])
{
    for(int i = 0;i < n;i++)
    {
        int l = 0;
        while(a[i][l] != -1)
        {
            l++;
        }
        for(int j = 0;j < l;j++)
        {
            for(int k = j+1;k < l;k++)
            {
                if(a[i][j] == a[i][k])
                {
                    b[a[i][j]][a[i][k]] = b[a[i][k]][a[i][j]] = 0;
                }else{
                    b[a[i][j]][a[i][k]] = b[a[i][k]][a[i][j]] = 1;
                }
            }
        }
    }
    for(int i = 1;i <= n;i++)
    {
        for(int j = 1;j <= n;j++)
            cout << b[i][j] << "  ";
        cout << endl;
    }
}
int main()
{
    int a[max][max];
    int b[max][max];
    int n;
    int bac[max];
    int dinh[max];
    int x[n+1];

    for(int i = 0;i < max;i++)
    {
        for(int j = 0;j < max;j++)
            a[i][j] = -1;
    }
    for(int i = 1;i <= n;i++)
    {
        x[i] = 0;
    }
    readfile(a,n);
    convertDS(n,a,b);
    BacDinh(b,n,bac);
    MangDinh(n,dinh);
    SortDinh(dinh,bac,n);
    ToMau(b,dinh,n,x);
    xuatkq(x,dinh,n);
    WriteFile(dinh,x,n);
    system("pause");
    return 0;

}
