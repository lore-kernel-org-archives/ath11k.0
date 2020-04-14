Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOGwv-00078o-2W
 for ath11k@lists.infradead.org; Tue, 14 Apr 2020 08:29:42 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Modify the interrupt timer threshold
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1586343957-21474-1-git-send-email-periyasa@codeaurora.org>
References: <1586343957-21474-1-git-send-email-periyasa@codeaurora.org>
Message-Id: <20200414082937.B1A5EC43636@smtp.codeaurora.org>
Date: Tue, 14 Apr 2020 08:29:37 +0000 (UTC)
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

> Modify the interrupt timer threshold param as 256 to avoid HW watchdog
> in heavy multicast traffic scenario.
> 
> Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

bd902b1bdb25 ath11k: Modify the interrupt timer threshold

-- 
https://patchwork.kernel.org/patch/11479789/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
