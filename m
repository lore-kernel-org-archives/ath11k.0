Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail25.static.mailgun.info ([104.130.122.25])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ioHkt-0007Th-Ri
 for ath11k@lists.infradead.org; Mon, 06 Jan 2020 02:04:33 +0000
MIME-Version: 1.0
Date: Mon, 06 Jan 2020 10:04:25 +0800
From: Wen Gong <wgong@codeaurora.org>
Subject: Re: [PATCH v2] net: qrtr: fix len of skb_put_padto in
 qrtr_node_enqueue
In-Reply-To: <20200105.144704.221506192255563950.davem@davemloft.net>
References: <20200103045016.12459-1-wgong@codeaurora.org>
 <20200105.144704.221506192255563950.davem@davemloft.net>
Message-ID: <2540a09c73dd896bb793924275bdab0e@codeaurora.org>
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

On 2020-01-06 06:47, David Miller wrote:
> From: Wen Gong <wgong@codeaurora.org>
> Date: Fri,  3 Jan 2020 12:50:16 +0800
> 
>> The len used for skb_put_padto is wrong, it need to add len of hdr.
> 
> Thanks, applied.
> 
> There is another bug here, skb_put_padto() returns an error and frees
> the SKB when the put fails.  There really needs to be a check here,
> because currently the code right now will keep using the freed up
> skb in that situation.
> 

Thanks David.

Yes, __skb_put_padto will return -ENOMEM if __skb_pad fail.
I think it can return the same error immediately and do not do the next 
steps in qrtr_node_enqueue.
> Thanks.

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
