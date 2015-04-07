using System;
using System.Collections.Generic;
using System.Collections;
using System.Text;

namespace System
{
    internal interface ITuple
    {
        // Methods
        int GetHashCode(IEqualityComparer comparer);
        string ToString(StringBuilder sb);

        // Properties
        int Size { get; }
    }


    public interface IStructuralEquatable
    {
        // Methods
        bool Equals(object other, IEqualityComparer comparer);
        int GetHashCode(IEqualityComparer comparer);
    }

    public interface IStructuralComparable
    {
        // Methods
        int CompareTo(object other, IComparer comparer);
    }

    public static class Tuple
{
    // Methods
    internal static int CombineHashCodes(int h1, int h2)
    {
        return (((h1 << 5) + h1) ^ h2);
    }

    internal static int CombineHashCodes(int h1, int h2, int h3)
    {
        return CombineHashCodes(CombineHashCodes(h1, h2), h3);
    }

    internal static int CombineHashCodes(int h1, int h2, int h3, int h4)
    {
        return CombineHashCodes(CombineHashCodes(h1, h2), CombineHashCodes(h3, h4));
    }

    internal static int CombineHashCodes(int h1, int h2, int h3, int h4, int h5)
    {
        return CombineHashCodes(CombineHashCodes(h1, h2, h3, h4), h5);
    }

    internal static int CombineHashCodes(int h1, int h2, int h3, int h4, int h5, int h6)
    {
        return CombineHashCodes(CombineHashCodes(h1, h2, h3, h4), CombineHashCodes(h5, h6));
    }

    internal static int CombineHashCodes(int h1, int h2, int h3, int h4, int h5, int h6, int h7)
    {
        return CombineHashCodes(CombineHashCodes(h1, h2, h3, h4), CombineHashCodes(h5, h6, h7));
    }

    internal static int CombineHashCodes(int h1, int h2, int h3, int h4, int h5, int h6, int h7, int h8)
    {
        return CombineHashCodes(CombineHashCodes(h1, h2, h3, h4), CombineHashCodes(h5, h6, h7, h8));
    }

   
    public static Tuple<T1, T2, T3, T4, T5, T6, T7> Create<T1, T2, T3, T4, T5, T6, T7>(T1 item1, T2 item2, T3 item3, T4 item4, T5 item5, T6 item6, T7 item7)
    {
        return new Tuple<T1, T2, T3, T4, T5, T6, T7>(item1, item2, item3, item4, item5, item6, item7);
    }

}


[Serializable]// "Pitch", pan.panPitch, 22, 10, panPitch_en_ADDR, panPitch_x_ADDR, panPitch_y_ADDR
public class Tuple<T1, T2, T3, T4, T5, T6, T7> : IStructuralEquatable, IStructuralComparable, IComparable, ITuple
{
    // Fields
    private readonly T1 m_Item1;
    private readonly T2 m_Item2;
    private readonly T3 m_Item3;
    private readonly T4 m_Item4;
    private readonly T5 m_Item5;
    private readonly T6 m_Item6;
    private readonly T7 m_Item7;

    // Methods
    public Tuple(T1 item1, T2 item2, T3 item3, T4 item4, T5 item5, T6 item6, T7 item7)
    {
        this.m_Item1 = item1;
        this.m_Item2 = item2;
        this.m_Item3 = item3;
        this.m_Item4 = item4;
        this.m_Item5 = item5;
        this.m_Item6 = item6;
        this.m_Item7 = item7;
    }

    public override bool Equals(object obj)
    {
        return ((IStructuralEquatable) this).Equals(obj, EqualityComparer<object>.Default);
    }

    public override int GetHashCode()
    {
        return ((IStructuralEquatable) this).GetHashCode(EqualityComparer<object>.Default);
    }

