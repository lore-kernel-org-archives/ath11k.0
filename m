Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1ho4Rt-0007VB-3F
 for ath11k@lists.infradead.org; Thu, 18 Jul 2019 11:19:46 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Fix warnings that trigger during peer assoc when
 fixed rate is set
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1563288088-2821-1-git-send-email-srirrama@codeaurora.org>
References: <1563288088-2821-1-git-send-email-srirrama@codeaurora.org>
Message-Id: <20190718111944.BA7F860E3F@smtp.codeaurora.org>
Date: Thu, 18 Jul 2019 11:19:44 +0000 (UTC)
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
To: Sriram R <srirrama@codeaurora.org>
Cc: ath11k@lists.infradead.org

Sriram R <srirrama@codeaurora.org> wrote:

> When VHT fixed rate is set to MCS < 7, warnings are seen when a new sta
> gets associated while peer_assoc command is sent to firmware. This is
> seen since we expect tx_mcs_set sent to firmware as values corresponding
> to range 0-7, 0-8 or 0-9. Since the intersection of STA's VHT MCS support
> and current bitrate mask after fixed rate is set has MCS < 7 warning is
> thrown currently.
> Remove these warning for these cases as it's a valid scenario.
> For these cases, 0-7 MCS can be sent during peer assoc to firmware as
> this is followed by peer fixed rate setting.
> 
> Signed-off-by: Sriram R <srirrama@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath11k-bringup branch of ath.git, thanks.

2d7490549ec1 ath11k: Fix warnings that trigger during peer assoc when fixed rate is set

-- 
https://patchwork.kernel.org/patch/11046187/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
