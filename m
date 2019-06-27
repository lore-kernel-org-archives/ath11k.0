Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgSKs-0005eD-6T
 for ath11k@lists.infradead.org; Thu, 27 Jun 2019 11:13:03 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 1/4] ath11k/wmi: Remove wmi service abstraction
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1561550860-2928-1-git-send-email-vthiagar@codeaurora.org>
References: <1561550860-2928-1-git-send-email-vthiagar@codeaurora.org>
Message-Id: <20190627111301.D926D60A33@smtp.codeaurora.org>
Date: Thu, 27 Jun 2019 11:13:01 +0000 (UTC)
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
To: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
Cc: ath11k@lists.infradead.org

Vasanthakumar Thiagarajan <vthiagar@codeaurora.org> wrote:

> There is going to be only one version of WMI TLV.
> 
> Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

4 patches applied to ath11k-bringup branch of ath.git, thanks.

5cbfcf7e1e73 ath11k/wmi: Remove wmi service abstraction
fcafe58d61d3 ath11k/wmi: Clean up few indentations in wmi
3e3dd4c0b842 ath11k/wmi: Remove unnecessary type casting
eed27be604a2 ath11k/wmi: Clean up function parameter list in wmi event handlers

-- 
https://patchwork.kernel.org/patch/11017539/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
