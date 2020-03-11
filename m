Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jC4WV-0001yT-Oq
 for ath11k@lists.infradead.org; Wed, 11 Mar 2020 16:48:02 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/2] ath11k: add thermal cooling device support
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1581726322-29658-1-git-send-email-pradeepc@codeaurora.org>
References: <1581726322-29658-1-git-send-email-pradeepc@codeaurora.org>
Message-Id: <20200311164757.9A087C432C2@smtp.codeaurora.org>
Date: Wed, 11 Mar 2020 16:47:57 +0000 (UTC)
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

Pradeep Kumar Chitrapu <pradeepc@codeaurora.org> wrote:

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
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

2 patches applied to ath-next branch of ath.git, thanks.

2a63bbca06b2 ath11k: add thermal cooling device support
a41d10348b01 ath11k: add thermal sensor device support

-- 
https://patchwork.kernel.org/patch/11383647/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
