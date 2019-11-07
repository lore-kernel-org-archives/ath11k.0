Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSdgS-0002rP-7z
 for ath11k@lists.infradead.org; Thu, 07 Nov 2019 09:02:30 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Fixing TLV length issue in peer pktlog WMI command
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20191029025742.22488-1-vikpatel@codeaurora.org>
References: <20191029025742.22488-1-vikpatel@codeaurora.org>
Message-Id: <20191107090226.D8A9B60996@smtp.codeaurora.org>
Date: Thu,  7 Nov 2019 09:02:26 +0000 (UTC)
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
To: Vikas Patel <vikpatel@codeaurora.org>
Cc: ath11k@lists.infradead.org

Vikas Patel <vikpatel@codeaurora.org> wrote:

> TLV length was 0 for TLV tag 'WMI_TAG_ARRAY_STRUCT' causing
> Q6 to crash when trying to configure pktlog filter via debugfs.
> 
> Signed-off-by: Vikas Patel <vikpatel@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath11k-post-bringup branch of ath.git, thanks.

86a3e1b38dcb ath11k: Fixing TLV length issue in peer pktlog WMI command

-- 
https://patchwork.kernel.org/patch/11216897/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
