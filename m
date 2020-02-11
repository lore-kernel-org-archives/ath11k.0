Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail25.static.mailgun.info ([104.130.122.25])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1VOM-0006aO-HD
 for ath11k@lists.infradead.org; Tue, 11 Feb 2020 13:15:56 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH V2 3/3] ath11k: add support for setting fixed HE
 rate/gi/ltf
References: <20200204103514.18111-1-john@phrozen.org>
 <20200204103514.18111-3-john@phrozen.org>
Date: Tue, 11 Feb 2020 15:15:43 +0200
In-Reply-To: <20200204103514.18111-3-john@phrozen.org> (John Crispin's message
 of "Tue, 4 Feb 2020 11:35:14 +0100")
Message-ID: <87d0alxo1s.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
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
Cc: Miles Hu <milehu@codeaurora.org>, Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

John Crispin <john@phrozen.org> writes:

> From: Miles Hu <milehu@codeaurora.org>
>
> This patch adds ath11k support for setting fixed HE rate/gi/ltf values that
> we are now able to send to the kernel using nl80211. The added code is
> reusing parts of the existing code path already used for HT/VHT. The new
> helpers are symmetric to how we do it for HT/VHT.
>
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Miles Hu <milehu@codeaurora.org>

s-o-b lines in incorrect order, Miles' tag (being the author) should be
first.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
