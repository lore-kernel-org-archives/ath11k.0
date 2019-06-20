Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hdyBU-0008Lo-5Y
 for ath11k@lists.infradead.org; Thu, 20 Jun 2019 14:37:05 +0000
MIME-Version: 1.0
Subject: Re: [PATCH V2 1/4] ath11k: Clean up void *per_transfer_context[] in ce
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1561022229-854-1-git-send-email-vthiagar@codeaurora.org>
References: <1561022229-854-1-git-send-email-vthiagar@codeaurora.org>
Message-Id: <20190620143658.5E811602BC@smtp.codeaurora.org>
Date: Thu, 20 Jun 2019 14:36:58 +0000 (UTC)
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
To: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
Cc: ath11k@lists.infradead.org

Vasanthakumar Thiagarajan <vthiagar@codeaurora.org> wrote:

> Since per_transfer_context is used as an array of skb pointer always
> no need that to be an array of void *.
> 
> Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

4 patches applied to ath11k-bringup branch of ath.git, thanks.

ac429efcdf8d ath11k: Clean up void *per_transfer_context[] in ce
4fd9eee9c2ef ath11k: Add peer.[ch] files for peer related util functions
9dff37f3c969 ath11k{dp, hal}: Endian macro related clean ups
74971a410d44 ath11k/dp_rx: Clean up void *rx_desc in struct ath11k_skb_rxcb

-- 
https://patchwork.kernel.org/patch/11006239/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
