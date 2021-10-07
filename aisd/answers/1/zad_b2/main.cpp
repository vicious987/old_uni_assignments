#include <cstdio>
#include <vector>
#include <unordered_map>

struct tuple
{
    unsigned a;
    unsigned b;
};

bool operator==(const tuple & x, const tuple & y)
{
    return x.a == y.a && x.b == y.b;
}


struct field
{
    unsigned tracks_total;
    std::vector<tuple> track_starts;
};

struct tuple_hash
{
    std::size_t operator()(tuple const & t) const noexcept
    {
        std::hash<unsigned> h;
        return h(t.a + t.b); // FIXME
    }
};

int main()
{
    const unsigned int k = 999979;
    unsigned int h, w, t;
    scanf("%u %u %u", &h, &w, &t);

    std::unordered_map<tuple, field, tuple_hash> path_array;
    path_array.reserve(2*t);

    unsigned f1, f2, t1, t2;
    for (unsigned i = 0; i < t; i++) {
        scanf("%u %u %u %u", &f1, &f2, &t1, &t2);
        tuple track_start { f1, f2 };
        tuple track_end { t1, t2 };
        path_array[track_start].tracks_total = 0;
        path_array[track_end].track_starts.push_back(track_start);
    }

    tuple start { 0, 0 };
    path_array[start].tracks_total = 1;

    for (unsigned a = 0; a <= h; a++) {
        for (unsigned b = 0; b <= w; b++) {

            tuple to { a, b };
            if (path_array.count(to) == 0)
                continue;

            field & f = path_array.at(to);

            unsigned n = f.tracks_total;
            for (const auto & start : f.track_starts) {
                unsigned tracks = path_array[start].tracks_total;
                n = (n + tracks) % 999979;
            }
            path_array[to].tracks_total = n;
        }
    }

    tuple end { h, w };
    printf("%d\n", path_array[end].tracks_total);
}
