Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7yDU-0007Yj-O8
 for ath11k@lists.infradead.org; Tue, 18 Aug 2020 09:47:41 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 1/9] ath11k: enable DP interrupt setup for QCA6390
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1597555891-26112-2-git-send-email-kvalo@codeaurora.org>
References: <1597555891-26112-2-git-send-email-kvalo@codeaurora.org>
Message-Id: <20200818094737.42796C43391@smtp.codeaurora.org>
Date: Tue, 18 Aug 2020 09:47:37 +0000 (UTC)
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

> QCA6390 uses MSI interrupt, so need to configure msi_add and
> msi_data to dp srngs. As there are so many DP srngs, so need
> to group them. Each group shares one MSI interrupt.
> 
> Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.1.0.1-01238-QCAHKSWPL_SILICONZ-2
> 
> Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

9 patches applied to ath-next branch of ath.git, thanks.

d4ecb90b3857 ath11k: enable DP interrupt setup for QCA6390
7f6fc1ebf5b1 ath11k: don't initialize rxdma1 related ring
4152e4206cc5 ath11k: setup QCA6390 rings for both rxdmas
84eee3c845d3 ath11k: refine the phy_id check in ath11k_reg_chan_list_event
e7495035286a ath11k: delay vdev_start for QCA6390
a6275302c370 ath11k: assign correct search flag and type for QCA6390
454a97217283 ath11k: process both lmac rings for QCA6390
065f5f683ea6 ath11k: use TCL_DATA_RING_0 for QCA6390
f3c603d412b3 ath11k: reset MHI during power down and power up

-- 
https://patchwork.kernel.org/patch/11715971/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
