Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jY7ew-0008FL-GB
 for ath11k@lists.infradead.org; Mon, 11 May 2020 12:35:54 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] ath11k: Add support for multibus support
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20200506094400.4740-2-govinds@codeaurora.org>
References: <20200506094400.4740-2-govinds@codeaurora.org>
Message-Id: <20200511123544.182DBC44788@smtp.codeaurora.org>
Date: Mon, 11 May 2020 12:35:43 +0000 (UTC)
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
To: Govind Singh <govinds@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Govind Singh <govinds@codeaurora.org> wrote:

> Current design supports only AHB interface for
> 11ax chipset. Refactor the code by adding hif layer
> for bus level abstraction to support  PCI based device.
> 
> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

3 patches applied to ath-next branch of ath.git, thanks.

31858805f91a ath11k: Add support for multibus support
630ad41c195c ath11k: Add drv private for bus opaque struct
27143fa93c3b ath11k: Remove bus layer includes from upper layer

-- 
https://patchwork.kernel.org/patch/11530873/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
