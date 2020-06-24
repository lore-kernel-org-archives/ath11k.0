Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jnw3e-0003Tb-Ad
 for ath11k@lists.infradead.org; Wed, 24 Jun 2020 03:26:43 +0000
Date: Tue, 23 Jun 2020 20:26:29 -0700 (PDT)
Message-Id: <20200623.202629.352077396302165327.davem@davemloft.net>
Subject: Re: [PATCH] net: qrtr: free flow in __qrtr_node_release
From: David Miller <davem@davemloft.net>
In-Reply-To: <1592882523-12870-1-git-send-email-cjhuang@codeaurora.org>
References: <1592882523-12870-1-git-send-email-cjhuang@codeaurora.org>
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
Date: Tue, 23 Jun 2020 11:22:03 +0800

> @@ -168,6 +168,7 @@ static void __qrtr_node_release(struct kref *kref)
>  	struct radix_tree_iter iter;
>  	unsigned long flags;
>  	void __rcu **slot;
> +	struct qrtr_tx_flow *flow;

Please retain the reverse christmas tree ordering of local variables here.

Thanks.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
