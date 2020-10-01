Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kO4Io-00043O-MB
 for ath11k@lists.infradead.org; Thu, 01 Oct 2020 19:31:46 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 1/8] ath11k: support loading ELF board files
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1601399736-3210-2-git-send-email-kvalo@codeaurora.org>
References: <1601399736-3210-2-git-send-email-kvalo@codeaurora.org>
Message-Id: <20201001193141.39C41C433CB@smtp.codeaurora.org>
Date: Thu,  1 Oct 2020 19:31:41 +0000 (UTC)
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

> The QCA6390 board I have, model 8291M-PR comes with an ELF board file.  To get
> this to at least somewhat work, I renamed bdwlan.e04 to 'board.bin' and then
> added this patch to check for ELF magic string in the beginning of the file.
> If that is found, use type ELF.  After this the driver loads.
> 
> Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
> 
> Signed-off-by: Ben Greear <greearb@candelatech.com>
> [kvalo@codeaurora.org: use elf.h, minor cleanup]
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

8 patches applied to ath-next branch of ath.git, thanks.

616c16a4b26a ath11k: support loading ELF board files
b09199248905 ath11k: fix AP mode for QCA6390
2626c269702e ath11k: add interface_modes to hw_params
18ac1665e785 ath11k: pci: check TCSR_SOC_HW_VERSION
3f6e6c3291ed ath11k: disable monitor mode on QCA6390
df648808c6b9 ath11k: change to disable softirqs for ath11k_regd_update to solve deadlock
6a8be1baa911 ath11k: Use GFP_ATOMIC instead of GFP_KERNEL in ath11k_dp_htt_get_ppdu_desc
87e8497a7d46 ath11k: Use GFP_ATOMIC instead of GFP_KERNEL in idr_alloc

-- 
https://patchwork.kernel.org/patch/11806385/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
