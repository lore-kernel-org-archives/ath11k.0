Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Date: Fri, 28 Aug 2020 18:49:55 -0400
From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [for-next][PATCH 2/2] tracing: Use temp buffer when filtering
 events
Message-ID: <20200828184955.6de9b54e@oasis.local.home>
In-Reply-To: <b504b3d7e989cae108669a0cd3072454@codeaurora.org>
References: <20160504135202.422290539@goodmis.org>
 <20160504135241.308454993@goodmis.org>
 <b504b3d7e989cae108669a0cd3072454@codeaurora.org>
MIME-Version: 1.0
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: Wen Gong <wgong@codeaurora.org>
Cc: linux-kernel-owner@vger.kernel.org, tientzu@google.com, abhishekpandit@google.com, drinkcat@google.com, Alexei Starovoitov <ast@kernel.org>, ath10k@lists.infradead.org, linux-kernel@vger.kernel.org, ath11k@lists.infradead.org, briannorris@google.com, Andrew Morton <akpm@linux-foundation.org>, Ingo Molnar <mingo@kernel.org>

On Fri, 28 Aug 2020 15:53:06 +0800
Wen Gong <wgong@codeaurora.org> wrote:

> this patch commit id is : 0fc1b09ff1ff404ddf753f5ffa5cd0adc8fdcdc9 which 
> has upstream.
> 
> how much size is the per cpu buffer?
> seems it is initilized in trace_buffered_event_enable,
> it is only 1 page size as below:
> void trace_buffered_event_enable(void)
> {
> ...
> 	for_each_tracing_cpu(cpu) {
> 		page = alloc_pages_node(cpu_to_node(cpu),
> 					GFP_KERNEL | __GFP_NORETRY, 0);
> If the size of buffer to trace is more than 1 page, such as 46680, then 
> it trigger kernel crash/panic in my case while run trace-cmd.
> After debugging, the trace_file->flags in 
> trace_event_buffer_lock_reserve is 0x40b while run trace-cmd, and it is 
> 0x403 while collecting ftrace log.
> 
> Is it have any operation to disable this patch dynamically?

It shouldn't be disabled, this is a bug that needs to be fixed.

Also, if an event is more than a page, it wont be saved in the ftrace
ring buffer, as events are limited by page size minus the headers.

-- Steve

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
