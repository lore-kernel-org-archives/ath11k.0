Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hW0O6-0006tw-Tl
 for ath11k@lists.infradead.org; Wed, 29 May 2019 15:21:12 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 1/4] ath11k: reset qos control bit after stripping qos
 field in iee80211_hdr
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1559080376-26817-2-git-send-email-pradeepc@codeaurora.org>
References: <1559080376-26817-2-git-send-email-pradeepc@codeaurora.org>
Message-Id: <20190529152110.8E47E6087B@smtp.codeaurora.org>
Date: Wed, 29 May 2019 15:21:10 +0000 (UTC)
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
Cc: ath11k@lists.infradead.org

Pradeep Kumar Chitrapu <pradeepc@codeaurora.org> wrote:

> fix resetting qos control bit in frame control when qos control field
> is stripped from native wifi packet.
> 
> Signed-off-by: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>

4 patches applied to ath.git, thanks.

e10d09bc1c2f ath11k: reset qos control bit after stripping qos field in iee80211_hdr
291848e1edc1 ath11k: pad mic len for protected action frames
28c2a93e7c41 ath11k: fix multicast txrx for secure 11s mesh support
5710b3f7f0f9 ath11k: fix action frame rx processing

-- 
https://patchwork.kernel.org/patch/10965859/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
