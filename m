Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbJEw-0008Pp-S8
 for ath11k@lists.infradead.org; Sat, 07 Nov 2020 08:06:27 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Add new dfs region name for JP
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1604563475-5782-1-git-send-email-lavaks@codeaurora.org>
References: <1604563475-5782-1-git-send-email-lavaks@codeaurora.org>
Message-Id: <20201107080626.2D508C433C9@smtp.codeaurora.org>
Date: Sat,  7 Nov 2020 08:06:26 +0000 (UTC)
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
To: Lavanya Suresh <lavaks@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Lavanya Suresh <lavaks@codeaurora.org> wrote:

> Japan has new Radar types as per latest regulatory,
> included under MKK_N in FW. So adding new enum in
> ath11k to support it.
> 
> Tested-on: IPQ8074 hw2.0 PCI WLAN.HK.2.4.0.1-00041-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Lavanya Suresh <lavaks@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

47f1a84e2451 ath11k: Add new dfs region name for JP

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1604563475-5782-1-git-send-email-lavaks@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
