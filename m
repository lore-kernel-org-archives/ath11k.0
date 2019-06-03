Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hXjbn-0002Yu-EO
 for ath11k@lists.infradead.org; Mon, 03 Jun 2019 09:50:28 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: fix MIMO in 11ax mode
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1559265936-32158-1-git-send-email-milehu@codeaurora.org>
References: <1559265936-32158-1-git-send-email-milehu@codeaurora.org>
Message-Id: <20190603095026.D19956044E@smtp.codeaurora.org>
Date: Mon,  3 Jun 2019 09:50:26 +0000 (UTC)
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
To: Miles Hu <milehu@codeaurora.org>
Cc: ath11k@lists.infradead.org

Miles Hu <milehu@codeaurora.org> wrote:

> HE_MUMODE and HE_SOUNDING_MODE WMI commands are
> mandatory to enable 11ax MU-MIMO.
> 
> Signed-off-by: Miles Hu <milehu@codeaurora.org>

Patch applied to ath.git, thanks.

c8c726b2ea01 ath11k: fix MIMO in 11ax mode

-- 
https://patchwork.kernel.org/patch/10969435/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
