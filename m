Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaLYG-0003Ah-Sr
 for ath11k@lists.infradead.org; Wed, 04 Nov 2020 16:22:25 +0000
MIME-Version: 1.0
Subject: Re: [RFC] ath11k: enable non-wow suspend and resume
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20201030095832.7447-1-cjhuang@codeaurora.org>
References: <20201030095832.7447-1-cjhuang@codeaurora.org>
Message-Id: <20201104162223.C6E23C433CB@smtp.codeaurora.org>
Date: Wed,  4 Nov 2020 16:22:23 +0000 (UTC)
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

> For QCA6390, it needs to power down target when system suspends and
> needs to power up target when system resumes in non-wow scenario.
> 
> The power up procedure downloads firmware again.
> 
> Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
> 
> Signed-off-by: Carl Huang <cjhuang@codeaurora.org>

Failed to apply, please rebase.

error: patch failed: drivers/net/wireless/ath/ath11k/mac.c:837
error: drivers/net/wireless/ath/ath11k/mac.c: patch does not apply
stg import: Diff does not apply cleanly

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20201030095832.7447-1-cjhuang@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
