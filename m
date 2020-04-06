Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jLUOL-0002h8-DU
 for ath11k@lists.infradead.org; Mon, 06 Apr 2020 16:14:33 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v3] ath11k: Add sta debugfs support to configure ADDBA and
 DELBA
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1585213026-28406-1-git-send-email-mkenna@codeaurora.org>
References: <1585213026-28406-1-git-send-email-mkenna@codeaurora.org>
Message-Id: <20200406161414.A3400C43637@smtp.codeaurora.org>
Date: Mon,  6 Apr 2020 16:14:14 +0000 (UTC)
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
To: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Maharaja Kennadyrajan <mkenna@codeaurora.org> wrote:

> Add support to test aggregation procedures (addba/addba_resp/delba)
> manually by adding the required callbacks in sta debugfs files.
> 
> To enable automatic aggregation in target,
> 
>     echo 0 > /sys/kernel/debug/ieee80211/phyX/netdev:wlanX/
> 	     stations/XX:XX:XX:XX:XX:XX/aggr_mode
> 
> For manual mode,
> 
>     echo 1 > /sys/kernel/debug/ieee80211/phyX/netdev:wlanX/
> 	     stations/XX:XX:XX:XX:XX:XX/aggr_mode
> 
> To send addba response,
>     echo 0 25 > /sys/kernel/debug/ieee80211/phyX/netdev:wlanX/
> 		stations/XX:XX:XX:XX:XX:XX/addba_resp
> 
> To send addba,
>     echo 1 32 > /sys/kernel/debug/ieee80211/phyX/netdev:wlanX/
> 		stations/XX:XX:XX:XX:XX:XX/addba
> 
> To send delba,
>     echo 0 1 37 > /sys/kernel/debug/ieee80211/phyX/netdev:wlanX/
> 		  stations/XX:XX:XX:XX:XX:XX/delba
> 
> Signed-off-by: Maharaja Kennadyrajan <mkenna@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

9556dfa28b4d ath11k: Add sta debugfs support to configure ADDBA and DELBA

-- 
https://patchwork.kernel.org/patch/11459699/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
