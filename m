Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jiXvd-00008e-Cx
 for ath11k@lists.infradead.org; Tue, 09 Jun 2020 06:40:12 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] ath11k: Add direct buffer ring support
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1591673945-25300-1-git-send-email-periyasa@codeaurora.org>
References: <1591673945-25300-1-git-send-email-periyasa@codeaurora.org>
Message-Id: <20200609063958.A4567C43387@smtp.codeaurora.org>
Date: Tue,  9 Jun 2020 06:39:58 +0000 (UTC)
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

Fails to build:

Error in reading or end of file.
drivers/net/wireless/ath/ath11k/dbring.c: In function 'ath11k_dbring_buffer_release_event':
drivers/net/wireless/ath/ath11k/dbring.c:271:8: error: assignment to 'struct ath11k_dbring *' from incompatible pointer type 'struct ath11k_db_ring *' [-Werror=incompatible-pointer-types]
  271 |   ring = ath11k_spectral_get_dbring(ar);
      |        ^
cc1: some warnings being treated as errors
make[5]: *** [drivers/net/wireless/ath/ath11k/dbring.o] Error 1
make[5]: *** Waiting for unfinished jobs....
make[4]: *** [drivers/net/wireless/ath/ath11k] Error 2
make[4]: *** Waiting for unfinished jobs....
make[3]: *** [drivers/net/wireless/ath] Error 2
make[2]: *** [drivers/net/wireless] Error 2
make[1]: *** [drivers/net] Error 2
make: *** [drivers] Error 2

2 patches set to Changes Requested.

11594295 [1/2] ath11k: Add direct buffer ring support
11594297 [2/2] ath11k: add support for spectral scan

-- 
https://patchwork.kernel.org/patch/11594295/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
