Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSdh5-000392-Lx
 for ath11k@lists.infradead.org; Thu, 07 Nov 2019 09:03:09 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Fix target crash due to WBM_IDLE_LINK ring desc
 shortage
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1572323162-13410-1-git-send-email-vthiagar@codeaurora.org>
References: <1572323162-13410-1-git-send-email-vthiagar@codeaurora.org>
Message-Id: <20191107090306.78CE76078A@smtp.codeaurora.org>
Date: Thu,  7 Nov 2019 09:03:06 +0000 (UTC)
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

> Make sure the number of WBM_IDLE_LINK ring descriptors is power
> of 2. This increases the number of descriptors to 32k from the
> current ~18k to fix the target assert because of the shortage in
> the descriptors in WBM_IDLE_LINK ring. Remove unnecessary
> power of 2 calculation in ath11k_dp_link_desc_setup() as it is
> not required after this change.
> 
> Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath11k-post-bringup branch of ath.git, thanks.

1415d842e71a ath11k: Fix target crash due to WBM_IDLE_LINK ring desc shortage

-- 
https://patchwork.kernel.org/patch/11216961/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
