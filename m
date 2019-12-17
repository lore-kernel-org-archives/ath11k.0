Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail25.static.mailgun.info ([104.130.122.25])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihDfH-00020R-0F
 for ath11k@lists.infradead.org; Tue, 17 Dec 2019 14:17:34 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v7] ath11k: register HE mesh capabilities
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20191202075815.20409-1-sven@narfation.org>
References: <20191202075815.20409-1-sven@narfation.org>
Message-Id: <20191217141724.7A37EC433CB@smtp.codeaurora.org>
Date: Tue, 17 Dec 2019 14:17:24 +0000 (UTC)
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
To: Sven Eckelmann <sven@narfation.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, Sven Eckelmann <seckelmann@datto.com>

Sven Eckelmann <sven@narfation.org> wrote:

> The capabilities for the HE mesh are generated from the capabilities
> reported by the fw. But the firmware only reports the overall capabilities
> and not the one which are specific for mesh. Some of them (TWT, MU UL/DL,
> TB PPDU, ...) require an infrastructure setup with a main STA (AP)
> controlling the operations. This is not the case for mesh and thus these
> capabilities are removed from the list of capabilities.
> 
> Signed-off-by: Sven Eckelmann <seckelmann@datto.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

13591a1c3899 ath11k: register HE mesh capabilities

-- 
https://patchwork.kernel.org/patch/11268775/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
