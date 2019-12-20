const mongoose = require('mongoose');

const talkSchema = mongoose.Schema({
  date: {
    type: Date,
    required: true
  },
  initial_time: {
    type: Date,
    required: true
  },
  final_time: {
    type: Date,
    required: true
  },
  description: {
    type: String
  },
  title: {
    type: String,
    required: true
  },
  speaker: {
    type: [String],
    required: true
  },
  category: {
    type: Number,
    required: true
  },
  type: {
    type: String,
    require: true
  },
  rank: {
    type: Number
  },
  attendance: {
    type: Number
  },
});

module.exports = talk = mongoose.model('Talk', talkSchema);
