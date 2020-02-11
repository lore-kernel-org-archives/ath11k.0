Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail25.static.mailgun.info ([104.130.122.25])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1VgQ-0004EU-Qs
 for ath11k@lists.infradead.org; Tue, 11 Feb 2020 13:34:38 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 1/2] ath11k: add thermal cooling device support
References: <1580860830-12696-1-git-send-email-pradeepc@codeaurora.org>
Date: Tue, 11 Feb 2020 15:34:25 +0200
In-Reply-To: <1580860830-12696-1-git-send-email-pradeepc@codeaurora.org>
 (Pradeep Kumar Chitrapu's message of "Wed, 5 Feb 2020 05:30:29 +0530")
Message-ID: <874kvxxn6m.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
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
To: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Pradeep Kumar Chitrapu <pradeepc@codeaurora.org> writes:

> Thermal cooling device support is added to control the temperature by
> throttling the data transmission for the given duration. Throttling is
> done by suspending all data tx queues by given percentage of time. The
> thermal device allows user to configure duty cycle.
>
> Throttling can be disabled by setting the duty cycle to 0. The cooling
> device can be found under /sys/class/thermal/cooling_deviceX/.
> Corresponding soft link to this device can be found under phy folder.
>
> /sys/class/ieee80211/phy*/device/cooling_device.
>
> To set duty cycle as 40%,
>
> echo 40 >/sys/class/ieee80211/phy*/device/cooling_device/cur_state
>
> Signed-off-by: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>

[...]

> +++ b/drivers/net/wireless/ath/ath11k/thermal.h
> @@ -0,0 +1,40 @@
> +// SPDX-License-Identifier: BSD-3-Clause-Clear

This had a warning:

drivers/net/wireless/ath/ath11k/thermal.h:1: Improper SPDX comment style for 'drivers/net/wireless/ath/ath11k/thermal.h', please use '/*' instead
drivers/net/wireless/ath/ath11k/thermal.h:1: Missing or malformed SPDX-License-Identifier tag in line 1

I fixed that in the pending branch.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
