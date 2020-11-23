Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khGEp-0000yN-Si
 for ath11k@lists.infradead.org; Mon, 23 Nov 2020 18:06:58 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Fix beamformee STS in HE cap
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1604933229-15815-1-git-send-email-rgnanase@codeaurora.org>
References: <1604933229-15815-1-git-send-email-rgnanase@codeaurora.org>
Message-Id: <20201123180651.2BC33C43463@smtp.codeaurora.org>
Date: Mon, 23 Nov 2020 18:06:51 +0000 (UTC)
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
To: Ramya Gnanasekar <rgnanase@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Ramya Gnanasekar <rgnanase@codeaurora.org> wrote:

> STS Beamformee capability sent from firmware is overwritten as
> num_tx_chains - 1.
> When num_tx_chains is 2, then STS is set to invalid value 1.
> Since STS is not limited by number of TX chain, not overwriting the
> capability received from firmware.
> 
> Tested on: IPQ6018 WLAN.HK.2.4.0.1-00303-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Ramya Gnanasekar <rgnanase@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

1057db1b8b76 ath11k: Fix beamformee STS in HE cap

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1604933229-15815-1-git-send-email-rgnanase@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
