Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jkq3f-0005QK-Gl
 for ath11k@lists.infradead.org; Mon, 15 Jun 2020 14:25:58 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/2] ath11k: Add direct buffer ring support
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1591688014-26441-1-git-send-email-periyasa@codeaurora.org>
References: <1591688014-26441-1-git-send-email-periyasa@codeaurora.org>
Message-Id: <20200615142542.6D645C433C8@smtp.codeaurora.org>
Date: Mon, 15 Jun 2020 14:25:42 +0000 (UTC)
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
To: Karthikeyan Periyasamy <periyasa@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Karthikeyan Periyasamy <periyasa@codeaurora.org> wrote:

> Add direct buffer ring (dbring) with helper API, which is used by the
> spectral scan. Initialise the direct buffer ring based on the dma ring
> capability, which get announced in the wmi service ready extended event.
> This ring is slightly changed from data path rings. Compare to data path
> ring this ring shares the hp and tp address to firmware though WMI commands.
> Also the replenish buffer size is derived from firmware announcement.
> driver receive indication through WMI event
> WMI_PDEV_DMA_RING_BUF_RELEASE_EVENTID.
> 
> Tested-on: IPQ8074 WLAN.HK.2.1.0.1-01228-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

2 patches applied to ath-next branch of ath.git, thanks.

bd6478559e27 ath11k: Add direct buffer ring support
9d11b7bff950 ath11k: add support for spectral scan

-- 
https://patchwork.kernel.org/patch/11594695/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
