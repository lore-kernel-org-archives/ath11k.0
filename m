Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jSvoi-00019V-0J
 for ath11k@lists.infradead.org; Mon, 27 Apr 2020 04:56:29 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: fix reo flush send
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1587552378-4884-1-git-send-email-periyasa@codeaurora.org>
References: <1587552378-4884-1-git-send-email-periyasa@codeaurora.org>
Message-Id: <20200427045626.284DBC433D2@smtp.codeaurora.org>
Date: Mon, 27 Apr 2020 04:56:26 +0000 (UTC)
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
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Karthikeyan Periyasamy <periyasa@codeaurora.org> wrote:

> we are sending the reo flush command for the deleted peer
> tid after the ageout period reaches 1 second. This handling
> causes reo ring get full when more than 128 clients are
> disconnected continuously. so added the count for flush list
> and reo flush command is triggered after the list count reaches
> the threshold value, it is configured as 64 (half of the reo ring).
> This will avoid the situation where reo ring get full.
> 
> Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

5cb899dd5ba4 ath11k: fix reo flush send

-- 
https://patchwork.kernel.org/patch/11503445/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
