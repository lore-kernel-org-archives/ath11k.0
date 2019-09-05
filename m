Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5soL-0001Dz-Vs
 for ath11k@lists.infradead.org; Thu, 05 Sep 2019 14:32:35 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: fix wmi service ready ext tlv parsing
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1564642916-4728-1-git-send-email-akolli@codeaurora.org>
References: <1564642916-4728-1-git-send-email-akolli@codeaurora.org>
Message-Id: <20190905143233.7B71A6118D@smtp.codeaurora.org>
Date: Thu,  5 Sep 2019 14:32:33 +0000 (UTC)
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
To: Anilkumar Kolli <akolli@codeaurora.org>
Cc: ath11k@lists.infradead.org

Anilkumar Kolli <akolli@codeaurora.org> wrote:

> The current ath11k driver failed to parse
> wmi_tlv_svc_rdy_ext_parse if there is change in
> wmi_mac_phy_capabilities length with below error.
> 
> ath11k c000000.wifi1: failed to extract mac caps, idx :0
> ath11k c000000.wifi1: failed to parse tlv -22
> 
> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath11k-post-bringup branch of ath.git, thanks.

99c092c51811 ath11k: fix wmi service ready ext tlv parsing

-- 
https://patchwork.kernel.org/patch/11070187/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
