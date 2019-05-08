Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hOJAX-0007XI-W3
 for ath11k@lists.infradead.org; Wed, 08 May 2019 09:47:23 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Increase Tx idr size to avoid Tx fail
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1557153162-15342-1-git-send-email-periyasa@codeaurora.org>
References: <1557153162-15342-1-git-send-email-periyasa@codeaurora.org>
Message-Id: <20190508094721.B13B760A33@smtp.codeaurora.org>
Date: Wed,  8 May 2019 09:47:21 +0000 (UTC)
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
To: Karthikeyan Periyasamy <periyasa@codeaurora.org>
Cc: ath11k@lists.infradead.org

Karthikeyan Periyasamy <periyasa@codeaurora.org> wrote:

> In data traffic, encounter below warn due to idr resource unavailable.
> we found that idr alloc size is not good enough to pump the traffic.
> so increased the idr size by double the TX completion ring size.
> 
> Warn:
> ath11k c000000.wifi1: failed to transmit frame -28
> 
> Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>

Patch applied to ath.git, thanks.

d75d0ebd2a7b ath11k: Increase Tx idr size to avoid Tx fail

-- 
https://patchwork.kernel.org/patch/10931149/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
