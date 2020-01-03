Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail25.static.mailgun.info ([104.130.122.25])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1inBuF-0003GF-7j
 for ath11k@lists.infradead.org; Fri, 03 Jan 2020 01:37:40 +0000
MIME-Version: 1.0
Date: Fri, 03 Jan 2020 09:37:26 +0800
From: Wen Gong <wgong@codeaurora.org>
Subject: Re: [PATCH] net: qrtr: fix len of skb_put_padto in qrtr_node_enqueue
In-Reply-To: <20200102.162249.948673283541180133.davem@davemloft.net>
References: <20191231093242.6320-1-wgong@codeaurora.org>
 <20200102.162249.948673283541180133.davem@davemloft.net>
Message-ID: <297b94fe2eb5a20c75c2095e9640a495@codeaurora.org>
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

On 2020-01-03 08:22, David Miller wrote:

> I don't think this is correct.
> 
> The 'hdr' was already "pushed" earlier in this file.
> 
> Here we are padding the area after the header, which is being "put".
> 
> I'm not applying this.  If you still think it is correct, you must 
> explain
> in detail why it is and add that description to the commit log message.
> 
> Thank you.

Thanks David.
I will add more description and send patch v2.

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
