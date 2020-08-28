Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBZCi-0000K4-4p
 for ath11k@lists.infradead.org; Fri, 28 Aug 2020 07:53:47 +0000
MIME-Version: 1.0
Date: Fri, 28 Aug 2020 15:53:06 +0800
From: Wen Gong <wgong@codeaurora.org>
Subject: Re: [for-next][PATCH 2/2] tracing: Use temp buffer when filtering
 events
In-Reply-To: <20160504135241.308454993@goodmis.org>
References: <20160504135202.422290539@goodmis.org>
 <20160504135241.308454993@goodmis.org>
Message-ID: <b504b3d7e989cae108669a0cd3072454@codeaurora.org>
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

On 2016-05-04 21:52, Steven Rostedt wrote:
> From: "Steven Rostedt (Red Hat)" <rostedt@goodmis.org>
> 
> Filtering of events requires the data to be written to the ring buffer
> before it can be decided to filter or not. This is because the 
> parameters of
> the filter are based on the result that is written to the ring buffer 
> and
> not on the parameters that are passed into the trace functions.
> 
> The ftrace ring buffer is optimized for writing into the ring buffer 
> and
> committing. The discard procedure used when filtering decides the event
> should be discarded is much more heavy weight. Thus, using a temporary
> filter when filtering events can speed things up drastically.
> 
> Without a temp buffer we have:
> 
>  # trace-cmd start -p nop
>  # perf stat -r 10 hackbench 50
>        0.790706626 seconds time elapsed ( +-  0.71% )
> 
>  # trace-cmd start -e all
>  # perf stat -r 10 hackbench 50
>        1.566904059 seconds time elapsed ( +-  0.27% )
> 
>  # trace-cmd start -e all -f 'common_preempt_count==20'
>  # perf stat -r 10 hackbench 50
>        1.690598511 seconds time elapsed ( +-  0.19% )
> 
>  # trace-cmd start -e all -f 'common_preempt_count!=20'
>  # perf stat -r 10 hackbench 50
>        1.707486364 seconds time elapsed ( +-  0.30% )
> 
> The first run above is without any tracing, just to get a based figure.
> hackbench takes ~0.79 seconds to run on the system.
> 
> The second run enables tracing all events where nothing is filtered. 
> This
> increases the time by 100% and hackbench takes 1.57 seconds to run.
> 
> The third run filters all events where the preempt count will equal 
> "20"
> (this should never happen) thus all events are discarded. This takes 
> 1.69
> seconds to run. This is 10% slower than just committing the events!
> 
> The last run enables all events and filters where the filter will 
> commit all
> events, and this takes 1.70 seconds to run. The filtering overhead is
> approximately 10%. Thus, the discard and commit of an event from the 
> ring
> buffer may be about the same time.
> 
> With this patch, the numbers change:
> 
>  # trace-cmd start -p nop
>  # perf stat -r 10 hackbench 50
>        0.778233033 seconds time elapsed ( +-  0.38% )
> 
>  # trace-cmd start -e all
>  # perf stat -r 10 hackbench 50
>        1.582102692 seconds time elapsed ( +-  0.28% )
> 
>  # trace-cmd start -e all -f 'common_preempt_count==20'
>  # perf stat -r 10 hackbench 50
>        1.309230710 seconds time elapsed ( +-  0.22% )
> 
>  # trace-cmd start -e all -f 'common_preempt_count!=20'
>  # perf stat -r 10 hackbench 50
>        1.786001924 seconds time elapsed ( +-  0.20% )
> 
> The first run is again the base with no tracing.
> 
> The second run is all tracing with no filtering. It is a little slower, 
> but
> that may be well within the noise.
> 
> The third run shows that discarding all events only took 1.3 seconds. 
> This
> is a speed up of 23%! The discard is much faster than even the commit.
> 
> The one downside is shown in the last run. Events that are not 
> discarded by
> the filter will take longer to add, this is due to the extra copy of 
> the
> event.
> 
> Cc: Alexei Starovoitov <ast@kernel.org>
> Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
> ---
>  kernel/trace/trace.c               | 154 
> +++++++++++++++++++++++++++++++++++--
>  kernel/trace/trace.h               |  19 ++++-
>  kernel/trace/trace_events.c        |  10 +++
>  kernel/trace/trace_events_filter.c |  10 +++
>  4 files changed, 185 insertions(+), 8 deletions(-)
> 
...
> @@ -1695,8 +1820,23 @@ trace_event_buffer_lock_reserve(struct
> ring_buffer **current_rb,
>  			  unsigned long flags, int pc)
>  {
>  	struct ring_buffer_event *entry;
> +	int val;
> 
>  	*current_rb = trace_file->tr->trace_buffer.buffer;
> +
> +	if ((trace_file->flags &
> +	     (EVENT_FILE_FL_SOFT_DISABLED | EVENT_FILE_FL_FILTERED)) &&
> +	    (entry = this_cpu_read(trace_buffered_event))) {
> +		/* Try to use the per cpu buffer first */
> +		val = this_cpu_inc_return(trace_buffered_event_cnt);
> +		if (val == 1) {
> +			trace_event_setup(entry, type, flags, pc);
> +			entry->array[0] = len;
> +			return entry;
> +		}
> +		this_cpu_dec(trace_buffered_event_cnt);
> +	}
> +
>  	entry = trace_buffer_lock_reserve(*current_rb,
>  					 type, len, flags, pc);
>  	/*
this patch commit id is : 0fc1b09ff1ff404ddf753f5ffa5cd0adc8fdcdc9 which 
has upstream.

how much size is the per cpu buffer?
seems it is initilized in trace_buffered_event_enable,
it is only 1 page size as below:
void trace_buffered_event_enable(void)
{
...
	for_each_tracing_cpu(cpu) {
		page = alloc_pages_node(cpu_to_node(cpu),
					GFP_KERNEL | __GFP_NORETRY, 0);
If the size of buffer to trace is more than 1 page, such as 46680, then 
it trigger kernel crash/panic in my case while run trace-cmd.
After debugging, the trace_file->flags in 
trace_event_buffer_lock_reserve is 0x40b while run trace-cmd, and it is 
0x403 while collecting ftrace log.

Is it have any operation to disable this patch dynamically?

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
