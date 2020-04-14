Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOGe5-0003et-41
 for ath11k@lists.infradead.org; Tue, 14 Apr 2020 08:10:16 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: fix duplication peer create on same radio
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1586343795-21422-1-git-send-email-periyasa@codeaurora.org>
References: <1586343795-21422-1-git-send-email-periyasa@codeaurora.org>
Message-Id: <20200414081009.0F0E0C432C2@smtp.codeaurora.org>
Date: Tue, 14 Apr 2020 08:10:09 +0000 (UTC)
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
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Karthikeyan Periyasamy <periyasa@codeaurora.org> wrote:

> Add the pdev index information in the peer object to validate
> the peer creation. Ignore the peer creation request, if the given
> MAC address is already present in the peer list with same radio.
> If we allow the peer creation in above scenario, FW assert will happen.
> Above scenario occurred in two cases, where Multiple AP VAP created in
> the same radio.
> 
> 1. when testing tool sends association request to two AP with same
>    MAC address
> 2. when a station do roaming from one AP VAP to another AP VAP.
> 
> Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

1e744bf218b5 ath11k: fix duplication peer create on same radio

-- 
https://patchwork.kernel.org/patch/11479785/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
