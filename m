Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-21.smtp-out.us-west-2.amazonses.com ([54.240.27.21])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iejPl-0002jL-HN
 for ath11k@lists.infradead.org; Tue, 10 Dec 2019 17:35:15 +0000
MIME-Version: 1.0
Subject: Re: [RESEND 1/9] ath11k: add wmi helper for turning STA PS on/off
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20191204053713.3064-2-john@phrozen.org>
References: <20191204053713.3064-2-john@phrozen.org>
Message-ID: <0101016ef0e10cee-df4807d0-d613-402b-8574-39e7afd6a1a8-000000@us-west-2.amazonses.com>
Date: Tue, 10 Dec 2019 17:35:11 +0000
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
To: John Crispin <john@phrozen.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

John Crispin <john@phrozen.org> wrote:

> Add a WMI call helper to set the powersave mode of a STA interface.
> 
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

There were few new warnings:

drivers/net/wireless/ath/ath11k/debugfs_sta.c: In function 'ath11k_update_per_peer_stats_from_txcompl':
drivers/net/wireless/ath/ath11k/debugfs_sta.c:138:6: warning: variable 'num_tones_in_ru' set but not used [-Wunused-but-set-variable]
drivers/net/wireless/ath/ath11k/debug.c:122: line over 90 characters
drivers/net/wireless/ath/ath11k/dp_tx.c:472: line over 90 characters
drivers/net/wireless/ath/ath11k/wmi.c:5669: char * array declaration might be better as static const

-- 
https://patchwork.kernel.org/patch/11272115/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
