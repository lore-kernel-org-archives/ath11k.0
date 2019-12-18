Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail25.static.mailgun.info ([104.130.122.25])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihXHz-0001Ut-Cs
 for ath11k@lists.infradead.org; Wed, 18 Dec 2019 11:14:48 +0000
MIME-Version: 1.0
Subject: Re: [PATCH V3 5/9] ath11k: add WMI calls to manually
 add/del/pause/resume TWT dialogs
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20191213153839.12372-6-john@phrozen.org>
References: <20191213153839.12372-6-john@phrozen.org>
Message-Id: <20191218111443.C1C9FC43383@smtp.codeaurora.org>
Date: Wed, 18 Dec 2019 11:14:43 +0000 (UTC)
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

> These calls are used for debugging and will be required for WFA
> certification tests.
> 
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

This had two warnings, fixed in pending branch:

drivers/net/wireless/ath/ath11k/wmi.c:2625: quoted string split across lines
drivers/net/wireless/ath/ath11k/wmi.c:2626: quoted string split across lines

-- 
https://patchwork.kernel.org/patch/11290749/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
