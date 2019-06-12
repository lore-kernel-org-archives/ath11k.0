Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hb1A1-0005Ho-8k
 for ath11k@lists.infradead.org; Wed, 12 Jun 2019 11:11:23 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: cleanup in core and qmi components
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1560159503-5765-1-git-send-email-periyasa@codeaurora.org>
References: <1560159503-5765-1-git-send-email-periyasa@codeaurora.org>
Message-Id: <20190612111120.DE9436079C@smtp.codeaurora.org>
Date: Wed, 12 Jun 2019 11:11:20 +0000 (UTC)
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
Cc: ath11k@lists.infradead.org

Karthikeyan Periyasamy <periyasa@codeaurora.org> wrote:

> Removed unused define ATH11K_TARGET_NAME and ATH11K_FW_READY_TIMEOUT_HZ.
> Modify the api name from ath11k_qmi_firmware_indication() to
> ath11k_core_qmi_firmware_ready() because its a core module functionality.
> 
> Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath11k-bringup branch of ath.git, thanks.

108e62bbb49f ath11k: cleanup in core and qmi components

-- 
https://patchwork.kernel.org/patch/10984579/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
