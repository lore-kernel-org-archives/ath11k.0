Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jiJuL-0006at-8J
 for ath11k@lists.infradead.org; Mon, 08 Jun 2020 15:41:54 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v5 1/8] ath11k: add 6G frequency list supported by driver
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20200603001724.12161-2-pradeepc@codeaurora.org>
References: <20200603001724.12161-2-pradeepc@codeaurora.org>
Message-Id: <20200608154152.28DE2C43387@smtp.codeaurora.org>
Date: Mon,  8 Jun 2020 15:41:52 +0000 (UTC)
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
To: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Pradeep Kumar Chitrapu <pradeepc@codeaurora.org> wrote:

> This patch adds support for 6GHz frequency listing.
> 
> Signed-off-by: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

This patchset had new warnings which I fixed in the pending branch:

drivers/net/wireless/ath/ath11k/dp_rx.c:2178: braces {} should be used on all arms of this statement
drivers/net/wireless/ath/ath11k/mac.c:3749: Blank lines aren't necessary before a close brace '}'
drivers/net/wireless/ath/ath11k/mac.c:4197: Blank lines aren't necessary before a close brace '}'

-- 
https://patchwork.kernel.org/patch/11584701/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
