Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jE5yH-00009h-34
 for ath11k@lists.infradead.org; Tue, 17 Mar 2020 06:45:02 +0000
MIME-Version: 1.0
Subject: Re: [PATCH V3 3/4] ath11k: add WMI calls required for handling BSS
 color
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20191217141921.8114-3-john@phrozen.org>
References: <20191217141921.8114-3-john@phrozen.org>
Message-Id: <20200317064500.9F973C433BA@smtp.codeaurora.org>
Date: Tue, 17 Mar 2020 06:45:00 +0000 (UTC)
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

2 patches applied to ath-next branch of ath.git, thanks.

5a032c8d1953 ath11k: add WMI calls required for handling BSS color
beb2f77297b0 ath11k: add handling for BSS color

-- 
https://patchwork.kernel.org/patch/11297707/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
