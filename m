Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kC39f-0003Ak-Im
 for ath11k@lists.infradead.org; Sat, 29 Aug 2020 15:52:36 +0000
MIME-Version: 1.0
Date: Sat, 29 Aug 2020 23:52:32 +0800
From: Wen Gong <wgong@codeaurora.org>
Subject: Re: [for-next][PATCH 2/2] tracing: Use temp buffer when filtering
 events
In-Reply-To: <20200828185538.1761f93d@oasis.local.home>
References: <20160504135202.422290539@goodmis.org>
 <20160504135241.308454993@goodmis.org>
 <b504b3d7e989cae108669a0cd3072454@codeaurora.org>
 <20200828184955.6de9b54e@oasis.local.home>
 <20200828185450.101ebd09@oasis.local.home>
 <20200828185538.1761f93d@oasis.local.home>
Message-ID: <f16b14066317f6a926b6636df6974966@codeaurora.org>
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: Steven Rostedt <rostedt@goodmis.org>
Cc: linux-kernel-owner@vger.kernel.org, tientzu@google.com, abhishekpandit@google.com, drinkcat@google.com, Alexei Starovoitov <ast@kernel.org>, ath10k@lists.infradead.org, linux-kernel@vger.kernel.org, ath11k@lists.infradead.org, briannorris@google.com, Andrew Morton <akpm@linux-foundation.org>, Ingo Molnar <mingo@kernel.org>

On 2020-08-29 06:55, Steven Rostedt wrote:
> On Fri, 28 Aug 2020 18:54:50 -0400
> Steven Rostedt <rostedt@goodmis.org> wrote:
> 
>> On Fri, 28 Aug 2020 18:49:55 -0400
>> Steven Rostedt <rostedt@goodmis.org> wrote:
>> 
>> > On Fri, 28 Aug 2020 15:53:06 +0800
>> > Wen Gong <wgong@codeaurora.org> wrote:
>> >
>> > > this patch commit id is : 0fc1b09ff1ff404ddf753f5ffa5cd0adc8fdcdc9 which
>> > > has upstream.
>> > >
>> > > how much size is the per cpu buffer?
>> > > seems it is initilized in trace_buffered_event_enable,
>> > > it is only 1 page size as below:
>> > > void trace_buffered_event_enable(void)
>> > > {
>> > > ...
>> > > 	for_each_tracing_cpu(cpu) {
>> > > 		page = alloc_pages_node(cpu_to_node(cpu),
>> > > 					GFP_KERNEL | __GFP_NORETRY, 0);
>> > > If the size of buffer to trace is more than 1 page, such as 46680, then
>> > > it trigger kernel crash/panic in my case while run trace-cmd.
>> > > After debugging, the trace_file->flags in
>> > > trace_event_buffer_lock_reserve is 0x40b while run trace-cmd, and it is
>> > > 0x403 while collecting ftrace log.
>> > >
>> > > Is it have any operation to disable this patch dynamically?
>> >
>> > It shouldn't be disabled, this is a bug that needs to be fixed.
>> >
>> > Also, if an event is more than a page, it wont be saved in the ftrace
>> > ring buffer, as events are limited by page size minus the headers.
>> >
>> 
>> Untested (not even compiled, as I'm now on PTO) but does this patch
>> work for you?
>> 
>> -- Steve
>> 
>> diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
>> index f40d850ebabc..3a9b4422e7fc 100644
>> --- a/kernel/trace/trace.c
>> +++ b/kernel/trace/trace.c
>> @@ -2598,7 +2598,7 @@ trace_event_buffer_lock_reserve(struct 
>> trace_buffer **current_rb,
>>  	    (entry = this_cpu_read(trace_buffered_event))) {
>>  		/* Try to use the per cpu buffer first */
>>  		val = this_cpu_inc_return(trace_buffered_event_cnt);
>> -		if (val == 1) {
>> +		if (val == 1 || (len > (PAGE_SIZE - 8))) {
> 
> That was suppose to be:
> 
> 		if (val == 1 && (len < (PAGE_SIZE - 8))) {
> 
> -- Steve
Thanks Steve!

If change like this, I think it will fix my issue of crash.
Will you commit this change?
> 
>>  			trace_event_setup(entry, type, flags, pc);
>>  			entry->array[0] = len;
>>  			return entry;

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
