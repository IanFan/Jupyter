node {
  name: "Placeholder"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 100
        }
        dim {
          size: 1
        }
      }
    }
  }
}
node {
  name: "Placeholder_1"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 100
        }
        dim {
          size: 1
        }
      }
    }
  }
}
node {
  name: "dense/kernel/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\n\000\000\000"
      }
    }
  }
}
node {
  name: "dense/kernel/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.7385489344596863
      }
    }
  }
}
node {
  name: "dense/kernel/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.7385489344596863
      }
    }
  }
}
node {
  name: "dense/kernel/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "dense/kernel/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 1
    }
  }
  attr {
    key: "seed2"
    value {
      i: 5
    }
  }
}
node {
  name: "dense/kernel/Initializer/random_uniform/sub"
  op: "Sub"
  input: "dense/kernel/Initializer/random_uniform/max"
  input: "dense/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense/kernel"
      }
    }
  }
}
node {
  name: "dense/kernel/Initializer/random_uniform/mul"
  op: "Mul"
  input: "dense/kernel/Initializer/random_uniform/RandomUniform"
  input: "dense/kernel/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense/kernel"
      }
    }
  }
}
node {
  name: "dense/kernel/Initializer/random_uniform"
  op: "Add"
  input: "dense/kernel/Initializer/random_uniform/mul"
  input: "dense/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense/kernel"
      }
    }
  }
}
node {
  name: "dense/kernel"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 10
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "dense/kernel/Assign"
  op: "Assign"
  input: "dense/kernel"
  input: "dense/kernel/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "dense/kernel/read"
  op: "Identity"
  input: "dense/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense/kernel"
      }
    }
  }
}
node {
  name: "dense/bias/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 10
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "dense/bias"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 10
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "dense/bias/Assign"
  op: "Assign"
  input: "dense/bias"
  input: "dense/bias/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "dense/bias/read"
  op: "Identity"
  input: "dense/bias"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense/bias"
      }
    }
  }
}
node {
  name: "dense/MatMul"
  op: "MatMul"
  input: "Placeholder"
  input: "dense/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "dense/BiasAdd"
  op: "BiasAdd"
  input: "dense/MatMul"
  input: "dense/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "dense/Relu"
  op: "Relu"
  input: "dense/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dense_1/kernel/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\n\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "dense_1/kernel/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.7385489344596863
      }
    }
  }
}
node {
  name: "dense_1/kernel/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.7385489344596863
      }
    }
  }
}
node {
  name: "dense_1/kernel/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "dense_1/kernel/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 1
    }
  }
  attr {
    key: "seed2"
    value {
      i: 22
    }
  }
}
node {
  name: "dense_1/kernel/Initializer/random_uniform/sub"
  op: "Sub"
  input: "dense_1/kernel/Initializer/random_uniform/max"
  input: "dense_1/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1/kernel"
      }
    }
  }
}
node {
  name: "dense_1/kernel/Initializer/random_uniform/mul"
  op: "Mul"
  input: "dense_1/kernel/Initializer/random_uniform/RandomUniform"
  input: "dense_1/kernel/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1/kernel"
      }
    }
  }
}
node {
  name: "dense_1/kernel/Initializer/random_uniform"
  op: "Add"
  input: "dense_1/kernel/Initializer/random_uniform/mul"
  input: "dense_1/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1/kernel"
      }
    }
  }
}
node {
  name: "dense_1/kernel"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 10
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "dense_1/kernel/Assign"
  op: "Assign"
  input: "dense_1/kernel"
  input: "dense_1/kernel/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "dense_1/kernel/read"
  op: "Identity"
  input: "dense_1/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1/kernel"
      }
    }
  }
}
node {
  name: "dense_1/bias/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 1
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "dense_1/bias"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "dense_1/bias/Assign"
  op: "Assign"
  input: "dense_1/bias"
  input: "dense_1/bias/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "dense_1/bias/read"
  op: "Identity"
  input: "dense_1/bias"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1/bias"
      }
    }
  }
}
node {
  name: "dense_1/MatMul"
  op: "MatMul"
  input: "dense/Relu"
  input: "dense_1/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "dense_1/BiasAdd"
  op: "BiasAdd"
  input: "dense_1/MatMul"
  input: "dense_1/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "mean_squared_error/SquaredDifference"
  op: "SquaredDifference"
  input: "dense_1/BiasAdd"
  input: "Placeholder_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "mean_squared_error/assert_broadcastable/weights"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "mean_squared_error/assert_broadcastable/weights/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "mean_squared_error/assert_broadcastable/weights/rank"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "mean_squared_error/assert_broadcastable/values/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "d\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "mean_squared_error/assert_broadcastable/values/rank"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "mean_squared_error/assert_broadcastable/static_scalar_check_success"
  op: "NoOp"
}
node {
  name: "mean_squared_error/Cast/x"
  op: "Const"
  input: "^mean_squared_error/assert_broadcastable/static_scalar_check_success"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "mean_squared_error/Mul"
  op: "Mul"
  input: "mean_squared_error/SquaredDifference"
  input: "mean_squared_error/Cast/x"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "mean_squared_error/Const"
  op: "Const"
  input: "^mean_squared_error/assert_broadcastable/static_scalar_check_success"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\000\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "mean_squared_error/Sum"
  op: "Sum"
  input: "mean_squared_error/Mul"
  input: "mean_squared_error/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "mean_squared_error/num_present/Equal/y"
  op: "Const"
  input: "^mean_squared_error/assert_broadcastable/static_scalar_check_success"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "mean_squared_error/num_present/Equal"
  op: "Equal"
  input: "mean_squared_error/Cast/x"
  input: "mean_squared_error/num_present/Equal/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "mean_squared_error/num_present/zeros_like"
  op: "Const"
  input: "^mean_squared_error/assert_broadcastable/static_scalar_check_success"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "mean_squared_error/num_present/ones_like/Shape"
  op: "Const"
  input: "^mean_squared_error/assert_broadcastable/static_scalar_check_success"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "mean_squared_error/num_present/ones_like/Const"
  op: "Const"
  input: "^mean_squared_error/assert_broadcastable/static_scalar_check_success"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "mean_squared_error/num_present/ones_like"
  op: "Fill"
  input: "mean_squared_error/num_present/ones_like/Shape"
  input: "mean_squared_error/num_present/ones_like/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "mean_squared_error/num_present/Select"
  op: "Select"
  input: "mean_squared_error/num_present/Equal"
  input: "mean_squared_error/num_present/zeros_like"
  input: "mean_squared_error/num_present/ones_like"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "mean_squared_error/num_present/broadcast_weights/assert_broadcastable/weights/shape"
  op: "Const"
  input: "^mean_squared_error/assert_broadcastable/static_scalar_check_success"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "mean_squared_error/num_present/broadcast_weights/assert_broadcastable/weights/rank"
  op: "Const"
  input: "^mean_squared_error/assert_broadcastable/static_scalar_check_success"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "mean_squared_error/num_present/broadcast_weights/assert_broadcastable/values/shape"
  op: "Const"
  input: "^mean_squared_error/assert_broadcastable/static_scalar_check_success"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "d\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "mean_squared_error/num_present/broadcast_weights/assert_broadcastable/values/rank"
  op: "Const"
  input: "^mean_squared_error/assert_broadcastable/static_scalar_check_success"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "mean_squared_error/num_present/broadcast_weights/assert_broadcastable/static_scalar_check_success"
  op: "NoOp"
  input: "^mean_squared_error/assert_broadcastable/static_scalar_check_success"
}
node {
  name: "mean_squared_error/num_present/broadcast_weights/ones_like/Shape"
  op: "Const"
  input: "^mean_squared_error/assert_broadcastable/static_scalar_check_success"
  input: "^mean_squared_error/num_present/broadcast_weights/assert_broadcastable/static_scalar_check_success"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "d\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "mean_squared_error/num_present/broadcast_weights/ones_like/Const"
  op: "Const"
  input: "^mean_squared_error/assert_broadcastable/static_scalar_check_success"
  input: "^mean_squared_error/num_present/broadcast_weights/assert_broadcastable/static_scalar_check_success"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "mean_squared_error/num_present/broadcast_weights/ones_like"
  op: "Fill"
  input: "mean_squared_error/num_present/broadcast_weights/ones_like/Shape"
  input: "mean_squared_error/num_present/broadcast_weights/ones_like/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "mean_squared_error/num_present/broadcast_weights"
  op: "Mul"
  input: "mean_squared_error/num_present/Select"
  input: "mean_squared_error/num_present/broadcast_weights/ones_like"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "mean_squared_error/num_present/Const"
  op: "Const"
  input: "^mean_squared_error/assert_broadcastable/static_scalar_check_success"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\000\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "mean_squared_error/num_present"
  op: "Sum"
  input: "mean_squared_error/num_present/broadcast_weights"
  input: "mean_squared_error/num_present/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "mean_squared_error/Const_1"
  op: "Const"
  input: "^mean_squared_error/assert_broadcastable/static_scalar_check_success"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "mean_squared_error/Sum_1"
  op: "Sum"
  input: "mean_squared_error/Sum"
  input: "mean_squared_error/Const_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "mean_squared_error/value"
  op: "DivNoNan"
  input: "mean_squared_error/Sum_1"
  input: "mean_squared_error/num_present"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients/grad_ys_0"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "gradients/Fill"
  op: "Fill"
  input: "gradients/Shape"
  input: "gradients/grad_ys_0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mean_squared_error/value_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients/mean_squared_error/value_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients/mean_squared_error/value_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/mean_squared_error/value_grad/Shape"
  input: "gradients/mean_squared_error/value_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mean_squared_error/value_grad/div_no_nan"
  op: "DivNoNan"
  input: "gradients/Fill"
  input: "mean_squared_error/num_present"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mean_squared_error/value_grad/Sum"
  op: "Sum"
  input: "gradients/mean_squared_error/value_grad/div_no_nan"
  input: "gradients/mean_squared_error/value_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/mean_squared_error/value_grad/Reshape"
  op: "Reshape"
  input: "gradients/mean_squared_error/value_grad/Sum"
  input: "gradients/mean_squared_error/value_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mean_squared_error/value_grad/Neg"
  op: "Neg"
  input: "mean_squared_error/Sum_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mean_squared_error/value_grad/div_no_nan_1"
  op: "DivNoNan"
  input: "gradients/mean_squared_error/value_grad/Neg"
  input: "mean_squared_error/num_present"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mean_squared_error/value_grad/div_no_nan_2"
  op: "DivNoNan"
  input: "gradients/mean_squared_error/value_grad/div_no_nan_1"
  input: "mean_squared_error/num_present"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mean_squared_error/value_grad/mul"
  op: "Mul"
  input: "gradients/Fill"
  input: "gradients/mean_squared_error/value_grad/div_no_nan_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mean_squared_error/value_grad/Sum_1"
  op: "Sum"
  input: "gradients/mean_squared_error/value_grad/mul"
  input: "gradients/mean_squared_error/value_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/mean_squared_error/value_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/mean_squared_error/value_grad/Sum_1"
  input: "gradients/mean_squared_error/value_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mean_squared_error/value_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/mean_squared_error/value_grad/Reshape"
  input: "^gradients/mean_squared_error/value_grad/Reshape_1"
}
node {
  name: "gradients/mean_squared_error/value_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/mean_squared_error/value_grad/Reshape"
  input: "^gradients/mean_squared_error/value_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mean_squared_error/value_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/mean_squared_error/value_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/mean_squared_error/value_grad/Reshape_1"
  input: "^gradients/mean_squared_error/value_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mean_squared_error/value_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/mean_squared_error/Sum_1_grad/Reshape/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients/mean_squared_error/Sum_1_grad/Reshape"
  op: "Reshape"
  input: "gradients/mean_squared_error/value_grad/tuple/control_dependency"
  input: "gradients/mean_squared_error/Sum_1_grad/Reshape/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mean_squared_error/Sum_1_grad/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients/mean_squared_error/Sum_1_grad/Tile"
  op: "Tile"
  input: "gradients/mean_squared_error/Sum_1_grad/Reshape"
  input: "gradients/mean_squared_error/Sum_1_grad/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tmultiples"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mean_squared_error/Sum_grad/Reshape/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/mean_squared_error/Sum_grad/Reshape"
  op: "Reshape"
  input: "gradients/mean_squared_error/Sum_1_grad/Tile"
  input: "gradients/mean_squared_error/Sum_grad/Reshape/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mean_squared_error/Sum_grad/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "d\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/mean_squared_error/Sum_grad/Tile"
  op: "Tile"
  input: "gradients/mean_squared_error/Sum_grad/Reshape"
  input: "gradients/mean_squared_error/Sum_grad/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tmultiples"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mean_squared_error/Mul_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "d\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/mean_squared_error/Mul_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients/mean_squared_error/Mul_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/mean_squared_error/Mul_grad/Shape"
  input: "gradients/mean_squared_error/Mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mean_squared_error/Mul_grad/Mul"
  op: "Mul"
  input: "gradients/mean_squared_error/Sum_grad/Tile"
  input: "mean_squared_error/Cast/x"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mean_squared_error/Mul_grad/Sum"
  op: "Sum"
  input: "gradients/mean_squared_error/Mul_grad/Mul"
  input: "gradients/mean_squared_error/Mul_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/mean_squared_error/Mul_grad/Reshape"
  op: "Reshape"
  input: "gradients/mean_squared_error/Mul_grad/Sum"
  input: "gradients/mean_squared_error/Mul_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mean_squared_error/Mul_grad/Mul_1"
  op: "Mul"
  input: "mean_squared_error/SquaredDifference"
  input: "gradients/mean_squared_error/Sum_grad/Tile"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mean_squared_error/Mul_grad/Sum_1"
  op: "Sum"
  input: "gradients/mean_squared_error/Mul_grad/Mul_1"
  input: "gradients/mean_squared_error/Mul_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/mean_squared_error/Mul_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/mean_squared_error/Mul_grad/Sum_1"
  input: "gradients/mean_squared_error/Mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mean_squared_error/Mul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/mean_squared_error/Mul_grad/Reshape"
  input: "^gradients/mean_squared_error/Mul_grad/Reshape_1"
}
node {
  name: "gradients/mean_squared_error/Mul_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/mean_squared_error/Mul_grad/Reshape"
  input: "^gradients/mean_squared_error/Mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mean_squared_error/Mul_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/mean_squared_error/Mul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/mean_squared_error/Mul_grad/Reshape_1"
  input: "^gradients/mean_squared_error/Mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mean_squared_error/Mul_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/mean_squared_error/SquaredDifference_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "d\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/mean_squared_error/SquaredDifference_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "d\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/mean_squared_error/SquaredDifference_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/mean_squared_error/SquaredDifference_grad/Shape"
  input: "gradients/mean_squared_error/SquaredDifference_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mean_squared_error/SquaredDifference_grad/scalar"
  op: "Const"
  input: "^gradients/mean_squared_error/Mul_grad/tuple/control_dependency"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 2.0
      }
    }
  }
}
node {
  name: "gradients/mean_squared_error/SquaredDifference_grad/Mul"
  op: "Mul"
  input: "gradients/mean_squared_error/SquaredDifference_grad/scalar"
  input: "gradients/mean_squared_error/Mul_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mean_squared_error/SquaredDifference_grad/sub"
  op: "Sub"
  input: "dense_1/BiasAdd"
  input: "Placeholder_1"
  input: "^gradients/mean_squared_error/Mul_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mean_squared_error/SquaredDifference_grad/mul_1"
  op: "Mul"
  input: "gradients/mean_squared_error/SquaredDifference_grad/Mul"
  input: "gradients/mean_squared_error/SquaredDifference_grad/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mean_squared_error/SquaredDifference_grad/Sum"
  op: "Sum"
  input: "gradients/mean_squared_error/SquaredDifference_grad/mul_1"
  input: "gradients/mean_squared_error/SquaredDifference_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/mean_squared_error/SquaredDifference_grad/Reshape"
  op: "Reshape"
  input: "gradients/mean_squared_error/SquaredDifference_grad/Sum"
  input: "gradients/mean_squared_error/SquaredDifference_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mean_squared_error/SquaredDifference_grad/Sum_1"
  op: "Sum"
  input: "gradients/mean_squared_error/SquaredDifference_grad/mul_1"
  input: "gradients/mean_squared_error/SquaredDifference_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/mean_squared_error/SquaredDifference_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/mean_squared_error/SquaredDifference_grad/Sum_1"
  input: "gradients/mean_squared_error/SquaredDifference_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mean_squared_error/SquaredDifference_grad/Neg"
  op: "Neg"
  input: "gradients/mean_squared_error/SquaredDifference_grad/Reshape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mean_squared_error/SquaredDifference_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/mean_squared_error/SquaredDifference_grad/Neg"
  input: "^gradients/mean_squared_error/SquaredDifference_grad/Reshape"
}
node {
  name: "gradients/mean_squared_error/SquaredDifference_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/mean_squared_error/SquaredDifference_grad/Reshape"
  input: "^gradients/mean_squared_error/SquaredDifference_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mean_squared_error/SquaredDifference_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/mean_squared_error/SquaredDifference_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/mean_squared_error/SquaredDifference_grad/Neg"
  input: "^gradients/mean_squared_error/SquaredDifference_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mean_squared_error/SquaredDifference_grad/Neg"
      }
    }
  }
}
node {
  name: "gradients/dense_1/BiasAdd_grad/BiasAddGrad"
  op: "BiasAddGrad"
  input: "gradients/mean_squared_error/SquaredDifference_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "gradients/dense_1/BiasAdd_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/dense_1/BiasAdd_grad/BiasAddGrad"
  input: "^gradients/mean_squared_error/SquaredDifference_grad/tuple/control_dependency"
}
node {
  name: "gradients/dense_1/BiasAdd_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/mean_squared_error/SquaredDifference_grad/tuple/control_dependency"
  input: "^gradients/dense_1/BiasAdd_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mean_squared_error/SquaredDifference_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/dense_1/BiasAdd_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/dense_1/BiasAdd_grad/BiasAddGrad"
  input: "^gradients/dense_1/BiasAdd_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dense_1/BiasAdd_grad/BiasAddGrad"
      }
    }
  }
}
node {
  name: "gradients/dense_1/MatMul_grad/MatMul"
  op: "MatMul"
  input: "gradients/dense_1/BiasAdd_grad/tuple/control_dependency"
  input: "dense_1/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/dense_1/MatMul_grad/MatMul_1"
  op: "MatMul"
  input: "dense/Relu"
  input: "gradients/dense_1/BiasAdd_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: true
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dense_1/MatMul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/dense_1/MatMul_grad/MatMul"
  input: "^gradients/dense_1/MatMul_grad/MatMul_1"
}
node {
  name: "gradients/dense_1/MatMul_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/dense_1/MatMul_grad/MatMul"
  input: "^gradients/dense_1/MatMul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dense_1/MatMul_grad/MatMul"
      }
    }
  }
}
node {
  name: "gradients/dense_1/MatMul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/dense_1/MatMul_grad/MatMul_1"
  input: "^gradients/dense_1/MatMul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dense_1/MatMul_grad/MatMul_1"
      }
    }
  }
}
node {
  name: "gradients/dense/Relu_grad/ReluGrad"
  op: "ReluGrad"
  input: "gradients/dense_1/MatMul_grad/tuple/control_dependency"
  input: "dense/Relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/dense/BiasAdd_grad/BiasAddGrad"
  op: "BiasAddGrad"
  input: "gradients/dense/Relu_grad/ReluGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "gradients/dense/BiasAdd_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/dense/BiasAdd_grad/BiasAddGrad"
  input: "^gradients/dense/Relu_grad/ReluGrad"
}
node {
  name: "gradients/dense/BiasAdd_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/dense/Relu_grad/ReluGrad"
  input: "^gradients/dense/BiasAdd_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dense/Relu_grad/ReluGrad"
      }
    }
  }
}
node {
  name: "gradients/dense/BiasAdd_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/dense/BiasAdd_grad/BiasAddGrad"
  input: "^gradients/dense/BiasAdd_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dense/BiasAdd_grad/BiasAddGrad"
      }
    }
  }
}
node {
  name: "gradients/dense/MatMul_grad/MatMul"
  op: "MatMul"
  input: "gradients/dense/BiasAdd_grad/tuple/control_dependency"
  input: "dense/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/dense/MatMul_grad/MatMul_1"
  op: "MatMul"
  input: "Placeholder"
  input: "gradients/dense/BiasAdd_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: true
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dense/MatMul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/dense/MatMul_grad/MatMul"
  input: "^gradients/dense/MatMul_grad/MatMul_1"
}
node {
  name: "gradients/dense/MatMul_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/dense/MatMul_grad/MatMul"
  input: "^gradients/dense/MatMul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dense/MatMul_grad/MatMul"
      }
    }
  }
}
node {
  name: "gradients/dense/MatMul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/dense/MatMul_grad/MatMul_1"
  input: "^gradients/dense/MatMul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dense/MatMul_grad/MatMul_1"
      }
    }
  }
}
node {
  name: "GradientDescent/learning_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.5
      }
    }
  }
}
node {
  name: "GradientDescent/update_dense/kernel/ApplyGradientDescent"
  op: "ApplyGradientDescent"
  input: "dense/kernel"
  input: "GradientDescent/learning_rate"
  input: "gradients/dense/MatMul_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "GradientDescent/update_dense/bias/ApplyGradientDescent"
  op: "ApplyGradientDescent"
  input: "dense/bias"
  input: "GradientDescent/learning_rate"
  input: "gradients/dense/BiasAdd_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "GradientDescent/update_dense_1/kernel/ApplyGradientDescent"
  op: "ApplyGradientDescent"
  input: "dense_1/kernel"
  input: "GradientDescent/learning_rate"
  input: "gradients/dense_1/MatMul_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "GradientDescent/update_dense_1/bias/ApplyGradientDescent"
  op: "ApplyGradientDescent"
  input: "dense_1/bias"
  input: "GradientDescent/learning_rate"
  input: "gradients/dense_1/BiasAdd_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "GradientDescent"
  op: "NoOp"
  input: "^GradientDescent/update_dense/bias/ApplyGradientDescent"
  input: "^GradientDescent/update_dense/kernel/ApplyGradientDescent"
  input: "^GradientDescent/update_dense_1/bias/ApplyGradientDescent"
  input: "^GradientDescent/update_dense_1/kernel/ApplyGradientDescent"
}
node {
  name: "init"
  op: "NoOp"
  input: "^dense/bias/Assign"
  input: "^dense/kernel/Assign"
  input: "^dense_1/bias/Assign"
  input: "^dense_1/kernel/Assign"
}
node {
  name: "save/filename/input"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "model"
      }
    }
  }
}
node {
  name: "save/filename"
  op: "PlaceholderWithDefault"
  input: "save/filename/input"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
}
node {
  name: "save/Const"
  op: "PlaceholderWithDefault"
  input: "save/filename"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
}
node {
  name: "save/SaveV2/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 4
          }
        }
        string_val: "dense/bias"
        string_val: "dense/kernel"
        string_val: "dense_1/bias"
        string_val: "dense_1/kernel"
      }
    }
  }
}
node {
  name: "save/SaveV2/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 4
          }
        }
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
      }
    }
  }
}
node {
  name: "save/SaveV2"
  op: "SaveV2"
  input: "save/Const"
  input: "save/SaveV2/tensor_names"
  input: "save/SaveV2/shape_and_slices"
  input: "dense/bias"
  input: "dense/kernel"
  input: "dense_1/bias"
  input: "dense_1/kernel"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/control_dependency"
  op: "Identity"
  input: "save/Const"
  input: "^save/SaveV2"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@save/Const"
      }
    }
  }
}
node {
  name: "save/RestoreV2/tensor_names"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 4
          }
        }
        string_val: "dense/bias"
        string_val: "dense/kernel"
        string_val: "dense_1/bias"
        string_val: "dense_1/kernel"
      }
    }
  }
}
node {
  name: "save/RestoreV2/shape_and_slices"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 4
          }
        }
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2/tensor_names"
  input: "save/RestoreV2/shape_and_slices"
  device: "/device:CPU:0"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign"
  op: "Assign"
  input: "dense/bias"
  input: "save/RestoreV2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_1"
  op: "Assign"
  input: "dense/kernel"
  input: "save/RestoreV2:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_2"
  op: "Assign"
  input: "dense_1/bias"
  input: "save/RestoreV2:2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_3"
  op: "Assign"
  input: "dense_1/kernel"
  input: "save/RestoreV2:3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/restore_all"
  op: "NoOp"
  input: "^save/Assign"
  input: "^save/Assign_1"
  input: "^save/Assign_2"
  input: "^save/Assign_3"
}
node {
  name: "Placeholder_2"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 100
        }
        dim {
          size: 1
        }
      }
    }
  }
}
node {
  name: "Placeholder_3"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 100
        }
        dim {
          size: 1
        }
      }
    }
  }
}
node {
  name: "dense_2/kernel/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\n\000\000\000"
      }
    }
  }
}
node {
  name: "dense_2/kernel/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.7385489344596863
      }
    }
  }
}
node {
  name: "dense_2/kernel/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.7385489344596863
      }
    }
  }
}
node {
  name: "dense_2/kernel/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "dense_2/kernel/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 1
    }
  }
  attr {
    key: "seed2"
    value {
      i: 166
    }
  }
}
node {
  name: "dense_2/kernel/Initializer/random_uniform/sub"
  op: "Sub"
  input: "dense_2/kernel/Initializer/random_uniform/max"
  input: "dense_2/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2/kernel"
      }
    }
  }
}
node {
  name: "dense_2/kernel/Initializer/random_uniform/mul"
  op: "Mul"
  input: "dense_2/kernel/Initializer/random_uniform/RandomUniform"
  input: "dense_2/kernel/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2/kernel"
      }
    }
  }
}
node {
  name: "dense_2/kernel/Initializer/random_uniform"
  op: "Add"
  input: "dense_2/kernel/Initializer/random_uniform/mul"
  input: "dense_2/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2/kernel"
      }
    }
  }
}
node {
  name: "dense_2/kernel"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 10
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "dense_2/kernel/Assign"
  op: "Assign"
  input: "dense_2/kernel"
  input: "dense_2/kernel/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "dense_2/kernel/read"
  op: "Identity"
  input: "dense_2/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2/kernel"
      }
    }
  }
}
node {
  name: "dense_2/bias/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 10
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "dense_2/bias"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 10
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "dense_2/bias/Assign"
  op: "Assign"
  input: "dense_2/bias"
  input: "dense_2/bias/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "dense_2/bias/read"
  op: "Identity"
  input: "dense_2/bias"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2/bias"
      }
    }
  }
}
node {
  name: "dense_2/MatMul"
  op: "MatMul"
  input: "Placeholder_2"
  input: "dense_2/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "dense_2/BiasAdd"
  op: "BiasAdd"
  input: "dense_2/MatMul"
  input: "dense_2/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "dense_2/Relu"
  op: "Relu"
  input: "dense_2/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dense_3/kernel/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_3/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\n\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "dense_3/kernel/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_3/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.7385489344596863
      }
    }
  }
}
node {
  name: "dense_3/kernel/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_3/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.7385489344596863
      }
    }
  }
}
node {
  name: "dense_3/kernel/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "dense_3/kernel/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_3/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 1
    }
  }
  attr {
    key: "seed2"
    value {
      i: 183
    }
  }
}
node {
  name: "dense_3/kernel/Initializer/random_uniform/sub"
  op: "Sub"
  input: "dense_3/kernel/Initializer/random_uniform/max"
  input: "dense_3/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_3/kernel"
      }
    }
  }
}
node {
  name: "dense_3/kernel/Initializer/random_uniform/mul"
  op: "Mul"
  input: "dense_3/kernel/Initializer/random_uniform/RandomUniform"
  input: "dense_3/kernel/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_3/kernel"
      }
    }
  }
}
node {
  name: "dense_3/kernel/Initializer/random_uniform"
  op: "Add"
  input: "dense_3/kernel/Initializer/random_uniform/mul"
  input: "dense_3/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_3/kernel"
      }
    }
  }
}
node {
  name: "dense_3/kernel"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_3/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 10
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "dense_3/kernel/Assign"
  op: "Assign"
  input: "dense_3/kernel"
  input: "dense_3/kernel/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_3/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "dense_3/kernel/read"
  op: "Identity"
  input: "dense_3/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_3/kernel"
      }
    }
  }
}
node {
  name: "dense_3/bias/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_3/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 1
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "dense_3/bias"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_3/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "dense_3/bias/Assign"
  op: "Assign"
  input: "dense_3/bias"
  input: "dense_3/bias/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_3/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "dense_3/bias/read"
  op: "Identity"
  input: "dense_3/bias"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_3/bias"
      }
    }
  }
}
node {
  name: "dense_3/MatMul"
  op: "MatMul"
  input: "dense_2/Relu"
  input: "dense_3/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "dense_3/BiasAdd"
  op: "BiasAdd"
  input: "dense_3/MatMul"
  input: "dense_3/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "mean_squared_error_1/SquaredDifference"
  op: "SquaredDifference"
  input: "dense_3/BiasAdd"
  input: "Placeholder_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "mean_squared_error_1/assert_broadcastable/weights"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "mean_squared_error_1/assert_broadcastable/weights/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "mean_squared_error_1/assert_broadcastable/weights/rank"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "mean_squared_error_1/assert_broadcastable/values/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "d\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "mean_squared_error_1/assert_broadcastable/values/rank"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "mean_squared_error_1/assert_broadcastable/static_scalar_check_success"
  op: "NoOp"
}
node {
  name: "mean_squared_error_1/Cast/x"
  op: "Const"
  input: "^mean_squared_error_1/assert_broadcastable/static_scalar_check_success"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "mean_squared_error_1/Mul"
  op: "Mul"
  input: "mean_squared_error_1/SquaredDifference"
  input: "mean_squared_error_1/Cast/x"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "mean_squared_error_1/Const"
  op: "Const"
  input: "^mean_squared_error_1/assert_broadcastable/static_scalar_check_success"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\000\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "mean_squared_error_1/Sum"
  op: "Sum"
  input: "mean_squared_error_1/Mul"
  input: "mean_squared_error_1/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "mean_squared_error_1/num_present/Equal/y"
  op: "Const"
  input: "^mean_squared_error_1/assert_broadcastable/static_scalar_check_success"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "mean_squared_error_1/num_present/Equal"
  op: "Equal"
  input: "mean_squared_error_1/Cast/x"
  input: "mean_squared_error_1/num_present/Equal/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "mean_squared_error_1/num_present/zeros_like"
  op: "Const"
  input: "^mean_squared_error_1/assert_broadcastable/static_scalar_check_success"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "mean_squared_error_1/num_present/ones_like/Shape"
  op: "Const"
  input: "^mean_squared_error_1/assert_broadcastable/static_scalar_check_success"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "mean_squared_error_1/num_present/ones_like/Const"
  op: "Const"
  input: "^mean_squared_error_1/assert_broadcastable/static_scalar_check_success"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "mean_squared_error_1/num_present/ones_like"
  op: "Fill"
  input: "mean_squared_error_1/num_present/ones_like/Shape"
  input: "mean_squared_error_1/num_present/ones_like/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "mean_squared_error_1/num_present/Select"
  op: "Select"
  input: "mean_squared_error_1/num_present/Equal"
  input: "mean_squared_error_1/num_present/zeros_like"
  input: "mean_squared_error_1/num_present/ones_like"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "mean_squared_error_1/num_present/broadcast_weights/assert_broadcastable/weights/shape"
  op: "Const"
  input: "^mean_squared_error_1/assert_broadcastable/static_scalar_check_success"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "mean_squared_error_1/num_present/broadcast_weights/assert_broadcastable/weights/rank"
  op: "Const"
  input: "^mean_squared_error_1/assert_broadcastable/static_scalar_check_success"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "mean_squared_error_1/num_present/broadcast_weights/assert_broadcastable/values/shape"
  op: "Const"
  input: "^mean_squared_error_1/assert_broadcastable/static_scalar_check_success"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "d\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "mean_squared_error_1/num_present/broadcast_weights/assert_broadcastable/values/rank"
  op: "Const"
  input: "^mean_squared_error_1/assert_broadcastable/static_scalar_check_success"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "mean_squared_error_1/num_present/broadcast_weights/assert_broadcastable/static_scalar_check_success"
  op: "NoOp"
  input: "^mean_squared_error_1/assert_broadcastable/static_scalar_check_success"
}
node {
  name: "mean_squared_error_1/num_present/broadcast_weights/ones_like/Shape"
  op: "Const"
  input: "^mean_squared_error_1/assert_broadcastable/static_scalar_check_success"
  input: "^mean_squared_error_1/num_present/broadcast_weights/assert_broadcastable/static_scalar_check_success"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "d\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "mean_squared_error_1/num_present/broadcast_weights/ones_like/Const"
  op: "Const"
  input: "^mean_squared_error_1/assert_broadcastable/static_scalar_check_success"
  input: "^mean_squared_error_1/num_present/broadcast_weights/assert_broadcastable/static_scalar_check_success"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "mean_squared_error_1/num_present/broadcast_weights/ones_like"
  op: "Fill"
  input: "mean_squared_error_1/num_present/broadcast_weights/ones_like/Shape"
  input: "mean_squared_error_1/num_present/broadcast_weights/ones_like/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "mean_squared_error_1/num_present/broadcast_weights"
  op: "Mul"
  input: "mean_squared_error_1/num_present/Select"
  input: "mean_squared_error_1/num_present/broadcast_weights/ones_like"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "mean_squared_error_1/num_present/Const"
  op: "Const"
  input: "^mean_squared_error_1/assert_broadcastable/static_scalar_check_success"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\000\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "mean_squared_error_1/num_present"
  op: "Sum"
  input: "mean_squared_error_1/num_present/broadcast_weights"
  input: "mean_squared_error_1/num_present/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "mean_squared_error_1/Const_1"
  op: "Const"
  input: "^mean_squared_error_1/assert_broadcastable/static_scalar_check_success"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "mean_squared_error_1/Sum_1"
  op: "Sum"
  input: "mean_squared_error_1/Sum"
  input: "mean_squared_error_1/Const_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "mean_squared_error_1/value"
  op: "DivNoNan"
  input: "mean_squared_error_1/Sum_1"
  input: "mean_squared_error_1/num_present"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients_1/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients_1/grad_ys_0"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "gradients_1/Fill"
  op: "Fill"
  input: "gradients_1/Shape"
  input: "gradients_1/grad_ys_0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients_1/mean_squared_error_1/value_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients_1/mean_squared_error_1/value_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients_1/mean_squared_error_1/value_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients_1/mean_squared_error_1/value_grad/Shape"
  input: "gradients_1/mean_squared_error_1/value_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients_1/mean_squared_error_1/value_grad/div_no_nan"
  op: "DivNoNan"
  input: "gradients_1/Fill"
  input: "mean_squared_error_1/num_present"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients_1/mean_squared_error_1/value_grad/Sum"
  op: "Sum"
  input: "gradients_1/mean_squared_error_1/value_grad/div_no_nan"
  input: "gradients_1/mean_squared_error_1/value_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients_1/mean_squared_error_1/value_grad/Reshape"
  op: "Reshape"
  input: "gradients_1/mean_squared_error_1/value_grad/Sum"
  input: "gradients_1/mean_squared_error_1/value_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients_1/mean_squared_error_1/value_grad/Neg"
  op: "Neg"
  input: "mean_squared_error_1/Sum_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients_1/mean_squared_error_1/value_grad/div_no_nan_1"
  op: "DivNoNan"
  input: "gradients_1/mean_squared_error_1/value_grad/Neg"
  input: "mean_squared_error_1/num_present"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients_1/mean_squared_error_1/value_grad/div_no_nan_2"
  op: "DivNoNan"
  input: "gradients_1/mean_squared_error_1/value_grad/div_no_nan_1"
  input: "mean_squared_error_1/num_present"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients_1/mean_squared_error_1/value_grad/mul"
  op: "Mul"
  input: "gradients_1/Fill"
  input: "gradients_1/mean_squared_error_1/value_grad/div_no_nan_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients_1/mean_squared_error_1/value_grad/Sum_1"
  op: "Sum"
  input: "gradients_1/mean_squared_error_1/value_grad/mul"
  input: "gradients_1/mean_squared_error_1/value_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients_1/mean_squared_error_1/value_grad/Reshape_1"
  op: "Reshape"
  input: "gradients_1/mean_squared_error_1/value_grad/Sum_1"
  input: "gradients_1/mean_squared_error_1/value_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients_1/mean_squared_error_1/value_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients_1/mean_squared_error_1/value_grad/Reshape"
  input: "^gradients_1/mean_squared_error_1/value_grad/Reshape_1"
}
node {
  name: "gradients_1/mean_squared_error_1/value_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients_1/mean_squared_error_1/value_grad/Reshape"
  input: "^gradients_1/mean_squared_error_1/value_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients_1/mean_squared_error_1/value_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients_1/mean_squared_error_1/value_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients_1/mean_squared_error_1/value_grad/Reshape_1"
  input: "^gradients_1/mean_squared_error_1/value_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients_1/mean_squared_error_1/value_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients_1/mean_squared_error_1/Sum_1_grad/Reshape/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients_1/mean_squared_error_1/Sum_1_grad/Reshape"
  op: "Reshape"
  input: "gradients_1/mean_squared_error_1/value_grad/tuple/control_dependency"
  input: "gradients_1/mean_squared_error_1/Sum_1_grad/Reshape/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients_1/mean_squared_error_1/Sum_1_grad/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients_1/mean_squared_error_1/Sum_1_grad/Tile"
  op: "Tile"
  input: "gradients_1/mean_squared_error_1/Sum_1_grad/Reshape"
  input: "gradients_1/mean_squared_error_1/Sum_1_grad/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tmultiples"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients_1/mean_squared_error_1/Sum_grad/Reshape/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "gradients_1/mean_squared_error_1/Sum_grad/Reshape"
  op: "Reshape"
  input: "gradients_1/mean_squared_error_1/Sum_1_grad/Tile"
  input: "gradients_1/mean_squared_error_1/Sum_grad/Reshape/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients_1/mean_squared_error_1/Sum_grad/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "d\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "gradients_1/mean_squared_error_1/Sum_grad/Tile"
  op: "Tile"
  input: "gradients_1/mean_squared_error_1/Sum_grad/Reshape"
  input: "gradients_1/mean_squared_error_1/Sum_grad/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tmultiples"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients_1/mean_squared_error_1/Mul_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "d\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "gradients_1/mean_squared_error_1/Mul_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients_1/mean_squared_error_1/Mul_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients_1/mean_squared_error_1/Mul_grad/Shape"
  input: "gradients_1/mean_squared_error_1/Mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients_1/mean_squared_error_1/Mul_grad/Mul"
  op: "Mul"
  input: "gradients_1/mean_squared_error_1/Sum_grad/Tile"
  input: "mean_squared_error_1/Cast/x"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients_1/mean_squared_error_1/Mul_grad/Sum"
  op: "Sum"
  input: "gradients_1/mean_squared_error_1/Mul_grad/Mul"
  input: "gradients_1/mean_squared_error_1/Mul_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients_1/mean_squared_error_1/Mul_grad/Reshape"
  op: "Reshape"
  input: "gradients_1/mean_squared_error_1/Mul_grad/Sum"
  input: "gradients_1/mean_squared_error_1/Mul_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients_1/mean_squared_error_1/Mul_grad/Mul_1"
  op: "Mul"
  input: "mean_squared_error_1/SquaredDifference"
  input: "gradients_1/mean_squared_error_1/Sum_grad/Tile"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients_1/mean_squared_error_1/Mul_grad/Sum_1"
  op: "Sum"
  input: "gradients_1/mean_squared_error_1/Mul_grad/Mul_1"
  input: "gradients_1/mean_squared_error_1/Mul_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients_1/mean_squared_error_1/Mul_grad/Reshape_1"
  op: "Reshape"
  input: "gradients_1/mean_squared_error_1/Mul_grad/Sum_1"
  input: "gradients_1/mean_squared_error_1/Mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients_1/mean_squared_error_1/Mul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients_1/mean_squared_error_1/Mul_grad/Reshape"
  input: "^gradients_1/mean_squared_error_1/Mul_grad/Reshape_1"
}
node {
  name: "gradients_1/mean_squared_error_1/Mul_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients_1/mean_squared_error_1/Mul_grad/Reshape"
  input: "^gradients_1/mean_squared_error_1/Mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients_1/mean_squared_error_1/Mul_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients_1/mean_squared_error_1/Mul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients_1/mean_squared_error_1/Mul_grad/Reshape_1"
  input: "^gradients_1/mean_squared_error_1/Mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients_1/mean_squared_error_1/Mul_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients_1/mean_squared_error_1/SquaredDifference_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "d\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "gradients_1/mean_squared_error_1/SquaredDifference_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "d\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "gradients_1/mean_squared_error_1/SquaredDifference_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients_1/mean_squared_error_1/SquaredDifference_grad/Shape"
  input: "gradients_1/mean_squared_error_1/SquaredDifference_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients_1/mean_squared_error_1/SquaredDifference_grad/scalar"
  op: "Const"
  input: "^gradients_1/mean_squared_error_1/Mul_grad/tuple/control_dependency"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 2.0
      }
    }
  }
}
node {
  name: "gradients_1/mean_squared_error_1/SquaredDifference_grad/Mul"
  op: "Mul"
  input: "gradients_1/mean_squared_error_1/SquaredDifference_grad/scalar"
  input: "gradients_1/mean_squared_error_1/Mul_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients_1/mean_squared_error_1/SquaredDifference_grad/sub"
  op: "Sub"
  input: "dense_3/BiasAdd"
  input: "Placeholder_3"
  input: "^gradients_1/mean_squared_error_1/Mul_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients_1/mean_squared_error_1/SquaredDifference_grad/mul_1"
  op: "Mul"
  input: "gradients_1/mean_squared_error_1/SquaredDifference_grad/Mul"
  input: "gradients_1/mean_squared_error_1/SquaredDifference_grad/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients_1/mean_squared_error_1/SquaredDifference_grad/Sum"
  op: "Sum"
  input: "gradients_1/mean_squared_error_1/SquaredDifference_grad/mul_1"
  input: "gradients_1/mean_squared_error_1/SquaredDifference_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients_1/mean_squared_error_1/SquaredDifference_grad/Reshape"
  op: "Reshape"
  input: "gradients_1/mean_squared_error_1/SquaredDifference_grad/Sum"
  input: "gradients_1/mean_squared_error_1/SquaredDifference_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients_1/mean_squared_error_1/SquaredDifference_grad/Sum_1"
  op: "Sum"
  input: "gradients_1/mean_squared_error_1/SquaredDifference_grad/mul_1"
  input: "gradients_1/mean_squared_error_1/SquaredDifference_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients_1/mean_squared_error_1/SquaredDifference_grad/Reshape_1"
  op: "Reshape"
  input: "gradients_1/mean_squared_error_1/SquaredDifference_grad/Sum_1"
  input: "gradients_1/mean_squared_error_1/SquaredDifference_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients_1/mean_squared_error_1/SquaredDifference_grad/Neg"
  op: "Neg"
  input: "gradients_1/mean_squared_error_1/SquaredDifference_grad/Reshape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients_1/mean_squared_error_1/SquaredDifference_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients_1/mean_squared_error_1/SquaredDifference_grad/Neg"
  input: "^gradients_1/mean_squared_error_1/SquaredDifference_grad/Reshape"
}
node {
  name: "gradients_1/mean_squared_error_1/SquaredDifference_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients_1/mean_squared_error_1/SquaredDifference_grad/Reshape"
  input: "^gradients_1/mean_squared_error_1/SquaredDifference_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients_1/mean_squared_error_1/SquaredDifference_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients_1/mean_squared_error_1/SquaredDifference_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients_1/mean_squared_error_1/SquaredDifference_grad/Neg"
  input: "^gradients_1/mean_squared_error_1/SquaredDifference_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients_1/mean_squared_error_1/SquaredDifference_grad/Neg"
      }
    }
  }
}
node {
  name: "gradients_1/dense_3/BiasAdd_grad/BiasAddGrad"
  op: "BiasAddGrad"
  input: "gradients_1/mean_squared_error_1/SquaredDifference_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "gradients_1/dense_3/BiasAdd_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients_1/dense_3/BiasAdd_grad/BiasAddGrad"
  input: "^gradients_1/mean_squared_error_1/SquaredDifference_grad/tuple/control_dependency"
}
node {
  name: "gradients_1/dense_3/BiasAdd_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients_1/mean_squared_error_1/SquaredDifference_grad/tuple/control_dependency"
  input: "^gradients_1/dense_3/BiasAdd_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients_1/mean_squared_error_1/SquaredDifference_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients_1/dense_3/BiasAdd_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients_1/dense_3/BiasAdd_grad/BiasAddGrad"
  input: "^gradients_1/dense_3/BiasAdd_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients_1/dense_3/BiasAdd_grad/BiasAddGrad"
      }
    }
  }
}
node {
  name: "gradients_1/dense_3/MatMul_grad/MatMul"
  op: "MatMul"
  input: "gradients_1/dense_3/BiasAdd_grad/tuple/control_dependency"
  input: "dense_3/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: true
    }
  }
}
node {
  name: "gradients_1/dense_3/MatMul_grad/MatMul_1"
  op: "MatMul"
  input: "dense_2/Relu"
  input: "gradients_1/dense_3/BiasAdd_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: true
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "gradients_1/dense_3/MatMul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients_1/dense_3/MatMul_grad/MatMul"
  input: "^gradients_1/dense_3/MatMul_grad/MatMul_1"
}
node {
  name: "gradients_1/dense_3/MatMul_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients_1/dense_3/MatMul_grad/MatMul"
  input: "^gradients_1/dense_3/MatMul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients_1/dense_3/MatMul_grad/MatMul"
      }
    }
  }
}
node {
  name: "gradients_1/dense_3/MatMul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients_1/dense_3/MatMul_grad/MatMul_1"
  input: "^gradients_1/dense_3/MatMul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients_1/dense_3/MatMul_grad/MatMul_1"
      }
    }
  }
}
node {
  name: "gradients_1/dense_2/Relu_grad/ReluGrad"
  op: "ReluGrad"
  input: "gradients_1/dense_3/MatMul_grad/tuple/control_dependency"
  input: "dense_2/Relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients_1/dense_2/BiasAdd_grad/BiasAddGrad"
  op: "BiasAddGrad"
  input: "gradients_1/dense_2/Relu_grad/ReluGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "gradients_1/dense_2/BiasAdd_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients_1/dense_2/BiasAdd_grad/BiasAddGrad"
  input: "^gradients_1/dense_2/Relu_grad/ReluGrad"
}
node {
  name: "gradients_1/dense_2/BiasAdd_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients_1/dense_2/Relu_grad/ReluGrad"
  input: "^gradients_1/dense_2/BiasAdd_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients_1/dense_2/Relu_grad/ReluGrad"
      }
    }
  }
}
node {
  name: "gradients_1/dense_2/BiasAdd_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients_1/dense_2/BiasAdd_grad/BiasAddGrad"
  input: "^gradients_1/dense_2/BiasAdd_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients_1/dense_2/BiasAdd_grad/BiasAddGrad"
      }
    }
  }
}
node {
  name: "gradients_1/dense_2/MatMul_grad/MatMul"
  op: "MatMul"
  input: "gradients_1/dense_2/BiasAdd_grad/tuple/control_dependency"
  input: "dense_2/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: true
    }
  }
}
node {
  name: "gradients_1/dense_2/MatMul_grad/MatMul_1"
  op: "MatMul"
  input: "Placeholder_2"
  input: "gradients_1/dense_2/BiasAdd_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: true
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "gradients_1/dense_2/MatMul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients_1/dense_2/MatMul_grad/MatMul"
  input: "^gradients_1/dense_2/MatMul_grad/MatMul_1"
}
node {
  name: "gradients_1/dense_2/MatMul_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients_1/dense_2/MatMul_grad/MatMul"
  input: "^gradients_1/dense_2/MatMul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients_1/dense_2/MatMul_grad/MatMul"
      }
    }
  }
}
node {
  name: "gradients_1/dense_2/MatMul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients_1/dense_2/MatMul_grad/MatMul_1"
  input: "^gradients_1/dense_2/MatMul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients_1/dense_2/MatMul_grad/MatMul_1"
      }
    }
  }
}
node {
  name: "GradientDescent_1/learning_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.5
      }
    }
  }
}
node {
  name: "GradientDescent_1/update_dense_2/kernel/ApplyGradientDescent"
  op: "ApplyGradientDescent"
  input: "dense_2/kernel"
  input: "GradientDescent_1/learning_rate"
  input: "gradients_1/dense_2/MatMul_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "GradientDescent_1/update_dense_2/bias/ApplyGradientDescent"
  op: "ApplyGradientDescent"
  input: "dense_2/bias"
  input: "GradientDescent_1/learning_rate"
  input: "gradients_1/dense_2/BiasAdd_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "GradientDescent_1/update_dense_3/kernel/ApplyGradientDescent"
  op: "ApplyGradientDescent"
  input: "dense_3/kernel"
  input: "GradientDescent_1/learning_rate"
  input: "gradients_1/dense_3/MatMul_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_3/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "GradientDescent_1/update_dense_3/bias/ApplyGradientDescent"
  op: "ApplyGradientDescent"
  input: "dense_3/bias"
  input: "GradientDescent_1/learning_rate"
  input: "gradients_1/dense_3/BiasAdd_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_3/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "GradientDescent_1"
  op: "NoOp"
  input: "^GradientDescent_1/update_dense_2/bias/ApplyGradientDescent"
  input: "^GradientDescent_1/update_dense_2/kernel/ApplyGradientDescent"
  input: "^GradientDescent_1/update_dense_3/bias/ApplyGradientDescent"
  input: "^GradientDescent_1/update_dense_3/kernel/ApplyGradientDescent"
}
node {
  name: "init_1"
  op: "NoOp"
  input: "^dense/bias/Assign"
  input: "^dense/kernel/Assign"
  input: "^dense_1/bias/Assign"
  input: "^dense_1/kernel/Assign"
  input: "^dense_2/bias/Assign"
  input: "^dense_2/kernel/Assign"
  input: "^dense_3/bias/Assign"
  input: "^dense_3/kernel/Assign"
}
node {
  name: "save_1/filename/input"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "model"
      }
    }
  }
}
node {
  name: "save_1/filename"
  op: "PlaceholderWithDefault"
  input: "save_1/filename/input"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
}
node {
  name: "save_1/Const"
  op: "PlaceholderWithDefault"
  input: "save_1/filename"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
}
node {
  name: "save_1/SaveV2/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 8
          }
        }
        string_val: "dense/bias"
        string_val: "dense/kernel"
        string_val: "dense_1/bias"
        string_val: "dense_1/kernel"
        string_val: "dense_2/bias"
        string_val: "dense_2/kernel"
        string_val: "dense_3/bias"
        string_val: "dense_3/kernel"
      }
    }
  }
}
node {
  name: "save_1/SaveV2/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 8
          }
        }
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
      }
    }
  }
}
node {
  name: "save_1/SaveV2"
  op: "SaveV2"
  input: "save_1/Const"
  input: "save_1/SaveV2/tensor_names"
  input: "save_1/SaveV2/shape_and_slices"
  input: "dense/bias"
  input: "dense/kernel"
  input: "dense_1/bias"
  input: "dense_1/kernel"
  input: "dense_2/bias"
  input: "dense_2/kernel"
  input: "dense_3/bias"
  input: "dense_3/kernel"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save_1/control_dependency"
  op: "Identity"
  input: "save_1/Const"
  input: "^save_1/SaveV2"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@save_1/Const"
      }
    }
  }
}
node {
  name: "save_1/RestoreV2/tensor_names"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 8
          }
        }
        string_val: "dense/bias"
        string_val: "dense/kernel"
        string_val: "dense_1/bias"
        string_val: "dense_1/kernel"
        string_val: "dense_2/bias"
        string_val: "dense_2/kernel"
        string_val: "dense_3/bias"
        string_val: "dense_3/kernel"
      }
    }
  }
}
node {
  name: "save_1/RestoreV2/shape_and_slices"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 8
          }
        }
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
      }
    }
  }
}
node {
  name: "save_1/RestoreV2"
  op: "RestoreV2"
  input: "save_1/Const"
  input: "save_1/RestoreV2/tensor_names"
  input: "save_1/RestoreV2/shape_and_slices"
  device: "/device:CPU:0"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save_1/Assign"
  op: "Assign"
  input: "dense/bias"
  input: "save_1/RestoreV2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_1/Assign_1"
  op: "Assign"
  input: "dense/kernel"
  input: "save_1/RestoreV2:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_1/Assign_2"
  op: "Assign"
  input: "dense_1/bias"
  input: "save_1/RestoreV2:2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_1/Assign_3"
  op: "Assign"
  input: "dense_1/kernel"
  input: "save_1/RestoreV2:3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_1/Assign_4"
  op: "Assign"
  input: "dense_2/bias"
  input: "save_1/RestoreV2:4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_1/Assign_5"
  op: "Assign"
  input: "dense_2/kernel"
  input: "save_1/RestoreV2:5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_1/Assign_6"
  op: "Assign"
  input: "dense_3/bias"
  input: "save_1/RestoreV2:6"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_3/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_1/Assign_7"
  op: "Assign"
  input: "dense_3/kernel"
  input: "save_1/RestoreV2:7"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_3/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_1/restore_all"
  op: "NoOp"
  input: "^save_1/Assign"
  input: "^save_1/Assign_1"
  input: "^save_1/Assign_2"
  input: "^save_1/Assign_3"
  input: "^save_1/Assign_4"
  input: "^save_1/Assign_5"
  input: "^save_1/Assign_6"
  input: "^save_1/Assign_7"
}
versions {
  producer: 27
}
