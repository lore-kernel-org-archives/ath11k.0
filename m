Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hTl94-0006bk-KI
 for ath11k@lists.infradead.org; Thu, 23 May 2019 10:40:23 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH V5 1/8] mac80211: propagate HE operation info into
 ieee80211_sta
References: <20190520085508.5888-1-john@phrozen.org>
 <20190520085508.5888-2-john@phrozen.org>
Date: Thu, 23 May 2019 13:40:14 +0300
In-Reply-To: <20190520085508.5888-2-john@phrozen.org> (John Crispin's message
 of "Mon, 20 May 2019 10:55:01 +0200")
Message-ID: <87woihcv3l.fsf@kamboji.qca.qualcomm.com>
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
Cc: ath11k@lists.infradead.org, Shashidhar Lakkavalli <slakkavalli@datto.com>

(dropping linux-wireless)

John Crispin <john@phrozen.org> writes:

> Upon a successful assoc a station shall store the content of the HE
> operation element inside ieee80211_sta so that the driver can setup the
> hardware accordingly.
>
> Signed-off-by: Shashidhar Lakkavalli <slakkavalli@datto.com>
> Signed-off-by: John Crispin <john@phrozen.org>

As this patch is not yet in ath11k-bringup branch (it's not even in
mac80211-next yet) my plan is that I will apply this to ath11k-bringup
branch with prefix "NOTUPSTREAM:" so that it's easy to find when I'm
merging patches from upstream and solving conflicts.

-- 
Kalle Valo

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
