Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOcwx-0002uO-Mn
 for ath11k@lists.infradead.org; Wed, 15 Apr 2020 07:59:13 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Cleanup in pdev destroy and mac register during
 crash on recovery
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1586538405-16226-1-git-send-email-mkenna@codeaurora.org>
References: <1586538405-16226-1-git-send-email-mkenna@codeaurora.org>
Message-Id: <20200415075908.442DCC432C2@smtp.codeaurora.org>
Date: Wed, 15 Apr 2020 07:59:08 +0000 (UTC)
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
To: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Maharaja Kennadyrajan <mkenna@codeaurora.org> wrote:

> Debugfs pdev entries should be cleaned up during the crash
> on recovery. If not, mac register will fail for the reason
> that it is already registered during core reconfigure.
> 
> Signed-off-by: Maharaja Kennadyrajan <mkenna@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

6fc3b94ef596 ath11k: Cleanup in pdev destroy and mac register during crash on recovery

-- 
https://patchwork.kernel.org/patch/11483477/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
