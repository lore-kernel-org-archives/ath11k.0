Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kO4Cp-0003ge-9c
 for ath11k@lists.infradead.org; Thu, 01 Oct 2020 19:25:35 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: mac: fix parenthesis alignment
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1601369160-1252-1-git-send-email-kvalo@codeaurora.org>
References: <1601369160-1252-1-git-send-email-kvalo@codeaurora.org>
Message-Id: <20201001192528.52F17C433F1@smtp.codeaurora.org>
Date: Thu,  1 Oct 2020 19:25:28 +0000 (UTC)
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Kalle Valo <kvalo@codeaurora.org> wrote:

> Commit 6aea26ce5a4c ("mac80211: rework tx encapsulation offload API")
> introduced a new checkpatch warning:
> 
> drivers/net/wireless/ath/ath11k/mac.c:4354: Alignment should match open parenthesis
> 
> Fix that.
> 
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

cd19836a6cea ath11k: mac: fix parenthesis alignment

-- 
https://patchwork.kernel.org/patch/11805287/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
