// THIS IS CPP CODE. EZ TO TRANSLATE INTO JAVA. DONE SO FAR: 0/543

public abstract class Formula
{
	double calculate();
	string description();
};

// operandy
public abstract class Number extends Formula
{
	double value_;

	number(double x)
	{
		value_ = x;
	}
	double calculate()
	{
		return value_;
	}
	string description()
	{
		return String.valueOf(value_);
	}
};

/* 	REWRITE THIS SHIT
class variable extends Formula
{
	static vector< pair<string, double> > variables_;

public:

	std::string name_;

	// variables_ methods
	static void add(string name)
	{
		variables_.push_back(make_pair(name, 0));
	}

	static void add(string name, double value)
	{
		variables_.push_back(make_pair(name, value));
	}

	static void set_at(string name, double newvalue)
	{
		for (int i = 0; i < variables_.size(); i++)
		{
			if (get<0>(variables_[i]) == name)
				get<1>(variables_[i]) = newvalue;
		}
	}

	static bool exist(string name)
	{
		for (int i = 0; i < variables_.size(); i++)
			if (get<0>(variables_[i]) == name)
				return true;
		return false;
	}

	static double get_at(string name)
	{
		for (int i = 0; i < variables_.size(); i++)
			if (get<0>(variables_[i]) == name)
				return get<1>(variables_[i]);
		throw "nie ma zmiennej o takiej nazwie w zbiorze zmiennych";
	}

	// variable methods 

	variable(const std::string & name)
	{
		name_ = name;
		if (!exist(name))
			add(name);
	}

	double calculate() override
	{
		return get_at(name_);
	}

	string description() override
	{
		return name_;
	}

};
*/
// operatory0
class Operator0arg extends Formula
{}

class pi extends Operator0arg
{
	double calculate()
	{
		return 3.141592653589793;
	}
	string description()
	{
		return "PI";
	}
};

class e extends Operator0arg
{
	double calculate()
	{
		return 2.71828182845904;
	}
	string description()
	{
		return "e";
	}
};

class gamma extends operator0arg
{
	double calculate() override
	{
		return 0.577215664901532;
	}
	string description() override
	{
		return "g";
	}
};

class phi extends operator0arg
{
	double calculate() override
	{
		return 1.618033988749;
	}
	string description() override
	{
		return "PHI";
	}
};

// operatory1
class operator1arg extends operator0arg
{};

class addinverse extends operator1arg
{
	formula* f_;
public:
	addinverse(formula *f)
	{
		f_ = f;
	}
	double calculate() override
	{
		return -1 * f_->calculate();
	}
	string description() override
	{
		return "inv.+(" + to_string(f_->calculate()) + ")";
	}
	~addinverse()
	{
		delete f_;
		f_ = nullptr;
	}
};

class multinverse extends operator1arg
{
	formula* f_;
public:
	multinverse(formula *f)
	{
		f_ = f;
	}
	double calculate() override
	{
		return 1 / f_->calculate();
	}
	string description() override
	{
		return "inv.*(" + to_string(f_->calculate()) + ")";
	}
	~multinverse()
	{
		delete f_;
		f_ = nullptr;
	}
};

class absolute extends operator1arg
{
	formula* f_;
public:
	absolute(formula *f)
	{
		f_ = f;
	}
	double calculate() override
	{
		return fabs(f_->calculate());
	}
	string description() override
	{
		return "[" + to_string(f_->calculate()) + "]";
	}
	~absolute()
	{
		delete f_;
		f_ = nullptr;
	}
};

class sinus extends operator1arg
{
	formula* f_;
public:
	sinus(formula *f)
	{
		f_ = f;
	}
	double calculate() override
	{
		return sin(f_->calculate() * 3.141 / 180);
	}
	string description() override
	{
		return "sin(" + to_string(f_->calculate()) + ")";
	}
	~sinus()
	{
		delete f_;
		f_ = nullptr;
	}
};

class cosinus extends operator1arg
{
	formula* f_;
public:
	cosinus(formula *f)
	{
		f_ = f;
	}
	double calculate() override
	{
		return cos(f_->calculate() * 3.141 / 180);
	}
	string description() override
	{
		return "cos(" + to_string(f_->calculate()) + ")";
	}
	~cosinus()
	{
		delete f_;
		f_ = nullptr;
	}
};

