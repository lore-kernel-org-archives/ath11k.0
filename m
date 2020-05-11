Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jY6id-00074L-L8
 for ath11k@lists.infradead.org; Mon, 11 May 2020 11:35:39 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: fix htt stats module not handle multiple skbs
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1588698693-6218-1-git-send-email-pradeepc@codeaurora.org>
References: <1588698693-6218-1-git-send-email-pradeepc@codeaurora.org>
Message-Id: <20200511113512.9C2D8C4478F@smtp.codeaurora.org>
Date: Mon, 11 May 2020 11:35:12 +0000 (UTC)
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
Cc: Miles Hu <milehu@codeaurora.org>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Pradeep Kumar Chitrapu <pradeepc@codeaurora.org> wrote:

> HTT EXT stats comes in stream of TLVs spanning over multiple
> messages. Currently completion is being sent for each message
> which is creating a race where stats_req is being accessed
> for filling in second message after the memory is already
> freed in release operation. Fix this by issuing completion
> once all the messages are received and processed. Driver
> knows this info from DONE bit set in htt msg.
> 
> Also fix locking required for htt stats.
> 
> Co-developed-by: Miles Hu <milehu@codeaurora.org>
> Signed-off-by: Miles Hu <milehu@codeaurora.org>
> Signed-off-by: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Kbuild bot reported unlock missing in ath11k_write_htt_stats_reset(). Please
fix that and send v2.

-- 
https://patchwork.kernel.org/patch/11529687/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
