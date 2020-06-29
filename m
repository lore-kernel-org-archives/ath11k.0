Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpsIg-0005Fy-DQ
 for ath11k@lists.infradead.org; Mon, 29 Jun 2020 11:50:17 +0000
MIME-Version: 1.0
Date: Mon, 29 Jun 2020 19:50:06 +0800
From: cjhuang@codeaurora.org
Subject: Re: [PATCH] net: qrtr: free flow in __qrtr_node_release
In-Reply-To: <20200623.202629.352077396302165327.davem@davemloft.net>
References: <1592882523-12870-1-git-send-email-cjhuang@codeaurora.org>
 <20200623.202629.352077396302165327.davem@davemloft.net>
Message-ID: <f5754bde02e4026ace2ef4ca9fb8ae47@codeaurora.org>
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
To: David Miller <davem@davemloft.net>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, ath11k@lists.infradead.org

On 2020-06-24 11:26, David Miller wrote:
> From: Carl Huang <cjhuang@codeaurora.org>
> Date: Tue, 23 Jun 2020 11:22:03 +0800
> 
>> @@ -168,6 +168,7 @@ static void __qrtr_node_release(struct kref *kref)
>>  	struct radix_tree_iter iter;
>>  	unsigned long flags;
>>  	void __rcu **slot;
>> +	struct qrtr_tx_flow *flow;
> 
> Please retain the reverse christmas tree ordering of local variables 
> here.

OK. Will send V2 for it.

> 
> Thanks.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
