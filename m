Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hNdL6-0006fN-VR
 for ath11k@lists.infradead.org; Mon, 06 May 2019 13:07:30 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v3] ath11k: Fix downlink MU-MIMO
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1556678516-12844-1-git-send-email-milehu@codeaurora.org>
References: <1556678516-12844-1-git-send-email-milehu@codeaurora.org>
Message-Id: <20190506130728.970EB60741@smtp.codeaurora.org>
Date: Mon,  6 May 2019 13:07:28 +0000 (UTC)
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

> In vdev start command, prefer tx and rx streams are mandatory to enable DL MU-MIMO.
> Tested only on 11ac mode.
> 
> Signed-off-by: Miles Hu <milehu@codeaurora.org>

Patch applied to ath.git, thanks.

cc5c8c29fcaa ath11k: Fix downlink MU-MIMO

-- 
https://patchwork.kernel.org/patch/10924439/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
