Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKcyw-0008PX-Vl
 for ath11k@lists.infradead.org; Tue, 22 Sep 2020 07:45:01 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: remove redundant num_keep_alive_pattern assignment
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1600361190-22047-1-git-send-email-kvalo@codeaurora.org>
References: <1600361190-22047-1-git-send-email-kvalo@codeaurora.org>
Message-Id: <20200922074448.D1575C433F1@smtp.codeaurora.org>
Date: Tue, 22 Sep 2020 07:44:48 +0000 (UTC)
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

> There were two asignments to num_keep_alive_pattern, remove the first one which is wrong.
> 
> No functional changes. Compile tested only.
> 
> Reported-by: Colin Ian King <colin.king@canonical.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

9883c0d075f1 ath11k: remove redundant num_keep_alive_pattern assignment

-- 
https://patchwork.kernel.org/patch/11782897/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
