Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from so254-31.mailgun.net ([198.61.254.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmJ4y-0000kO-Pd
 for ath11k@lists.infradead.org; Mon, 07 Dec 2020 16:09:37 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Ignore resetting peer auth flag in peer assoc cmd
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1606369414-25211-1-git-send-email-seevalam@codeaurora.org>
References: <1606369414-25211-1-git-send-email-seevalam@codeaurora.org>
Message-Id: <20201207160934.B01F8C433ED@smtp.codeaurora.org>
Date: Mon,  7 Dec 2020 16:09:34 +0000 (UTC)
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
To: Seevalamuthu Mariappan <seevalam@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Seevalamuthu Mariappan <seevalam@codeaurora.org> wrote:

> Incase of hardware encryption, WMI_PEER_AUTH flag will be set by firmware
> during install key. Since install key wont be done for software encryption
> mode, firmware will not set this flag. Due to this, seeing traffic failure
> in software encryption. Hence, avoid resetting peer auth flag if hardware
> encryption disabled.
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-01421-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Seevalamuthu Mariappan <seevalam@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

1daf58b23a1e ath11k: Ignore resetting peer auth flag in peer assoc cmd

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1606369414-25211-1-git-send-email-seevalam@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
