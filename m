Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0AoD-0002Se-FI
 for ath11k@lists.infradead.org; Tue, 20 Aug 2019 20:32:50 +0000
Message-ID: <0c526ce00e6e1c7731c990515e7438230efb55af.camel@sipsolutions.net>
Subject: Re: [PATCH 08/49] ath11k: add core.c
From: Johannes Berg <johannes@sipsolutions.net>
Date: Tue, 20 Aug 2019 22:32:45 +0200
In-Reply-To: <1566316095-27507-9-git-send-email-kvalo@codeaurora.org>
 (sfid-20190820_175156_803421_4FF79584)
References: <1566316095-27507-1-git-send-email-kvalo@codeaurora.org>
 <1566316095-27507-9-git-send-email-kvalo@codeaurora.org>
 (sfid-20190820_175156_803421_4FF79584)
MIME-Version: 1.0
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
To: Kalle Valo <kvalo@codeaurora.org>, linux-wireless@vger.kernel.org
Cc: devicetree@vger.kernel.org, ath11k@lists.infradead.org


> +module_param_named(debug_mask, ath11k_debug_mask, uint, 0644);
> +
> +MODULE_PARM_DESC(debug_mask, "Debugging mask");
> +
> +static const struct ath11k_hw_params ath11k_hw_params = {
> +			.name = "ipq8074",

indentation here seems a bit too much

> +MODULE_LICENSE("Dual BSD/GPL");

All your files state "ISC", shouldn't that be reflected here?

johannes


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
