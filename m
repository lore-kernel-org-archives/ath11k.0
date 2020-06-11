Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jjFPr-0007jJ-SJ
 for ath11k@lists.infradead.org; Thu, 11 Jun 2020 05:06:21 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v5 1/8] ath11k: add 6G frequency list supported by driver
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20200603001724.12161-2-pradeepc@codeaurora.org>
References: <20200603001724.12161-2-pradeepc@codeaurora.org>
Message-Id: <20200611050600.E408EC43391@smtp.codeaurora.org>
Date: Thu, 11 Jun 2020 05:06:00 +0000 (UTC)
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

> This patch adds support for 6GHz frequency listing.
> 
> Signed-off-by: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

8 patches applied to ath-next branch of ath.git, thanks.

c5625abaf826 ath11k: add 6G frequency list supported by driver
22eeadcdeab6 ath11k: add support for 6GHz radio in driver
5dcf42f8b79d ath11k: Use freq instead of channel number in rx path
91270d709b21 ath11k: extend peer_assoc_cmd for 6GHz band
d387503df0cd ath11k: set psc channel flag when sending channel list to firmware.
194b8ea1ce5a ath11k: Add 6G scan dwell time parameter in scan request command
bff621fd113f ath11k: Send multiple scan_chan_list messages if required
74601ecfef6e ath11k: Add support for 6g scan hint

-- 
https://patchwork.kernel.org/patch/11584701/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
