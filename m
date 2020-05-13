Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYtqt-0005I8-LT
 for ath11k@lists.infradead.org; Wed, 13 May 2020 16:03:39 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v2] ath11k: fix htt stats module not handle multiple skbs
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1589221074-28778-1-git-send-email-pradeepc@codeaurora.org>
References: <1589221074-28778-1-git-send-email-pradeepc@codeaurora.org>
Message-Id: <20200513160209.2BBDFC43637@smtp.codeaurora.org>
Date: Wed, 13 May 2020 16:02:09 +0000 (UTC)
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

Patch applied to ath-next branch of ath.git, thanks.

012f81456818 ath11k: fix htt stats module not handle multiple skbs

-- 
https://patchwork.kernel.org/patch/11541413/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
