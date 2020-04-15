Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOcy5-0005o6-Ry
 for ath11k@lists.infradead.org; Wed, 15 Apr 2020 08:00:25 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Fix fw assert by setting proper vht cap
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1586538405-16226-2-git-send-email-mkenna@codeaurora.org>
References: <1586538405-16226-2-git-send-email-mkenna@codeaurora.org>
Message-Id: <20200415080005.926C1C433BA@smtp.codeaurora.org>
Date: Wed, 15 Apr 2020 08:00:05 +0000 (UTC)
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
To: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Cc: Ritesh Singh <ritesi@codeaurora.org>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Maharaja Kennadyrajan <mkenna@codeaurora.org> wrote:

> After setting fixed vht-rate if new station is trying to
> assoc with mu_bfee cap, or if a sta is already connected
> with mu_bfee cap then set the fixed vht-rate and
> reconnecting the sta, FW assert is happening.
> 
> So to avoid this, reset the MU_BEAMFORMEE bit in vht->caps,
> if mcs_index is invalid for nss 1.
> 
> Signed-off-by: Ritesh Singh <ritesi@codeaurora.org>
> Signed-off-by: Maharaja Kennadyrajan <mkenna@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

40c766d4a49c ath11k: Fix fw assert by setting proper vht cap

-- 
https://patchwork.kernel.org/patch/11483471/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
