import pandas
from scipy import sparse
from numpy import array,append,int64,amax

data = pandas.read_csv("user_events.csv").as_matrix()
users = [row[0] for row in data]
events = [row[1] for row in data]
values = [row[2] for row in data]
a = sparse.coo_matrix((values,(users,events)),shape=(len(users),len(events)))
import ipdb;ipdb.set_trace()
