Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-15.mailgun.net ([69.72.43.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knwiD-0007Jk-8O
 for ath11k@lists.infradead.org; Sat, 12 Dec 2020 04:40:56 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 1/6] ath11k: mhi: print a warning if firmware crashed
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1607609124-17250-2-git-send-email-kvalo@codeaurora.org>
References: <1607609124-17250-2-git-send-email-kvalo@codeaurora.org>
Message-Id: <20201212044045.9523EC43462@smtp.codeaurora.org>
Date: Sat, 12 Dec 2020 04:40:45 +0000 (UTC)
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

> There was no way to detect if the firmware crashed so add a warning. At the
> moment the firmware is not restarted or anything like that, so when this
> happens ath11k modules need to be reloaded.
> 
> Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
> 
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

6 patches applied to ath-next branch of ath.git, thanks.

fc46e1b2a24a ath11k: mhi: print a warning if firmware crashed
43ed15e1ee01 ath11k: put hw to DBS using WMI_PDEV_SET_HW_MODE_CMDID
babb0ced6acd ath11k: pci: fix hot reset stability issues
0699940755e9 ath11k: pci: fix L1ss clock unstable problem
0ccdf4398827 ath11k: pci: disable VDD4BLOW
f57ad6a9885e ath11k: Fix incorrect tlvs in scan start command

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1607609124-17250-2-git-send-email-kvalo@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
