Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from so254-31.mailgun.net ([198.61.254.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knwjX-0007hv-Q2
 for ath11k@lists.infradead.org; Sat, 12 Dec 2020 04:42:17 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 01/10] ath11k: mhi: hook suspend and resume
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1607708150-21066-2-git-send-email-kvalo@codeaurora.org>
References: <1607708150-21066-2-git-send-email-kvalo@codeaurora.org>
Message-Id: <20201212044214.4830EC433ED@smtp.codeaurora.org>
Date: Sat, 12 Dec 2020 04:42:14 +0000 (UTC)
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Kalle Valo <kvalo@codeaurora.org> wrote:

> MHI suspend and resume isn't hooked in ath11k yet, so hook these
> functions needed for suspend support.
> 
> Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
> 
> Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

10 patches applied to ath-next branch of ath.git, thanks.

34fb81e4eb92 ath11k: mhi: hook suspend and resume
fa5917e44ee8 ath11k: hif: implement suspend and resume functions
f6fa37a4928f ath11k: pci: read select_window register to ensure write is finished
d50370c953bc ath11k: htc: remove unused struct ath11k_htc_ops
8733d835ec43 ath11k: htc: implement suspend handling
840c36fa727a ath11k: dp: stop rx pktlog before suspend
2151ffde188a ath11k: set credit_update flag for flow controlled ep only
79802b13a492 ath11k: implement WoW enable and wakeup commands
d578ec2a0d5c ath11k: hif: add ce irq enable and disable functions
d1b0c33850d2 ath11k: implement suspend for QCA6390 PCI devices

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1607708150-21066-2-git-send-email-kvalo@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
