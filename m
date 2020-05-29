Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jegKP-0002Hv-B6
 for ath11k@lists.infradead.org; Fri, 29 May 2020 14:49:51 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] ath11k: Add peer max mpdu parameter in peer assoc
 command
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1588611900-21185-2-git-send-email-tamizhr@codeaurora.org>
References: <1588611900-21185-2-git-send-email-tamizhr@codeaurora.org>
Message-Id: <20200529144936.CA463C433C6@smtp.codeaurora.org>
Date: Fri, 29 May 2020 14:49:36 +0000 (UTC)
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
To: Tamizh Chelvam <tamizhr@codeaurora.org>
Cc: johannes@sipsolutions.net, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Tamizh Chelvam <tamizhr@codeaurora.org> wrote:

> Add peer max mpdu length configuration support in peer_assoc_he
> parameters. Noticed low throughput for the STA which
> supports HE, HT and not VHT in MU-MIMO case without this
> configuration
> 
> Signed-off-by: Tamizh Chelvam <tamizhr@codeaurora.org>

Depends on:

fedd0fe4e89b mac80211: Add new AMPDU factor macro for HE peer caps

Currently in mac80211-next.

-- 
https://patchwork.kernel.org/patch/11526769/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
