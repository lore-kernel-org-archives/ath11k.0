Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hnMEg-0003HQ-Hm
 for ath11k@lists.infradead.org; Tue, 16 Jul 2019 12:07:13 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v4] ath11k: Fix rx_duration reporting
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1562758243-12336-1-git-send-email-gseset@codeaurora.org>
References: <1562758243-12336-1-git-send-email-gseset@codeaurora.org>
Message-Id: <20190716120709.D4F0C60D35@smtp.codeaurora.org>
Date: Tue, 16 Jul 2019 12:07:09 +0000 (UTC)
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
To: Ganesh Sesetti <gseset@codeaurora.org>
Cc: ath11k@lists.infradead.org

Ganesh Sesetti <gseset@codeaurora.org> wrote:

> Since rx duration is wrongly reported in iw wlanX station dump,
> fetch correct rx duration reported in PPDU_END tlv.
> Enable PPDU_END, MPDU_START and PPDU_END_STATUS_DONE tlv
> reporting in monitor status by default. Pass the sta's Rx duration
> to mac80211 in sta_statistics() ops.
> 
> Signed-off-by: Ganesh Sesetti <gseset@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath11k-bringup branch of ath.git, thanks.

e56ef3789437 ath11k: Fix rx_duration reporting

-- 
https://patchwork.kernel.org/patch/11038387/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