class exponential extends operator1arg
{
	formula* f_;
public:
	exponential(formula *f)
	{
		f_ = f;
	}
	double calculate() override
	{
		return exp(f_->calculate());
	}
	string description() override
	{
		return "exp(" + to_string(f_->calculate()) + ")";
	}
	~exponential()
	{
		delete f_;
		f_ = nullptr;
	}
};

class lognat extends operator1arg
{
	formula* f_;
public:
	lognat(formula *f)
	{
		f_ = f;
	}
	double calculate() override
	{
		return log(f_->calculate());
	}
	string description() override
	{
		return "log.e(" + to_string(f_->calculate()) + ")";
	}
	~lognat()
	{
		delete f_;
		f_ = nullptr;
	}
};

// operatory2
class operator2arg extends operator1arg
{};

class add extends operator2arg

	: public operator2arg
{
	formula* l_;
	formula* r_;
public:
	add(formula *l, formula *r)
	{
		l_ = l;
		r_ = r;
	}
	double calculate() override
	{
		return l_->calculate() + r_->calculate();
	}
	string description() override
	{
		return l_->description() + "+" + r_->description();
	}
	~add()
	{
		delete l_;
		delete r_;
		l_ = nullptr;
		r_ = nullptr;
	}
};

class subtraction extends operator2arg
{
	formula* l_;
	formula* r_;
public:
	subtraction(formula *l, formula *r)
	{
		l_ = l;
		r_ = r;
	}
	double calculate() override
	{
		return l_->calculate() - r_->calculate();
	}
	string description() override
	{
		return l_->description() + "-" + r_->description();
	}
	~subtraction()
	{
		delete l_;
		delete r_;
		l_ = nullptr;
		r_ = nullptr;
	}
};

class multiply extends operator2arg
{
	formula* l_;
	formula* r_;
public:
	multiply(formula *l, formula *r)
	{
		l_ = l;
		r_ = r;
	}
	double calculate() override
	{
		return l_->calculate() * r_->calculate();
	}
	string description() override
	{
		return l_->description() + "*" + r_->description();
	}
	~multiply()
	{
		delete l_;
		delete r_;
		l_ = nullptr;
		r_ = nullptr;
	}
};

class division extends operator2arg
{
	formula* l_;
	formula* r_;
public:
	division(formula *l, formula *r)
	{
		l_ = l;
		r_ = r;
	}
	double calculate() override
	{
		return l_->calculate() / r_->calculate();
	}
	string description() override
	{
		return l_->description() + "/" + r_->description();
	}
	~division()
	{
		delete l_;
		delete r_;
		l_ = nullptr;
		r_ = nullptr;
	}
};

class modulo extends operator2arg
{
	formula* l_;
	formula* r_;
public:
	modulo(formula *l, formula *r)
	{
		l_ = l;
		r_ = r;
	}
	double calculate() override
	{
		return fmod(l_->calculate(), r_->calculate());
	}
	string description() override
	{
		return l_->description() + "%" + r_->description();
	}
	~modulo()
	{
		delete l_;
		delete r_;
		l_ = nullptr;
		r_ = nullptr;
	}
};

class power extends operator2arg
{
	formula* l_;
	formula* r_;
public:
	power(formula *l, formula *r)
	{
		l_ = l;
		r_ = r;
	}
	double calculate() override
	{
		return pow(l_->calculate(), r_->calculate());
	}
	string description() override
	{
		return l_->description() + "^" + r_->description();
	}
	~power()
	{
		delete l_;
		delete r_;
		l_ = nullptr;
		r_ = nullptr;
	}
};

class logarithm extends operator2arg
{
	formula* l_;
	formula* r_;
public:
	logarithm(formula *l, formula *r)
	{
		l_ = l;
		r_ = r;
	}
	double calculate() override
	{
		return log(l_->calculate() / log(r_->calculate()));
	}
	string description() override
	{
		return "log(b:" + l_->description() + "of:" + r_->description() + ")";
	}
	~logarithm()
	{
		delete l_;
		delete r_;
		l_ = nullptr;
		r_ = nullptr;
	}
};

void main()
{
	//std::vector<std::pair<std::string, double>> variables_;
	variable::add("var", 1);

	formula *w = new add(
		new number(6),
		new number(7)
		);

	//variable::set_at("var", 1);

	double ret = w->calculate();
	string rets = w->description();
	cout << ret << " = " << rets << endl;
	system("pause");
}
