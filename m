Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQCCz-00013V-Io
 for ath11k@lists.infradead.org; Mon, 13 May 2019 14:45:43 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Cleanup in WMI
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1557220835-5587-1-git-send-email-periyasa@codeaurora.org>
References: <1557220835-5587-1-git-send-email-periyasa@codeaurora.org>
Message-Id: <20190513144541.0C8D860A43@smtp.codeaurora.org>
Date: Mon, 13 May 2019 14:45:41 +0000 (UTC)
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

> Remove duplicate variables service_ready and unified_ready from
> the ath11k_pdev_wmi struct, originally defined in ath11k_wmi_base
> struct.
> 
> Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>

Patch applied to ath.git, thanks.

9d61706c756a ath11k: Cleanup in WMI

-- 
https://patchwork.kernel.org/patch/10932677/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
