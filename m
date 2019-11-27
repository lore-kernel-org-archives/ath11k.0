Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-188.smtp-out.us-west-2.amazonses.com ([54.240.27.188])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZzXT-0005uf-N7
 for ath11k@lists.infradead.org; Wed, 27 Nov 2019 15:47:37 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 1/8] ath11k: add RX stats support for radiotap
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <0101016ea36bc1e7-b9c8f0c1-9781-4920-afa0-45684e8754cc-000000@us-west-2.amazonses.com>
References: <0101016ea36bc1e7-b9c8f0c1-9781-4920-afa0-45684e8754cc-000000@us-west-2.amazonses.com>
Message-ID: <0101016ead8bd7cd-2ad027a9-a447-4a4f-a69b-9e6eb8bb2e41-000000@us-west-2.amazonses.com>
Date: Wed, 27 Nov 2019 15:47:33 +0000
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Kalle Valo <kvalo@codeaurora.org> wrote:

> mac80211 expects the definition of what HE rate info is available inside a
> struct prepended to the skb.
> 
> Signed-off-by: Shashidhar Lakkavalli <slakkavalli@datto.com>
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

8 patches applied to ath-next branch of ath.git, thanks.

e4eb7b5c335c ath11k: add RX stats support for radiotap
9cfbae4632fa ath11k: ignore event 0x6017
2dab7d221e88 ath11k: convert message from info to dbg
39e81c6a2907 ath11k: fix missed bw conversion in tx completion
33782a3c379e ath11k: Remove dead code while handling amsdu packets
9f056ed8ee01 ath11k: add HE support
6d293d447670 ath11k: add TWT support
3f8be640077a ath11k: add spatial reuse support

-- 
https://patchwork.kernel.org/patch/11260591/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
