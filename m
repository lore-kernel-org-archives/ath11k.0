Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWDJk-0005v4-Iv
 for ath11k@lists.infradead.org; Wed, 06 May 2020 06:14:08 +0000
MIME-Version: 1.0
Subject: Re: [PATCH V2] ath11k: add tx hw 802.11 encapusaltion offloading
 support
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20200430152814.18481-1-john@phrozen.org>
References: <20200430152814.18481-1-john@phrozen.org>
Message-Id: <20200506061359.57E86C432C2@smtp.codeaurora.org>
Date: Wed,  6 May 2020 06:13:59 +0000 (UTC)
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
Cc: Shashidhar Lakkavalli <slakkavalli@datto.com>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

John Crispin <john@phrozen.org> wrote:

> This patch adds support for ethernet rxtx mode to the driver. The feature
> is enabled via a new module parameter. If enabled to driver will enable
> the feature on a per vif basis if all other requirements were met.
> 
> Signed-off-by: Shashidhar Lakkavalli <slakkavalli@datto.com>
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

e7f33e0c52c0 ath11k: add tx hw 802.11 encapsulation offloading support

-- 
https://patchwork.kernel.org/patch/11520703/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
