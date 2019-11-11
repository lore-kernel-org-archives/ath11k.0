Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUANZ-0002CZ-O2
 for ath11k@lists.infradead.org; Mon, 11 Nov 2019 14:09:19 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] ath11k: Move mac80211 hw allocation before wmi_init
 command
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1573204214-17336-1-git-send-email-vthiagar@codeaurora.org>
References: <1573204214-17336-1-git-send-email-vthiagar@codeaurora.org>
Message-Id: <20191111140917.557AE60D84@smtp.codeaurora.org>
Date: Mon, 11 Nov 2019 14:09:17 +0000 (UTC)
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

> This is to prepare REO ring setup before sending wmi_init command.
> Firmware expects all the required REO rings to be setup while processing
> wmi_init command. But as per the current initialization sequence, REO ring
> configurations are done only after wmi_init command is sent.
> Also refactoring ath11k_mac_create() into ath11k_mac_alloc() and
> ath11k_mac_register() to it mac80211 hw structure available before sending
> wmi_init command.
> 
> Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>

Failed to apply, please rebase.

error: patch failed: drivers/net/wireless/ath/ath11k/core.c:537
error: drivers/net/wireless/ath/ath11k/core.c: patch does not apply
stg import: Diff does not apply cleanly

2 patches set to Changes Requested.

11234363 [1/2] ath11k: Move mac80211 hw allocation before wmi_init command
11234365 [2/2] ath11k: Setup REO destination ring before sending wmi_init command

-- 
https://patchwork.kernel.org/patch/11234363/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
