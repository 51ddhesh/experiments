#include <bits/stdc++.h>
using namespace std;

using ll = long long;
using ull = unsigned long long;
using pii = pair<int, int>;
using pll = pair<ll, ll>;
using vi = vector<int>;
using vb = vector<bool>;
using vpii = vector<pii>;
using vpll = vector<pll>;
using vvi = vector<vi>;
using vll = vector<ll>;
using vvll = vector<vll>;
using mii = map<int, int>;
using mci = map<char, int>;
using si = set<int>;
using sl = set<ll>;
using sch = set<char>;

#define all(x) begin(x), end(x)
#define rall(x) rbegin(x), rend(x)
#define sz(x) (int)(x).size()
#define pb push_back
#define mp make_pair
#define fi first
#define se second

#define loop(i, a, b) for (int i = (int)(a); i < (int)(b); i++)
#define rloop(i, a, b) for (int i = (int)(a); i >= (int)(b); i--)
#define forr(i, v) for (auto &i : v)
#define forit(i, v) for (auto i = v.begin(); i != v.end(); i++)

constexpr int M = 1e9 + 7;
constexpr int NN = 2e5 + 10;
constexpr int INF = 1e9;
constexpr ll LINF = 1e18;
constexpr double EPS = 1e-9;

template <typename T>
ostream& operator<<(ostream& os, const vector<T> &v) {
    size_t n = v.size();
    for (size_t i = 0; i < n; i++) os << v[i] << (i == n-1 ? "" : " ");
    return os;
}

template <typename T>
istream& operator>>(istream& is, vector<T> &v) {
    for (auto &i : v) is >> i;
    return is;
}

template <typename X, typename Y>
istream& operator>>(istream& is, pair<X, Y> &p) {
    is >> p.fi >> p.se;
    return is;
}

template <typename X, typename Y>
ostream& operator<<(ostream& os, const pair<X, Y> &p) {
    os << "(" << p.fi << ", " << p.se << ")";
    return os;
}

template <typename T>
ostream& operator<<(ostream& os, const set<T> &s) {
    os << "{";
    forit(it, s) {
        if (it != s.begin()) os << ", ";
        os << *it;
    }
    os << "}";
    return os;
}

template <typename T>
ostream& operator<<(ostream& os, const multiset<T> &s) {
    os << "{";
    forit(it, s) {
        if (it != s.begin()) os << ", ";
        os << *it;
    }
    os << "}";
    return os;
}

template <typename K, typename V>
ostream& operator<<(ostream& os, const map<K, V> &m) {
    os << "{";
    forit(it, m) {
        if (it != m.begin()) os << ", ";
        os << it->fi << ": " << it->se;
    }
    os << "}";
    return os;
}

template <typename K, typename V>
ostream& operator<<(ostream& os, const unordered_map<K, V> &m) {
    os << "{";
    forit(it, m) {
        if (it != m.begin()) os << ", ";
        os << it->fi << ": " << it->se;
    }
    os << "}";
    return os;
}

template <typename T>
ostream& operator<<(ostream& os, const vector<vector<T>> &matrix) {
    os << "[\n";
    for (const auto &row : matrix) {
        os << "  [" << row << "]\n";
    }
    os << "]";
    return os;
}

#ifdef LOCAL
    #define DEBUG_ENABLED
#endif

