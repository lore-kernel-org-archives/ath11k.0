Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihXkm-00081o-UT
 for ath11k@lists.infradead.org; Wed, 18 Dec 2019 11:44:34 +0000
MIME-Version: 1.0
Subject: Re: [PATCH V3 8/9] ath11k: optimise ath11k_dp_tx_completion_handler
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20191213153839.12372-9-john@phrozen.org>
References: <20191213153839.12372-9-john@phrozen.org>
Message-Id: <20191218114430.2D846C43383@smtp.codeaurora.org>
Date: Wed, 18 Dec 2019 11:44:30 +0000 (UTC)
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
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

John Crispin <john@phrozen.org> wrote:

> the current code does 4 memcpys for each completion frame.
> 1) duplicate the desc
> 2 + 3) inside kfifo insertion
> 4) kfifo remove
> 
> The code simply drops the kfifo and uses a trivial ring buffer. This
> requires a single memcpy for insertion. There is no removal needed as
> we can simply use the inserted data for processing. As the code runs
> inside the NAPI context it is atomic and there is no need for most of
> the locking.
> 
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

This had a new warning, fixed in the pending branch:

drivers/net/wireless/ath/ath11k/dp_tx.c:441: line over 90 characters

-- 
https://patchwork.kernel.org/patch/11290755/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
