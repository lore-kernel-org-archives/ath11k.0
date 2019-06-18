Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hdDAC-0004zK-Dr
 for ath11k@lists.infradead.org; Tue, 18 Jun 2019 12:24:37 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] mac80211: fix ieee80211_he_oper_size() comment
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20190617130425.14014-1-john@phrozen.org>
References: <20190617130425.14014-1-john@phrozen.org>
Message-Id: <20190618122435.DF053606FC@smtp.codeaurora.org>
Date: Tue, 18 Jun 2019 12:24:35 +0000 (UTC)
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
To: John Crispin <john@phrozen.org>
Cc: ath11k@lists.infradead.org

John Crispin <john@phrozen.org> wrote:

> Johannes mentioned that the comment should not reference mac80211 as other
> subsystems might call the helper.
> 
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath11k-bringup branch of ath.git, thanks.

a2a012fb1b64 NOTUPSTREAM: mac80211: fix ieee80211_he_oper_size() comment

-- 
https://patchwork.kernel.org/patch/10999233/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
