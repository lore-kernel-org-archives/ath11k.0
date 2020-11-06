Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kavOT-0007O0-2s
 for ath11k@lists.infradead.org; Fri, 06 Nov 2020 06:38:41 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: FILS discovery and unsolicited broadcast probe
 response support
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20201007204036.19780-1-alokad@codeaurora.org>
References: <20201007204036.19780-1-alokad@codeaurora.org>
Message-Id: <20201106063839.8A6A4C433C9@smtp.codeaurora.org>
Date: Fri,  6 Nov 2020 06:38:39 +0000 (UTC)
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
To: Aloka Dixit <alokad@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Aloka Dixit <alokad@codeaurora.org> wrote:

> This patch adds driver support for FILS discovery and unsolicited
> broadcast probe response transmission features which are used for
> in-band discovery in 6GHz band.
> Currently this support is enabled only in 6GHz by setting hardware flags.
> 
> Changes include WMI commands to enable transmission, set packet
> interval, set template, and handle events.
> 
> Signed-off-by: Aloka Dixit <alokad@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

047679e366b9 ath11k: FILS discovery and unsolicited broadcast probe response support

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20201007204036.19780-1-alokad@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
