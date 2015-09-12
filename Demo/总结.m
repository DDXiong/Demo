多线程
1.NSThread
1> 开线程的几种方式
* 先创建,后启动
NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(run) object:nil];
[thread start];

* 直接启动
[NSThread detachNewThreadSelector:@selector(run) toTarget:self withObject:nil];
[self performSelectorInBackground:@selector(run) withObject:nil];

2> 其他用法
NSThread *current = [NSThread currentThread];
+ (NSThread *)mainThread; // 获得主线程

3> 线程间通信
performSelectorOnMainThread.....

2.GCD(重点)
1> 队列的类型
* 并发队列
获得全局的并发队列: dispatch_get_global_queue

* 串行队列
a.自己创建
dispatch_queue_create

b.主队列
dispatch_get_main_queue

2> 执行任务的方法类型
* 同步(sync)执行
* 异步(async)执行

3> 了解队列和方法的配合使用

4> 线程间通信
dispatch_async(
dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
   // 执行耗时的异步操作...
   dispatch_async(dispatch_get_main_queue(), ^{
       // 回到主线程，执行UI刷新操作
   });
});

5> 其他用法
dispatch_once
dispatch_after
dispatch_group_async\dispatch_group_notify

3.NSOperation
1> 基本使用
NSInvocationOperation
NSBlockOperation

2> NSOperationQueue(重点)
* 最大并发数设置
- (void)setMaxConcurrentOperationCount:(NSInteger)cnt;

* 设置依赖(面试题)
[operationB addDependency:operationA]; // 操作B依赖于操作A

3> 自定义Operation(了解基本流程)

