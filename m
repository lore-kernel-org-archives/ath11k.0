Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jkqBx-0002EM-12
 for ath11k@lists.infradead.org; Mon, 15 Jun 2020 14:34:31 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: fix wmi peer flags in peer assoc command
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1591771841-25503-1-git-send-email-vnaralas@codeaurora.org>
References: <1591771841-25503-1-git-send-email-vnaralas@codeaurora.org>
Message-Id: <20200615143427.260A5C433CB@smtp.codeaurora.org>
Date: Mon, 15 Jun 2020 14:34:27 +0000 (UTC)
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
To: Venkateswara Naralasetty <vnaralas@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Venkateswara Naralasetty <vnaralas@codeaurora.org> wrote:

> Currently need ptk/gtk wmi peer flags in wmi peer assoc cmd
> are set based on the rsnie and wpaie of the bss from the bss list.
> Since this bss list is not updated with current BSSID for AP mode,
> we may not find bss from the bss list. Which results in ptk/gtk peer
> flags are not set in the wmi peer assoc cmd. Due to this EAPOL frames
> are going in data rates instead of management rates.
> 
> Tested-on: IPQ8074 WLAN.HK.2.1.0.1-01228-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Venkateswara Naralasetty <vnaralas@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

01e34233c645 ath11k: fix wmi peer flags in peer assoc command

-- 
https://patchwork.kernel.org/patch/11597241/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