#ifdef DEBUG_ENABLED
    template <typename T>
    void debug_print(const string &name, const T &value) {
        cerr << "\033[36m[DEBUG]\033[0m " << name << " = ";
        if constexpr (is_same_v<T, bool>) {
            cerr << "\033[33m" << (value ? "True" : "False") << "\033[0m";
        } else if constexpr (is_same_v<T, string>) {
            cerr << "\033[32m\"" << value << "\"\033[0m";
        } else if constexpr (is_same_v<T, char>) {
            cerr << "\033[32m'" << value << "'\033[0m";
        } else {
            cerr << "\033[35m" << value << "\033[0m";
        }
        cerr << endl;
    }
    
    template <typename T>
    void debug_print_constexpr(const string &name, const T &value) {
        cerr << "\033[36m[CONSTEXPR]\033[0m " << name << " = \033[31m" << value << "\033[0m" << endl;
    }
    
    // Debug with variable name
    #define debug(x) debug_print(#x, x)
    #define debugc(x) debug_print_constexpr(#x, x)
    
    // Debug multiple variables
    template <typename T, typename... Args>
    void debug_multi(const string &names, const T &first, const Args &...args) {
        size_t comma = names.find(',');
        string firstName = names.substr(0, comma);
        firstName.erase(0, firstName.find_first_not_of(" \t"));
        firstName.erase(firstName.find_last_not_of(" \t") + 1);
        debug_print(firstName, first);
        
        if constexpr (sizeof...(args) > 0) {
            string restNames = names.substr(comma + 1);
            debug_multi(restNames, args...);
        }
    }
    
    // Debug set<T>
    template <typename T>
    void debug_set(string name, const set<T>& s) {
        cerr << "\033[36m[DEBUG SET]\033[0m " << name << " = {";
        bool first = true;
        for (const auto& x : s) {
            if (!first) cerr << ", ";
            cerr << x;
            first = false;
        }
        cerr << "}" << endl;
    }

    // Debug unordered_set<T>
    template <typename T>
    void debug_uset(string name, const unordered_set<T>& s) {
        cerr << "\033[36m[DEBUG USET]\033[0m " << name << " = {";
        bool first = true;
        for (const auto& x : s) {
            if (!first) cerr << ", ";
            cerr << x;
            first = false;
        }
        cerr << "}" << endl;
    }

    // Debug map<K, V>
    template <typename K, typename V>
    void debug_map(string name, const map<K, V>& m) {
        cerr << "\033[36m[DEBUG MAP]\033[0m " << name << " = {";
        bool first = true;
        for (const auto& [k, v] : m) {
            if (!first) cerr << ", ";
            cerr << k << ": " << v;
            first = false;
        }
        cerr << "}" << endl;
    }

    // Debug unordered_map<K, V>
    template <typename K, typename V>
    void debug_umap(string name, const unordered_map<K, V>& m) {
        cerr << "\033[36m[DEBUG UMAP]\033[0m " << name << " = {";
        bool first = true;
        for (const auto& [k, v] : m) {
            if (!first) cerr << ", ";
            cerr << k << ": " << v;
            first = false;
        }
        cerr << "}" << endl;
    }
    

    #define debugm(...) debug_multi(#__VA_ARGS__, __VA_ARGS__)
    // Debug with custom message
    #define debugmsg(msg, x) cerr << "\033[36m[DEBUG]\033[0m " << msg << ": \033[35m" << x << "\033[0m" << endl
    
    // Debug loop iterations
    #define debugloop(i, x) cerr << "\033[36m[LOOP]\033[0m i=" << i << ", " << #x << " = \033[35m" << x << "\033[0m" << endl
    
    // Debug function entry/exit
    #define debugfn(fn) cerr << "\033[33m[FUNCTION]\033[0m Entering " << fn << endl
    #define debugret(fn, ret) cerr << "\033[33m[FUNCTION]\033[0m Exiting " << fn << " with return value: \033[35m" << ret << "\033[0m" << endl
    
    // Debug with line number
    #define debugline() cerr << "\033[36m[DEBUG]\033[0m Reached line " << __LINE__ << " in " << __FUNCTION__ << endl
    
    // Debug array/vector range
    template <typename T>
    void debug_range(const string &name, const T &container, int start, int end) {
        cerr << "\033[36m[RANGE]\033[0m " << name << "[" << start << ":" << end << "] = [";
        for (int i = start; i <= end && i < (int)container.size(); i++) {
            if (i > start) cerr << ", ";
            cerr << container[i];
        }
        cerr << "]" << endl;
    }
    

    #define debugmap(m) debug_map(#m, m)
    #define debugumap(m) debug_umap(#m, m)
    #define debugset(s) debug_set(#s, s)
    #define debuguset(s) debug_uset(#s, s)

    #define debugrange(x, start, end) debug_range(#x, x, start, end)
    
    // Debug with condition
    #define debugif(condition, x) if (condition) { debug_print(#x, x); }
    
    // Profiling macros
    #define PROFILE_START() auto __profile_start = chrono::high_resolution_clock::now()
    #define PROFILE_END(name) do { \
        auto __profile_end = chrono::high_resolution_clock::now(); \
        auto __duration = chrono::duration_cast<chrono::microseconds>(__profile_end - __profile_start); \
        cerr << "\033[31m[PROFILE]\033[0m " << name << " took " << __duration.count() << " μs" << endl; \
    } while(0)
    
    // Assert with message
    #define assertm(condition, message) do { \
        if (!(condition)) { \
            cerr << "\033[31m[ASSERTION FAILED]\033[0m " << message << " at line " << __LINE__ << endl; \
            exit(1); \
        } \
    } while(0)
    
#else
    #define debug(x)
    #define debugc(x)
    #define debugm(...)
    #define debugmsg(msg, x)
    #define debugloop(i, x)
    #define debugfn(fn)
    #define debugret(fn, ret)
    #define debugline()
    #define debugrange(x, start, end)
    #define debugif(condition, x)
    #define PROFILE_START()
    #define PROFILE_END(name)
    #define assertm(condition, message)
    #define debugmap(m)
    #define debugumap(m)
    #define debugset(s)
    #define debuguset(s)
#endif

template <typename T>
T gcd(T a, T b) { return b ? gcd(b, a % b) : a; }

template <typename T>
T lcm(T a, T b) { return a / gcd(a, b) * b; }

template <typename T>
T power(T base, T exp, T mod = M) {
    T result = 1;
    while (exp > 0) {
        if (exp % 2 == 1) result = (result * base) % mod;
        base = (base * base) % mod;
        exp /= 2;
    }
    return result;
}

template <typename T>
bool is_prime(T n) {
    if (n <= 1) return false;
    if (n <= 3) return true;
    if (n % 2 == 0 || n % 3 == 0) return false;
    for (T i = 5; i * i <= n; i += 6) {
        if (n % i == 0 || n % (i + 2) == 0) return false;
    }
    return true;
}

void solve() {
    
}

int main() {
    ios_base::sync_with_stdio(false);
    cin.tie(nullptr);

    #ifdef LOCAL 
        // freopen("in.txt", "r", stdin);
        // freopen("out.txt", "w", stdout);
        // freopen("err.txt", "w", stderr);
        auto start = chrono::high_resolution_clock::now();
    #endif // LOCAL
    
    int t = 1;
    // cin >> t;
    while (t--) solve();

    #ifdef LOCAL
        auto end = chrono::high_resolution_clock::now();
        auto duration1 = chrono::duration_cast<chrono::microseconds> (end - start);
        auto duration2 = chrono::duration_cast<chrono::milliseconds> (end - start);
        cerr << "\033[32m[EXECUTION TIME]\033[0m " << duration1.count() << " μs (" << duration2.count() << " ms)" << endl;
    #endif // LOCAL

    return 0;
}

