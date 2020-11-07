Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbJJL-0000BK-Eu
 for ath11k@lists.infradead.org; Sat, 07 Nov 2020 08:11:00 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: fix ZERO address in probe request
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20201012101733.24137-1-cjhuang@codeaurora.org>
References: <20201012101733.24137-1-cjhuang@codeaurora.org>
Message-Id: <20201107081042.59036C433F0@smtp.codeaurora.org>
Date: Sat,  7 Nov 2020 08:10:42 +0000 (UTC)
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
To: Carl Huang <cjhuang@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Carl Huang <cjhuang@codeaurora.org> wrote:

> Host needs to pass at least on bssid with all 0xff to firmware in
> WMI_START_SCAN_CMDID, otherwise the bssid and receiver address
> in probe requeste are all ZEROs.
> 
> This also fixed some hidden AP connection issue because some AP
> doesn't respond to probe request which receiver address are all
> ZEROs.
> 
> Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
> 
> Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

fa7572c2cfe0 ath11k: fix ZERO address in probe request

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20201012101733.24137-1-cjhuang@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
