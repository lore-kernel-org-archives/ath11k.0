Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail25.static.mailgun.info ([104.130.122.25])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ivfT2-0001xu-Br
 for ath11k@lists.infradead.org; Sun, 26 Jan 2020 10:48:37 +0000
MIME-Version: 1.0
Subject: Re: [PATCH][next] ath11k: avoid null pointer dereference when pointer
 band is null
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20200111090824.9999-1-colin.king@canonical.com>
References: <20200111090824.9999-1-colin.king@canonical.com>
Message-Id: <20200126104834.2D046C433A2@smtp.codeaurora.org>
Date: Sun, 26 Jan 2020 10:48:34 +0000 (UTC)
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
To: Colin King <colin.king@canonical.com>
Cc: kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, John Crispin <john@phrozen.org>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, Shashidhar Lakkavalli <slakkavalli@datto.com>, ath11k@lists.infradead.org

Colin King <colin.king@canonical.com> wrote:

> In the unlikely event that cap->supported_bands has neither
> WMI_HOST_WLAN_2G_CAP set or WMI_HOST_WLAN_5G_CAP set then pointer
> band is null and a null dereference occurs when assigning
> band->n_iftype_data.  Move the assignment to the if blocks to
> avoid this.  Cleans up static analysis warnings.
> 
> Addresses-Coverity: ("Explicit null dereference")
> Fixes: 9f056ed8ee01 ("ath11k: add HE support")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

3b4516838eaa ath11k: avoid null pointer dereference when pointer band is null

-- 
https://patchwork.kernel.org/patch/11328755/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
