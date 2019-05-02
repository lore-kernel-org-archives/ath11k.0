Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hMBnu-0001A5-DY
 for ath11k@lists.infradead.org; Thu, 02 May 2019 13:31:15 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath11k: Make the tx_status_fifo for each Tx completion
 ring
References: <1556081300-12538-1-git-send-email-periyasa@codeaurora.org>
Date: Thu, 02 May 2019 16:31:10 +0300
In-Reply-To: <1556081300-12538-1-git-send-email-periyasa@codeaurora.org>
 (Karthikeyan Periyasamy's message of "Wed, 24 Apr 2019 10:18:20
 +0530")
Message-ID: <87o94lm19d.fsf@kamboji.qca.qualcomm.com>
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

> tx_statu_fifo is allocated with DP_TX_COMP_RING_SIZE and used
> by three Tx completion ring, which get full when we start
> Tx with different AC packets. To avoid this resource error,
> Make the tx_status_fifo for each tx completion ring with
> DP_TX_COMP_RING_SIZE, so that Tx path will not encounter
> the resource full error.
>
> Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>

Applied.

-- 
Kalle Valo

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
