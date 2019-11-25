Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-55.smtp-out.us-west-2.amazonses.com ([54.240.27.55])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZGjK-0007tE-CW
 for ath11k@lists.infradead.org; Mon, 25 Nov 2019 15:56:51 +0000
MIME-Version: 1.0
Subject: Re: [PATCH V2 1/2] ath11k: Move mac80211 hw allocation before
 wmi_init command
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <0101016e7e0163d4-8af9866a-85f0-4aa5-9548-3f0b48ccc308-000000@us-west-2.amazonses.com>
References: <0101016e7e0163d4-8af9866a-85f0-4aa5-9548-3f0b48ccc308-000000@us-west-2.amazonses.com>
Message-ID: <0101016ea3478bf0-b2cdb53b-78d1-4f23-900b-147e73ac1ebd-000000@us-west-2.amazonses.com>
Date: Mon, 25 Nov 2019 15:56:45 +0000
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
To: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
Cc: ath11k@lists.infradead.org

Vasanthakumar Thiagarajan <vthiagar@codeaurora.org> wrote:

> This is to prepare REO ring setup before sending wmi_init command.
> Firmware expects all the required REO rings to be setup while processing
> wmi_init command. But as per the current initialization sequence, REO ring
> configurations are done only after wmi_init command is sent.
> Also refactoring ath11k_mac_create() into ath11k_mac_alloc() and
> ath11k_mac_register() to it mac80211 hw structure available before sending
> wmi_init command.
> 
> Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

2 patches applied to ath11k-post-bringup branch of ath.git, thanks.

d081cc9a597f ath11k: Move mac80211 hw allocation before wmi_init command
1cf99e7b6632 ath11k: Setup REO destination ring before sending wmi_init command

-- 
https://patchwork.kernel.org/patch/11249275/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
