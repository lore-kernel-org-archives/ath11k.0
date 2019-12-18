Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihXyA-00062W-CX
 for ath11k@lists.infradead.org; Wed, 18 Dec 2019 11:58:23 +0000
MIME-Version: 1.0
Subject: Re: [PATCH V2] ath11k: add OMI debug support
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20191205062812.6208-1-john@phrozen.org>
References: <20191205062812.6208-1-john@phrozen.org>
Message-Id: <20191218115821.05AADC433A2@smtp.codeaurora.org>
Date: Wed, 18 Dec 2019 11:58:21 +0000 (UTC)
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

> This patch allows us to initiate a OMI transaction for test purposes using
> a debugfs interface. the xmit_omi file expects 9 parameters. The first two
> are VHT and HE followed by the 7 A-Control fields from D4.0/9.2.4.6a.2.
> 
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

This had new warnings, fixed in pending branch:

drivers/net/wireless/ath/ath11k/wmi.c:5718: line over 90 characters
drivers/net/wireless/ath/ath11k/wmi.c:5739: line over 90 characters

-- 
https://patchwork.kernel.org/patch/11274229/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
