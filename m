Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIEGL-0007QM-Vj
 for ath11k@lists.infradead.org; Tue, 15 Sep 2020 16:57:03 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Add support spectral scan for IPQ6018
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1591688888-30237-1-git-send-email-periyasa@codeaurora.org>
References: <1591688888-30237-1-git-send-email-periyasa@codeaurora.org>
Message-Id: <20200915165655.57064C433C8@smtp.codeaurora.org>
Date: Tue, 15 Sep 2020 16:56:55 +0000 (UTC)
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

> IPQ6018 supported with 4 bytes FFT BIN size. so supported 4 bytes
> parsing logic in FFT report process.
> 
> Tested-on: IPQ6018 WLAN.HK.2.1.0.1-01228-QCAHKSWPL_SILICONZ-1
> 
> Note: This is based on below patches
> 	1. ath11k: add IPQ6018 support
> 	2. ath11k: add support for spectral scan
> 	3. ath11k: Add direct buffer ring support
> 
> Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>

Does not apply anymore, please rebase. Also you should investigate how
it works with QCA6390.

error: patch failed: drivers/net/wireless/ath/ath11k/core.c:26
error: drivers/net/wireless/ath/ath11k/core.c: patch does not apply
error: patch failed: drivers/net/wireless/ath/ath11k/hw.h:117
error: drivers/net/wireless/ath/ath11k/hw.h: patch does not apply
stg import: Diff does not apply cleanly

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/patch/11594815/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
