Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7cAm-0003IH-Cm
 for ath11k@lists.infradead.org; Mon, 17 Aug 2020 10:15:29 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 01/10] ath11k: do not depend on ARCH_QCOM for ath11k
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1597309466-19688-2-git-send-email-kvalo@codeaurora.org>
References: <1597309466-19688-2-git-send-email-kvalo@codeaurora.org>
Message-Id: <20200817101512.BE227C433CB@smtp.codeaurora.org>
Date: Mon, 17 Aug 2020 10:15:12 +0000 (UTC)
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

> With only IPQ8074 supported ath11k was only usable on Qualcomm architectures.
> But now that we are adding QCA6390 PCI support to ath11k that's not the case
> anymore and it can be used on any architecture supporting PCI. So remove the
> dependency on ARCH_QCOM. After that there is also no need to depend on
> COMPILE_TEST.
> 
> Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.1.0.1-01238-QCAHKSWPL_SILICONZ-2
> 
> Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

10 patches applied to ath-next branch of ath.git, thanks.

322b60ceb0f3 ath11k: do not depend on ARCH_QCOM for ath11k
9de2ad43d46c ath11k: add hw_params entry for QCA6390
34d5a3a88436 ath11k: move ring mask definitions to hw_params
6e0355afaeb2 ath11k: add simple PCI client driver for QCA6390 chipset
5762613ededb ath11k: pci: setup resources
5697a564d369 ath11k: pci: add MSI config initialisation
b8246f884684 ath11k: implement ath11k_core_pre_init()
1399fb87ea3e ath11k: register MHI controller device for QCA6390
7f4beda2ba03 ath11k: pci: add HAL, CE and core initialisation
1ff8ed786d5d ath11k: use remoteproc only with AHB devices

-- 
https://patchwork.kernel.org/patch/11712273/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
