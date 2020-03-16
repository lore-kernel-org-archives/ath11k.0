Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jDj67-00054U-Oh
 for ath11k@lists.infradead.org; Mon, 16 Mar 2020 06:19:37 +0000
MIME-Version: 1.0
Subject: Re: [PATCH V3 3/4] ath11k: add WMI calls required for handling BSS
 color
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20191217141921.8114-3-john@phrozen.org>
References: <20191217141921.8114-3-john@phrozen.org>
Message-Id: <20200316061912.E2F60C433BA@smtp.codeaurora.org>
Date: Mon, 16 Mar 2020 06:19:12 +0000 (UTC)
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
Cc: Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

John Crispin <john@phrozen.org> wrote:

> If the he_operation field of the beacon sets a BSS color, we need to inform
> the FW of the settings. This patch adds the WMI command handlers required
> to do so.
> 
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

There were trivial conflicts in wmi.h and some checkpatch warnings, fixed those
in the pending branch.

-- 
https://patchwork.kernel.org/patch/11297707/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
