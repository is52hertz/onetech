<template>
  <div class="changeLogVersion">
    <h2>{{name}}</h2>
    <div v-if="!version.data" class="loading">
      加载中...
    </div>
    <div v-else-if="isEmptyUnreleased">
      <div class="empty">Currently no unreleased content</div>
    </div>
    <div v-else>
      <div v-if="date" class="date">{{date}}</div>
      <ChangeLogCommit v-for="commit in version.data.commits" :commit="commit" :key="commit.sha" />
    </div>
  </div>
</template>

<script>
import Version from '../models/Version';

import ChangeLogCommit from './ChangeLogCommit';

export default {
  props: [
    'id',
  ],
  data() {
    return {
      version: Version.fetch(this.id),
    };
  },
  components: {
    ChangeLogCommit
  },
  computed: {
    date() {
      if (!this.version.data.date) return;
      const date = new Date(this.version.data.date);
      const months = [
        "一月", "二月", "三月",
        "四月", "五月", "六月", "七月",
        "八月", "九月", "十月",
        "十一月", "十二月"
      ];
      var month = date.getMonth();
      var day = date.getDate();
      var year = date.getFullYear();
      return `${months[month]} ${day}, ${year}`;
    },
    name() {
      if (this.id === "unreleased") {
        return "未发布";
      }
      return "版本 " + this.id;
    },
    isEmptyUnreleased() {
      return this.id === "unreleased" && this.version.data.commits.length === 0;
    }
  }
}
</script>

<style scoped>
  .changeLogVersion > h2 {
    margin-top: 20px;
    margin-bottom: 0;
    padding: 0;
  }

  .changeLogVersion .date,
  .changeLogVersion .empty {
    color: #999;
    text-align: center;
    margin-bottom: 10px;
    font-style: italic;
  }
</style>
