Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hnMDV-0002ix-Ev
 for ath11k@lists.infradead.org; Tue, 16 Jul 2019 12:05:59 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/4] ath11k: removed duplicated functionality
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1561737854-19003-1-git-send-email-msinada@codeaurora.org>
References: <1561737854-19003-1-git-send-email-msinada@codeaurora.org>
Message-Id: <20190716120557.331FD616BA@smtp.codeaurora.org>
Date: Tue, 16 Jul 2019 12:05:57 +0000 (UTC)
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
To: Muna Sinada <msinada@codeaurora.org>
Cc: ath11k@lists.infradead.org

Muna Sinada <msinada@codeaurora.org> wrote:

> Removed duplicated functionality in ath11k_hal_desc_reo_parse_err() and
> replaced with function call to ath11k_hal_rx_reo_entl_paddr_get().
> 
> Signed-off-by: Muna Sinada <msinada@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

4 patches applied to ath11k-bringup branch of ath.git, thanks.

3305d94f75cc ath11k: removed duplicated functionality
8bc3b7e41ab2 ath11k: changed parameter from u8 * to struct sk_buff *
a9cd19921cc8 ath11k: comments added to explain purpose
c6f7e826a450 ath11k: added RMB to return_buffer_manager description

-- 
https://patchwork.kernel.org/patch/11022891/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
