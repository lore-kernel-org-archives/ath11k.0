Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hMBpE-0001G4-VW
 for ath11k@lists.infradead.org; Thu, 02 May 2019 13:32:38 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath11k: update the encoding before validation check
References: <1556081332-12586-1-git-send-email-periyasa@codeaurora.org>
Date: Thu, 02 May 2019 16:32:33 +0300
In-Reply-To: <1556081332-12586-1-git-send-email-periyasa@codeaurora.org>
 (Karthikeyan Periyasamy's message of "Wed, 24 Apr 2019 10:18:52
 +0530")
Message-ID: <87k1f9m172.fsf@kamboji.qca.qualcomm.com>
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
To: Karthikeyan Periyasamy <periyasa@codeaurora.org>
Cc: ath11k@lists.infradead.org

Karthikeyan Periyasamy <periyasa@codeaurora.org> writes:

> In the rate handler, when invalid rate occurs encoding is not
> updated. so the ieee80211_rx_status hold the default encoding
> (RX_ENC_LEGACY). Update the correct encoding before validation
> check, so that ieee80211_rx_status hold the correct encoding.
>
> Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>

Applied.

-- 
Kalle Valo

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
