using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Text;
using System.Threading.Tasks;

namespace ExamScheduling
{
    class ToMau
    {
		private int mau;

		public int Mau { get => mau; set => mau = value; }

		public void MangDinh(int n, int[] dinh)
		{
			for (int i = 1; i <= n; i++)
			{
				dinh[i] = i;
			}
		}
		public void BacDinh(int[,] a, int n, int[] bac)
		{
			for (int i = 1; i <= n; i++)
			{
				bac[i] = 0;
				for (int j = 1; j <= n; j++)
				{
					bac[i] += a[i,j];
				}
			}
		}
		public void SortDinh(int[] dinh, int[] bac, int n)
		{
			for (int i = 1; i <= n; i++)
			{
				for (int j = i + 1; j < n; j++)
				{
					if (bac[i] < bac[j])
					{
						int temp = bac[i];
						bac[i] = bac[j];
						bac[j] = temp;
						temp = dinh[i];
						dinh[i] = dinh[j];
						dinh[j] = temp;
					}
				}

			}
		}
		public void Tomau1(int[,] b, int[] dinh, int n,List<HocPhan> HP)
		{
			mau = 0;
			for (int i = 1; i <= n; i++)
			{
				if (HP[dinh[i]].Color == 0)
				{
					mau++;
					HP[dinh[i]].Color = mau;
					for (int j = i + 1; j <= n; j++)
					{
						if (b[dinh[i], dinh[j]] == 0 && HP[dinh[j]].Color == 0)
						{
							int kt = 1;
							for (int k = i + 1; k < j; k++)
							{
								if (b[dinh[k], dinh[j]] == 1 && HP[dinh[i]].Color == HP[dinh[k]].Color)
								{
									kt = 0;
									break;
								}
							}
							if (kt != 0)
							{
								HP[dinh[j]].Color = mau;
							}
						}
					}
				}
			}
		}
		public void convertDS1(int n, List<HocPhan> HP, int[,] b)
		{
			for (int i = 1; i <= n; i++)
			{
				for(int j = 0; j < HP[i].Sv.Count; j++)	
				{
					for (int k = i + 1; k <= n; k++)
					{
						if (b[i, k] == 1)
						{
							continue;
						}
						for(int h = 0; h < HP[k].Sv.Count; h++) 	
						{
							if (HP[i].Sv[j] == HP[k].Sv[h])
							{
								b[i, k] = b[k, i] = 1;
								break;
							}
						}
					}
				}
			}
		}

	}
}
