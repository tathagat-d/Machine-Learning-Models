#!/usr/bin/python
import numpy as np
import math as mth
from optparse import OptionParser
from scipy.spatial import distance

#==============================================================================
def getFiles():
    parser = OptionParser()
    parser.add_option('--train', action='store', type='string',
            help='Please enter training file name')
    parser.add_option('--test', action='store', type='string',
            help='Please enter test file name')
    (options, args) = parser.parse_args()
    return options.train, options.test
#==============================================================================

def getData(fname):
    fhand = open(fname, 'r')
    x     = list()
    y     = list()
    #--------------------------------------------------------------------------
    for line in fhand:
        if not line: continue
        line = line.strip().split(',')
        # First attribute is not important
        line = line[1:]
        length = len(line)
        # Type conversion to float.
        for i in range(length): line[i] = float(line[i])
        # Adding data to train data.
        x.append(line[:-1])
        # Correct tag corresponding to the input. last column is the tag.
        y.append(line[-1])
    #--------------------------------------------------------------------------
    # Converting data to n dimensional array.
    x = np.array(x, np.float32)
    y = np.array(y, np.int)
    mean = np.mean(x, axis = 0)
    std  = np.std(x, axis = 0)
    fhand.close()
    return x, y, mean, std
#==============================================================================

def getEuclideanDistance(x1, x2):
    return distance.euclidean(x1, x2)
#==============================================================================

def getManhattanDistance(x1, x2):
    return distance.cityblock(x1, x2)
#==============================================================================

def countVotes(distance):
    votes, temp, max_count, max_class = dict(), list(), None, None
    #--------------------------------------------------------------------------
    for i in range(len(distance)):
        tag = distance[i][1]
        votes[tag] = votes.get(tag, 0) + 1
        temp.append(tag)
    #--------------------------------------------------------------------------
    # Finding the class with maximum votes.
    for key, value in votes.items():
        # Found a new maximum.
        if not max_count or value > max_count:
            max_class, max_count = key, value
        # Same votes. Choosing the one with shorter distance.
        elif value == max_count:
            # This key was ahead in the distance queue.
            if temp.index(key) < temp.index(max_class):
                max_class, max_count = key, value
    #--------------------------------------------------------------------------
    return max_class
#==============================================================================

def getTag(sample, x, y, l2 = True, k = 1, leaveOneOut = True):
    distance = list()
    #--------------------------------------------------------------------------
    if l2:
        for i, row in enumerate(x):
            # If sample and row are same, for training data we ignore it.
            if leaveOneOut and np.array_equal(sample, row): continue
            distance.append((getEuclideanDistance(sample, row), y[i]))
    else:
        for i, row in enumerate(x):
            # If sample and row are same, for training data we ignore it.
            if leaveOneOut and np.array_equal(sample, row): continue
            distance.append((getManhattanDistance(sample, row), y[i]))
    #--------------------------------------------------------------------------
    # Sorting the distance to get the closest points.
    distance.sort()
    tag = countVotes(distance[:k])
    return tag
#==============================================================================

def computeAccuracy(x1, x2, y1, y2, l2, k, leaveOneOut = True):
    result = list()
    for i, sample in enumerate(x1):
        myTag  = y1[i]
        newTag = getTag(sample, x2, y2, l2, k, leaveOneOut)
        if myTag == newTag:
            result.append(1)
        else:
            result.append(0)
    return float(sum(result))/len(result)
#==============================================================================

'''
For training data flag is True.
x1 will generate sample[train/test] will be compared with train : x2.
y corresponds to correct tag of x1.
'''
def getAccuracy(x1, x2, y1, y2, flag = True):
    neighbours = [1, 3, 5, 7]
    distance   = [False, True]
    # Leave one out flag ON while calculating Training Accuracy
    for k in neighbours:
        for L in distance:
            if flag:
                accuracy = computeAccuracy(x1, x2, y1, y2, L, k, True)
            else:
                accuracy = computeAccuracy(x1, x2, y1, y2, L, k, False)
            if L:
                print 'k = %d, \t L = L2 = %f' % (k, accuracy)
            else:
                print 'k = %d, \t L = L1 = %f' % (k, accuracy)
#==============================================================================
trainFName, testFName = getFiles()
if not trainFName or not testFName:
    print 'Please enter training file and test file.'
    exit(0)
'''
z = np.array([[0.363278395, -0.213046192]])
print getTag(z, x, y, True, 1, False)
'''
x1, y1, mean1, std1 = getData(trainFName)
# Standardizing the training data with its mean and std.
x1 = (x1 - mean1) / std1
# Training.
print '----------------------------------------------------'
print 'Training Accuracy:'
getAccuracy(x1, x1, y1, y1, True)
print '----------------------------------------------------'
x2, y2, mean2, std2 = getData(testFName)
# Standardizing the test data with mean and std from training data.
x2 = (x2 - mean1) / std1
# Testing.
print
print '----------------------------------------------------'
print 'Test Accuracy:'
getAccuracy(x2, x1, y2, y1, False)
print '----------------------------------------------------'
#==============================================================================
