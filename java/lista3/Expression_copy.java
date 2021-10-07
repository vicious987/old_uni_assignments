// THIS IS CPP CODE. EZ TO TRANSLATE INTO JAVA. DONE SO FAR: 0/543
using namespace std;

class formula
{
public:
	virtual double calculate() = 0;
	virtual string description() = 0;
};

// operandy
class number
	: public formula
{
	double value_;
public:
	number(double x)
	{
		value_ = x;
	}
	double calculate() override
	{
		return value_;
	}
	string description() override
	{
		return to_string(value_);
	}
};

class variable
	: public formula
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
// operatory0
class operator0arg
	: public formula
{};

class pi
	:public operator0arg
{
	double calculate() override
	{
		return 3.141592653589793;
	}
	string description() override
	{
		return "PI";
	}
};

class e
	:public operator0arg
{
	double calculate() override
	{
		return 2.71828182845904;
	}
	string description() override
	{
		return "e";
	}
};

class gamma
	:public operator0arg
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

class phi
	:public operator0arg
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
class operator1arg
	: public operator0arg
{};

class addinverse
	: public operator1arg
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

class multinverse
	: public operator1arg
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

class absolute
	: public operator1arg
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

class sinus
	: public operator1arg
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

class cosinus
	: public operator1arg
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

class exponential
	: public operator1arg
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

class lognat
	: public operator1arg
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
class operator2arg
	: public operator1arg
{};

class add
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

class subtraction
	: public operator2arg
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

class multiply
	: public operator2arg
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

class division
	: public operator2arg
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

class modulo
	: public operator2arg
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

class power
	: public operator2arg
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

class logarithm
	: public operator2arg
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
