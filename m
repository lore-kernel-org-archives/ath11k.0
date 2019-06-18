Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hdD9T-0004vu-UZ
 for ath11k@lists.infradead.org; Tue, 18 Jun 2019 12:23:53 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: set additional values inside
 wmi_peer_assoc_complete_cmd
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20190617130042.31734-1-john@phrozen.org>
References: <20190617130042.31734-1-john@phrozen.org>
Message-Id: <20190618122351.7239B608BA@smtp.codeaurora.org>
Date: Tue, 18 Jun 2019 12:23:51 +0000 (UTC)
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
Cc: Miles Hu <c_milehu@qti.qualcomm.com>, ath11k@lists.infradead.org

John Crispin <john@phrozen.org> wrote:

> The firmware can take 2 additional values for he_mac_cap that were not
> set yet.
> 
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath11k-bringup branch of ath.git, thanks.

10b1be5fc4b4 ath11k: set additional values inside wmi_peer_assoc_complete_cmd

-- 
https://patchwork.kernel.org/patch/10999229/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
