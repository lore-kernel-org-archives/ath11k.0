Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from so254-31.mailgun.net ([198.61.254.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmtWW-0000gB-TG
 for ath11k@lists.infradead.org; Wed, 09 Dec 2020 07:04:31 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: unlock on error path in
 ath11k_mac_op_add_interface()
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <X85sVGVP/0XvlrEJ@mwanda>
References: <X85sVGVP/0XvlrEJ@mwanda>
Message-Id: <20201209070420.911F9C43465@smtp.codeaurora.org>
Date: Wed,  9 Dec 2020 07:04:20 +0000 (UTC)
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
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Ritesh Singh <ritesi@codeaurora.org>, Maharaja Kennadyrajan <mkenna@codeaurora.org>, kernel-janitors@vger.kernel.org, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Dan Carpenter <dan.carpenter@oracle.com> wrote:

> These error paths need to drop the &ar->conf_mutex before returning.
> 
> Fixes: 690ace20ff79 ("ath11k: peer delete synchronization with firmware")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

59ec8e2fa5aa ath11k: unlock on error path in ath11k_mac_op_add_interface()

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/X85sVGVP/0XvlrEJ@mwanda/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
