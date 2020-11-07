Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbJF0-0008Pp-O9
 for ath11k@lists.infradead.org; Sat, 07 Nov 2020 08:06:38 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: fix wmi init configuration
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1604512020-25197-1-git-send-email-periyasa@codeaurora.org>
References: <1604512020-25197-1-git-send-email-periyasa@codeaurora.org>
Message-Id: <20201107080550.79816C433CB@smtp.codeaurora.org>
Date: Sat,  7 Nov 2020 08:05:50 +0000 (UTC)
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

> Assign the correct hw_op ath11k_init_wmi_config_ipq8074 to
> the hw IPQ8074. Also update the correct TWT radio count.
> Incorrect TWT radio count cause TWT feature fails on radio2
> because physical device count is hardcoded to 2. so set
> the value dynamically.
> 
> Found this during code review.
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.1.0.1-01238-QCAHKSWPL_SILICONZ-2
> 
> Fixes: 2d4bcbed5b7d53e1 ("ath11k: initialize wmi config based on hw_params")
> Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

36c7c640ffeb ath11k: fix wmi init configuration

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1604512020-25197-1-git-send-email-periyasa@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