    int IStructuralComparable.CompareTo(object other, IComparer comparer)
    {
        if (other == null)
        {
            return 1;
        }
        Tuple<T1, T2, T3, T4, T5, T6, T7> tuple = other as Tuple<T1, T2, T3, T4, T5, T6, T7>;
        if (tuple == null)
        {
            throw new ArgumentException("ArgumentException_TupleIncorrectType");
        }
        int num = 0;
        num = comparer.Compare(this.m_Item1, tuple.m_Item1);
        if (num != 0)
        {
            return num;
        }
        num = comparer.Compare(this.m_Item2, tuple.m_Item2);
        if (num != 0)
        {
            return num;
        }
        num = comparer.Compare(this.m_Item3, tuple.m_Item3);
        if (num != 0)
        {
            return num;
        }
        num = comparer.Compare(this.m_Item4, tuple.m_Item4);
        if (num != 0)
        {
            return num;
        }
        num = comparer.Compare(this.m_Item5, tuple.m_Item5);
        if (num != 0)
        {
            return num;
        }
        num = comparer.Compare(this.m_Item6, tuple.m_Item6);
        if (num != 0)
        {
            return num;
        }
        return comparer.Compare(this.m_Item7, tuple.m_Item7);
    }

    bool IStructuralEquatable.Equals(object other, IEqualityComparer comparer)
    {
        if (other == null)
        {
            return false;
        }
        Tuple<T1, T2, T3, T4, T5, T6, T7> tuple = other as Tuple<T1, T2, T3, T4, T5, T6, T7>;
        if (tuple == null)
        {
            return false;
        }
        return ((((comparer.Equals(this.m_Item1, tuple.m_Item1) && comparer.Equals(this.m_Item2, tuple.m_Item2)) && (comparer.Equals(this.m_Item3, tuple.m_Item3) && comparer.Equals(this.m_Item4, tuple.m_Item4))) && (comparer.Equals(this.m_Item5, tuple.m_Item5) && comparer.Equals(this.m_Item6, tuple.m_Item6))) && comparer.Equals(this.m_Item7, tuple.m_Item7));
    }

    int IStructuralEquatable.GetHashCode(IEqualityComparer comparer)
    {
        return Tuple.CombineHashCodes(comparer.GetHashCode(this.m_Item1), comparer.GetHashCode(this.m_Item2), comparer.GetHashCode(this.m_Item3), comparer.GetHashCode(this.m_Item4), comparer.GetHashCode(this.m_Item5), comparer.GetHashCode(this.m_Item6), comparer.GetHashCode(this.m_Item7));
    }

    int IComparable.CompareTo(object obj)
    {
        return ((IStructuralComparable) this).CompareTo(obj, Comparer<object>.Default);
    }

    int ITuple.GetHashCode(IEqualityComparer comparer)
    {
        return ((IStructuralEquatable) this).GetHashCode(comparer);
    }

    string ITuple.ToString(StringBuilder sb)
    {
        sb.Append(this.m_Item1);
        sb.Append(", ");
        sb.Append(this.m_Item2);
        sb.Append(", ");
        sb.Append(this.m_Item3);
        sb.Append(", ");
        sb.Append(this.m_Item4);
        sb.Append(", ");
        sb.Append(this.m_Item5);
        sb.Append(", ");
        sb.Append(this.m_Item6);
        sb.Append(", ");
        sb.Append(this.m_Item7);
        sb.Append(")");
        return sb.ToString();
    }

    public override string ToString()
    {
        StringBuilder sb = new StringBuilder();
        sb.Append("(");
        return ((ITuple) this).ToString(sb);
    }

    // Properties
    public T1 Item1
    {
        get
        {
            return this.m_Item1;
        }
    }

    public T2 Item2
    {
        get
        {
            return this.m_Item2;
        }
    }

    public T3 Item3
    {
        get
        {
            return this.m_Item3;
        }
    }

    public T4 Item4
    {
        get
        {
            return this.m_Item4;
        }
    }

    public T5 Item5
    {
        get
        {
            return this.m_Item5;
        }
    }

    public T6 Item6
    {
        get
        {
            return this.m_Item6;
        }
    }

    public T7 Item7
    {
        get
        {
            return this.m_Item7;
        }
    }

    int ITuple.Size
    {
        get
        {
            return 7;
        }
    }
}

}
