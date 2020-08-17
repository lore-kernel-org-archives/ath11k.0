Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7cEZ-0003hx-4q
 for ath11k@lists.infradead.org; Mon, 17 Aug 2020 10:19:22 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 01/11] ath11k: add support for m3 firmware
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1597389030-13887-2-git-send-email-kvalo@codeaurora.org>
References: <1597389030-13887-2-git-send-email-kvalo@codeaurora.org>
Message-Id: <20200817101911.5A3B4C433C6@smtp.codeaurora.org>
Date: Mon, 17 Aug 2020 10:19:11 +0000 (UTC)
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

> PCI devices like QCA6390 have a separate firmware image for the m3
> micro-controller. Add support to load the firmware using m3.bin file.
> 
> Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.1.0.1-01238-QCAHKSWPL_SILICONZ-2
> 
> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

11 patches applied to ath-next branch of ath.git, thanks.

569704544778 ath11k: add support for m3 firmware
6eb6ea513828 ath11k: add board file support for PCI devices
eb8de0490e1f ath11k: fill appropriate QMI service instance id for QCA6390
654e959ae0a1 ath11k: pci: add read32() and write32() hif operations
c4eacabee224 ath11k: configure copy engine msi address in CE srng
2c3960c2253d ath11k: setup ce tasklet for control path
26f3a021b37c ath11k: allocate smaller chunks of memory for firmware
f44dd33e6336 ath11k: fix memory OOB access in qmi_decode
6c809d04c542 ath11k: fix KASAN warning of ath11k_qmi_wlanfw_wlan_cfg_send
727fae1478a5 ath11k: enable internal sleep clock
f7eb4b04ce6f ath11k: hal: create hw_srng_config dynamically

-- 
https://patchwork.kernel.org/patch/11713607/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
