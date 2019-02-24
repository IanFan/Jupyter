
# coding: utf-8

# In[1]:


import os
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from PIL import Image
import tensorflow as tf


# In[2]:


dir_data = './data'

words_path = os.path.join(dir_data, 'words.csv')
fonts_pos_path = os.path.join(dir_data, 'fonts_pos.csv')


# In[3]:


'''
pic_names = []
with open('chinese_fonts.txt', 'r') as f: 
    data = f.readlines()
    for str in data:
        str = str.replace('\n','')
        pic_names.append(str)

df = pd.DataFrame({'Fonts':pic_names})
df.to_csv('Fonts.csv')
df
print(len(df))
print(df.head())

print(df.iloc[5])
'''

df_words = pd.read_csv(words_path)
print(len(df_words))
print(df_words.head())
print(df_words.tail())
print(df_words.iloc[[3], [1]])

pd_fonts = pd.read_csv(fonts_pos_path)
print(len(pd_fonts))
print(pd_fonts.head())

fonts = pd_fonts['Fonts'].values
pics = df_words['Pics'].values
words = df_words['Words'].values


# In[4]:


'''
x_datas = []
for i in range(len(fonts)):
    x_data = []
    dir_font = './data/training_data/positive_data/'+fonts[i]+'/'
    for j in range(len(words)):
        im = Image.open(dir_font + pics[j])
        im = np.array(im) #convert to an array
        im2 = (im/255).astype(float) #normalise input
        x_data.append(im)
    x_datas.append(x_data)    
x_datas = np.array(x_datas).reshape(len(fonts), -1, 64*64)
np.save('data/x_datas.npy', x_datas)
'''
x_datas = np.load('data/x_datas.npy')
print(x_datas.shape)

'''
y_data = np.zeros([len(df_words), len(df_words)])
for i in range(len(df_words)):
    y_data[i, i] = 1
np.save('data/y_data.npy', y_data)
'''
y_data = np.load('data/y_data.npy')
print(y_data.shape)
print(y_data)


# In[6]:


x = tf.placeholder(tf.float32, [None, 64*64])
x_img = tf.reshape(x, [-1, 64, 64, 1])
y = tf.placeholder(tf.float32, [None, len(df_words)])
keep_prob = tf.placeholder(tf.float32)

conv1 = tf.layers.conv2d(x_img, filters=64, kernel_size=3, strides=1, padding='SAME', activation=tf.nn.relu)
pool1 = tf.layers.max_pooling2d(conv1, pool_size=2, strides=2)
dropout1 = tf.nn.dropout(pool1, keep_prob=keep_prob)

conv2 = tf.layers.conv2d(dropout1, filters=128, kernel_size=3, strides=1, padding='SAME', activation=tf.nn.relu)
pool2 = tf.layers.max_pooling2d(conv2, pool_size=2, strides=2)
dropout2 = tf.nn.dropout(pool2, keep_prob=keep_prob)

conv3 = tf.layers.conv2d(dropout2, filters=256, kernel_size=3, strides=1, padding='SAME', activation=tf.nn.relu)
pool3 = tf.layers.max_pooling2d(conv3, pool_size=2, strides=2)
dropout3 = tf.nn.dropout(pool3, keep_prob=keep_prob)

conv4 = tf.layers.conv2d(dropout3, filters=512, kernel_size=3, strides=1, padding='SAME', activation=tf.nn.relu)
# conv5 = tf.layers.conv2d(conv4, filters=1024, kernel_size=3, strides=1, padding='SAME', activation=tf.nn.relu)
# conv6 = tf.layers.conv2d(conv5, filters=1024, kernel_size=3, strides=1, padding='SAME', activation=tf.nn.relu)
# conv7 = tf.layers.conv2d(conv6, filters=1024, kernel_size=3, strides=1, padding='SAME', activation=tf.nn.relu)
pool4 = tf.layers.max_pooling2d(conv4, pool_size=2, strides=2)
dropout4 = tf.nn.dropout(pool4, keep_prob=keep_prob)

flat = tf.reshape(dropout4, [-1, 4*4*512])
# flat = tf.reshape(dropout2, [-1, 16*16*256])
hypothesis = tf.layers.dense(flat, len(df_words))
cost = tf.reduce_mean(tf.nn.softmax_cross_entropy_with_logits_v2(logits=hypothesis, labels=y))
# hypothesis = tf.nn.softmax(tf.matmul(flat, w_fc) + b_fc)
# cost = tf.reduce_mean(-tf.reduce_sum(y*tf.log(hypothesis), axis=1))

train = tf.train.AdamOptimizer(learning_rate=0.005).minimize(cost)

def accuracy():
    predict = tf.equal(tf.argmax(hypothesis, 1), tf.argmax(y, 1))
    accuracy = tf.reduce_mean(tf.cast(predict, tf.float32))
    # x_test = mnist.test.images
    # y_test = mnist.test.labels
    x_test = x_datas[len(pd_fonts)-1]
    x_test = x_test[:100]
    y_test = y_data
    y_test = y_test[:100]
    # print('x_test', x_test.shape)
    # print('y_test', y_test.shape)
    test_c, test_a = sess.run([cost, accuracy], feed_dict={x: x_test, y: y_test, keep_prob: 1.0})
    print('test cost: %.9f'%test_c, "accuracy: %.9f"%test_a)

sess = tf.Session()
sess.run(tf.global_variables_initializer())

os.system('rm -rf ./logs')
writer = tf.summary.FileWriter("./logs")
writer.add_graph(sess.graph)
cost_sum = tf.summary.scalar("cost", cost)
summary = tf.summary.merge_all()

training_epochs = 10
global_step = 0
print("Learning stared. It takes sometime.")
for epoch in range(training_epochs):
    total_batch = len(pd_fonts)-1
    avg_cost = 0
    for batch in range(total_batch):
        x_train = np.array(x_datas[batch], copy=True)
        x_train = x_train[:100]
        y_train = np.array(y_data, copy=True)
        y_train = y_train[:100]
        
        # permutation = np.random.permutation(x_train.shape[0])
        # x_train = x_train[permutation]
        # y_train = y_train[permutation]
        # print(x_train.shape)
        # print(y_train.shape)
        
        s, c, _ = sess.run([summary, cost, train], feed_dict={x:x_train, y:y_train, keep_prob:0.9})
        avg_cost += c/total_batch
        writer.add_summary(s, global_step=global_step)
        global_step += 1
        accuracy()
    print("epoch %2d" % epoch, "avg_cost %.9f" % avg_cost)
    accuracy()
print("Learning Finished!")
    
# training_epochs = 2
# batch_size = 100
# global_step = 0
# print("Learning stared. It takes sometime.")
# for epoch in range(training_epochs):
#     total_batch = int(mnist.train.num_examples/batch_size)
#     avg_cost = 0
#     for batch in range(total_batch):
#         x_train_batch, y_train_batch = mnist.train.next_batch(batch_size)
#         s, c, _ = sess.run([summary, cost, train], feed_dict={x:x_train_batch, y:y_train_batch, keep_prob:0.7})
#         avg_cost += c/total_batch
#         writer.add_summary(s, global_step=global_step)
#         global_step += 1
#     print("epoch %2d" % epoch, "avg_cost %.9f" % avg_cost)
#     accuracy()
# print("Learning Finished!")

sess.close()

