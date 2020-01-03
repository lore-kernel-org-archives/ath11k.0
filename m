Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1inAjr-0007ue-TZ
 for ath11k@lists.infradead.org; Fri, 03 Jan 2020 00:22:53 +0000
Date: Thu, 02 Jan 2020 16:22:49 -0800 (PST)
Message-Id: <20200102.162249.948673283541180133.davem@davemloft.net>
Subject: Re: [PATCH] net: qrtr: fix len of skb_put_padto in qrtr_node_enqueue
From: David Miller <davem@davemloft.net>
In-Reply-To: <20191231093242.6320-1-wgong@codeaurora.org>
References: <20191231093242.6320-1-wgong@codeaurora.org>
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
To: wgong@codeaurora.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, ath11k@lists.infradead.org

From: Wen Gong <wgong@codeaurora.org>
Date: Tue, 31 Dec 2019 17:32:42 +0800

> From: Carl Huang <cjhuang@codeaurora.org>
> 
> The len used for skb_put_padto is wrong, it need to add len of hdr.
> 
> Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
> Signed-off-by: Wen Gong <wgong@codeaurora.org>
 ...
> @@ -196,7 +196,7 @@ static int qrtr_node_enqueue(struct qrtr_node *node, struct sk_buff *skb,
>  	hdr->size = cpu_to_le32(len);
>  	hdr->confirm_rx = 0;
>  
> -	skb_put_padto(skb, ALIGN(len, 4));
> +	skb_put_padto(skb, ALIGN(len, 4) + sizeof(*hdr));

I don't think this is correct.

The 'hdr' was already "pushed" earlier in this file.

Here we are padding the area after the header, which is being "put".

I'm not applying this.  If you still think it is correct, you must explain
in detail why it is and add that description to the commit log message.

Thank you.


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
