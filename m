Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ioEfp-0001kl-Tl
 for ath11k@lists.infradead.org; Sun, 05 Jan 2020 22:47:07 +0000
Date: Sun, 05 Jan 2020 14:47:04 -0800 (PST)
Message-Id: <20200105.144704.221506192255563950.davem@davemloft.net>
Subject: Re: [PATCH v2] net: qrtr: fix len of skb_put_padto in
 qrtr_node_enqueue
From: David Miller <davem@davemloft.net>
In-Reply-To: <20200103045016.12459-1-wgong@codeaurora.org>
References: <20200103045016.12459-1-wgong@codeaurora.org>
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
Date: Fri,  3 Jan 2020 12:50:16 +0800

> The len used for skb_put_padto is wrong, it need to add len of hdr.

Thanks, applied.

There is another bug here, skb_put_padto() returns an error and frees
the SKB when the put fails.  There really needs to be a check here,
because currently the code right now will keep using the freed up
skb in that situation.

Thanks.

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
