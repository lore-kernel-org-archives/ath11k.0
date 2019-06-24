Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfMYf-0007LB-Sp
 for ath11k@lists.infradead.org; Mon, 24 Jun 2019 10:50:47 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 1/4] ath11k: change struct name from buffer_addr to
 ath11k_buffer_addr
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1561058129-25625-1-git-send-email-msinada@codeaurora.org>
References: <1561058129-25625-1-git-send-email-msinada@codeaurora.org>
Message-Id: <20190624105045.43FB860208@smtp.codeaurora.org>
Date: Mon, 24 Jun 2019 10:50:45 +0000 (UTC)
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

> Changed definition and all mentions of buffer_addr to ath11k_buffer_addr
> 
> Signed-off-by: Muna Sinada <msinada@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

4 patches applied to ath11k-bringup branch of ath.git, thanks.

53e969e57e82 ath11k: change struct name from buffer_addr to ath11k_buffer_addr
5fdeafcdf59d ath11k: Use macros for magic arguments
1ebe3fd25d83 ath11k: cast reo_desc directly to struct hal_tlv_hdr
ea713329999f ath11k: removing unnecessary parentheses

-- 
https://patchwork.kernel.org/patch/11007805/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
