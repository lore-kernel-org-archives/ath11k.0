Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfmME-000156-SF
 for ath11k@lists.infradead.org; Tue, 25 Jun 2019 14:23:40 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 1/8] ath11k: correct prefix for public functions in mac.c
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1561376969-3999-1-git-send-email-mpubbise@codeaurora.org>
References: <1561376969-3999-1-git-send-email-mpubbise@codeaurora.org>
Message-Id: <20190625142338.3F6B46016D@smtp.codeaurora.org>
Date: Tue, 25 Jun 2019 14:23:38 +0000 (UTC)
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
To: Manikanta Pubbisetty <mpubbise@codeaurora.org>
Cc: ath11k@lists.infradead.org

Manikanta Pubbisetty <mpubbise@codeaurora.org> wrote:

> Use ath11k_mac_ prefix for all public functions defined
> in mac.c file.
> 
> Signed-off-by: Manikanta Pubbisetty <mpubbise@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

8 patches applied to ath11k-bringup branch of ath.git, thanks.

82ca15f54e9f ath11k: correct prefix for public functions in mac.c
aa9fe5e5483c ath11k: make ath11k_mgmt_over_wmi_tx_*() functions static
8119fc4fb9b1 ath11k: move ath11k_smps_map[] to the beginning of the file
8d1a7d05b34e ath11k: use ath11k_mac_op_ prefix for functions in ath11k_ops
1306a30c2052 ath11k: add approprite comments for no-op functions
ee997259ac6b ath11k: avoid use of magic numbers
ba7f9b8c7ffa ath11k: remove unnecessary parenthesis
e6d0f2ebd5c8 ath11k: use switch statement when necessary

-- 
https://patchwork.kernel.org/patch/11012929/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
