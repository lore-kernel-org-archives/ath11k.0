Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hg2qu-0008OW-66
 for ath11k@lists.infradead.org; Wed, 26 Jun 2019 08:00:25 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: adding return variable in ath11k_qmi_firmware_stop
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1561464416-20553-1-git-send-email-gsamin@codeaurora.org>
References: <1561464416-20553-1-git-send-email-gsamin@codeaurora.org>
Message-Id: <20190626080023.E30D560A33@smtp.codeaurora.org>
Date: Wed, 26 Jun 2019 08:00:23 +0000 (UTC)
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
To: Govindaraj Saminathan <gsamin@codeaurora.org>
Cc: ath11k@lists.infradead.org

Govindaraj Saminathan <gsamin@codeaurora.org> wrote:

> adding return variable in ath11k_qmi_firmware_stop to check
> the status of mode_off command.
> 
> Signed-off-by: Govindaraj Saminathan <gsamin@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath11k-bringup branch of ath.git, thanks.

7946054a1680 ath11k: adding return variable in ath11k_qmi_firmware_stop

-- 
https://patchwork.kernel.org/patch/11015401/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
