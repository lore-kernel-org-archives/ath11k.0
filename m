Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKcy9-0008PX-Dk
 for ath11k@lists.infradead.org; Tue, 22 Sep 2020 07:44:16 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: wmi: remove redundant configuration values from
 init
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1600356507-29237-1-git-send-email-kvalo@codeaurora.org>
References: <1600356507-29237-1-git-send-email-kvalo@codeaurora.org>
Message-Id: <20200922074402.D360FC433CB@smtp.codeaurora.org>
Date: Tue, 22 Sep 2020 07:44:02 +0000 (UTC)
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
Cc: vnaralas@codeaurora.org, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Kalle Valo <kvalo@codeaurora.org> wrote:

> In commit 2d4bcbed5b7d ("ath11k: initialize wmi config based on hw_params") the
> wmi config initialisation was moved to hw_ops->wmi_init_config() but the old
> initialisation values were accidentally left to ath11k_wmi_cmd_init(). This
> is very confusing, so remove the redundant values.
> 
> And this was actually so confusing that in commit aa2092a9bab3 ("ath11k: add
> raw mode and software crypto support") I actually it caused a bug: when
> ATH11K_FLAG_RAW_MODE was enabled rx_decap_mode was assigned back to
> TARGET_DECAP_MODE_NATIVE_WIFI in ath11k_init_wmi_config_ipq8074(). Fix this at
> the same time.
> 
> Compile tested only.
> 
> Fixes: 2d4bcbed5b7d ("ath11k: initialize wmi config based on hw_params")
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

c695faf745f9 ath11k: wmi: remove redundant configuration values from init

-- 
https://patchwork.kernel.org/patch/11782889/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
