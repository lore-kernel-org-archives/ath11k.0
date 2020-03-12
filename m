Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCJ6f-0007xp-Ln
 for ath11k@lists.infradead.org; Thu, 12 Mar 2020 08:22:21 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 1/7] ath11k: Use scnprintf() for avoiding potential buffer
 overflow
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20200311084713.18220-2-tiwai@suse.de>
References: <20200311084713.18220-2-tiwai@suse.de>
Message-Id: <20200312082208.36F25C433BA@smtp.codeaurora.org>
Date: Thu, 12 Mar 2020 08:22:08 +0000 (UTC)
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
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Takashi Iwai <tiwai@suse.de> wrote:

> Since snprintf() returns the would-be-output size instead of the
> actual output size, the succeeding calls may go beyond the given
> buffer limit.  Fix it by replacing with scnprintf().
> 
> Cc: ath11k@lists.infradead.org
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

2 patches applied to ath-next branch of ath.git, thanks.

bc8f237823bc ath11k: Use scnprintf() for avoiding potential buffer overflow
dfb252c7b680 ath5k: Use scnprintf() for avoiding potential buffer overflow

-- 
https://patchwork.kernel.org/patch/11431143/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
