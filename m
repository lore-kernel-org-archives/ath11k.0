Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqPfm-0001I0-5A
 for ath11k@lists.infradead.org; Tue, 30 Jun 2020 23:28:18 +0000
Date: Tue, 30 Jun 2020 16:28:13 -0700 (PDT)
Message-Id: <20200630.162813.775042630673995756.davem@davemloft.net>
Subject: Re: [PATCH v2] net: qrtr: free flow in __qrtr_node_release
From: David Miller <davem@davemloft.net>
In-Reply-To: <1593499971-9212-1-git-send-email-cjhuang@codeaurora.org>
References: <1593499971-9212-1-git-send-email-cjhuang@codeaurora.org>
Mime-Version: 1.0
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
To: cjhuang@codeaurora.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, ath11k@lists.infradead.org

From: Carl Huang <cjhuang@codeaurora.org>
Date: Tue, 30 Jun 2020 14:52:51 +0800

> The flow is allocated in qrtr_tx_wait, but not freed when qrtr node
> is released. (*slot) becomes NULL after radix_tree_iter_delete is
> called in __qrtr_node_release. The fix is to save (*slot) to a
> vairable and then free it.
> 
> This memory leak is catched when kmemleak is enabled in kernel,
> the report looks like below:
> 
> unreferenced object 0xffffa0de69e08420 (size 32):
>   comm "kworker/u16:3", pid 176, jiffies 4294918275 (age 82858.876s)
>   hex dump (first 32 bytes):
>     00 00 00 00 00 00 00 00 28 84 e0 69 de a0 ff ff  ........(..i....
>     28 84 e0 69 de a0 ff ff 03 00 00 00 00 00 00 00  (..i............
>   backtrace:
>     [<00000000e252af0a>] qrtr_node_enqueue+0x38e/0x400 [qrtr]
>     [<000000009cea437f>] qrtr_sendmsg+0x1e0/0x2a0 [qrtr]
>     [<000000008bddbba4>] sock_sendmsg+0x5b/0x60
>     [<0000000003beb43a>] qmi_send_message.isra.3+0xbe/0x110 [qmi_helpers]
>     [<000000009c9ae7de>] qmi_send_request+0x1c/0x20 [qmi_helpers]
> 
> Signed-off-by: Carl Huang <cjhuang@codeaurora.org>

Applied and queued up for -stable, thanks.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
