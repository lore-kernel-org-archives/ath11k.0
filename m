Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7Amg-0002AI-QK
 for ath11k@lists.infradead.org; Thu, 27 Feb 2020 04:28:28 +0000
Date: Wed, 26 Feb 2020 20:28:20 -0800 (PST)
Message-Id: <20200226.202820.545246435708068018.davem@davemloft.net>
Subject: Re: [PATCH v2] net: qrtr: fix len of skb_put_padto in
 qrtr_node_enqueue
From: David Miller <davem@davemloft.net>
In-Reply-To: <CAD=FV=WiceRwLUS1sdL_W=ELKYZ9zKE13e8vx9SO0+tRvX74QQ@mail.gmail.com>
References: <20200103045016.12459-1-wgong@codeaurora.org>
 <20200105.144704.221506192255563950.davem@davemloft.net>
 <CAD=FV=WiceRwLUS1sdL_W=ELKYZ9zKE13e8vx9SO0+tRvX74QQ@mail.gmail.com>
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
To: dianders@chromium.org
Cc: netdev@vger.kernel.org, ath11k@lists.infradead.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, wgong@codeaurora.org

From: Doug Anderson <dianders@chromium.org>
Date: Tue, 25 Feb 2020 14:52:24 -0800

> I noticed this patch is in mainline now as:
> 
> ce57785bf91b net: qrtr: fix len of skb_put_padto in qrtr_node_enqueue
> 
> Though I'm not an expert on the code, it feels like a stable candidate
> unless someone objects.

Ok, queued up, thanks.

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
